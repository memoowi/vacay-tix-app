import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/user_model.dart';
import 'package:vacay_tix/utils/config.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SetInitialAuthEvent>((event, emit) async {
      String? _token = await getToken();

      if (_token != null) {
        UserModel? user = await checkTokenValidity(_token);
        if (user != null) {
          emit(AuthSuccess(_token, user));
        } else {
          deleteToken();
          emit(AuthError('Invalid token'));
        }
      } else {
        emit(AuthInitial());
      }
    });

    on<LoginEvent>((event, emit) {
      String username = event.username;
      String password = event.password;

      // TODO: Add login logic here
    });

    on<RegisterEvent>((event, emit) {
      String name = event.name;
      String username = event.username;
      String email = event.email;
      String password = event.password;
    });

    on<LogoutEvent>((event, emit) {
      // TODO: Add logout logic here
    });
  }

  final Dio dio = Dio();
  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? token = prefs.getString('token');

    return token;
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('token', token);
  }

  Future<void> deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('token');
  }

  Future<UserModel?> checkTokenValidity(String token) async {
    try {
      final response = await dio.get(
        Config.userUrl,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        UserModel userModel = UserModel.fromJson(response.data);
        return userModel;
      } else {
        return null;
      }
    } on DioException catch (e) {
      print(e);
      return null;
    }
  }
}
