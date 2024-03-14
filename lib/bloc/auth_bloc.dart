import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/auth_model.dart';
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
        // print('user: $user, token: $_token');
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

    on<LoginEvent>((event, emit) async {
      String username = event.username;
      String password = event.password;

      try {
        final response = await dio.post(Config.loginUrl, data: {
          'username': username,
          'password': password,
        });

        // print('Login Response: ${response.statusCode} ${response.data}');

        if (response.statusCode == 200) {
          String token = AuthModel.fromJson(response.data).accessToken!;
          UserModel? user = await checkTokenValidity(token);
          if (user != null) {
            saveToken(token);
            emit(AuthSuccess(token, user));
          } else {
            emit(AuthError('Invalid token'));
          }
        }
      } on DioException catch (e) {
        // print(e);
        if (e.response?.statusCode == 401 || e.response?.statusCode == 404) {
          String message = AuthModel.fromJson(e.response?.data).message!;
          emit(AuthError(message));
        } else {
          emit(AuthError(e.toString()));
        }
      }
    });

    on<RegisterEvent>((event, emit) async {
      String name = event.name;
      String username = event.username;
      String email = event.email;
      String password = event.password;

      try {
        final response = await dio.post(Config.registerUrl, data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        });

        if (response.statusCode == 201) {
          String token = AuthModel.fromJson(response.data).accessToken!;
          UserModel? user = await checkTokenValidity(token);
          if (user != null) {
            saveToken(token);
            emit(AuthSuccess(token, user));
          } else {
            emit(AuthError('Invalid token'));
          }
        }
      } on DioException catch (e) {
        // STILL CONFUSED
        if (e.response?.statusCode == 422) {
          var messages = e.response?.data['message'].toList();

          for (var message in messages!) {
            emit(AuthError(message));
          }
        } else {
          emit(AuthError(e.toString()));
        }
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        String? token = await getToken();
        final response = await dio.post(
          Config.logoutUrl,
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
          ),
        );

        if (response.statusCode == 200) {
          deleteToken();
          emit(AuthInitial());
        }
      } on DioException {
        // emit(AuthError(e.toString()));
        deleteToken();
        emit(AuthInitial());
      }
    });
  }

  final dio = Dio();
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

      // print('User Response: ${response.statusCode} ${response.data}');

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
