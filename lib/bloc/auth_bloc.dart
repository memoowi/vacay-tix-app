import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vacay_tix/models/auth_model.dart';
import 'package:vacay_tix/models/user_model.dart';
import 'package:vacay_tix/utils/config.dart';
import 'package:vacay_tix/utils/custom_snack_bar.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SetInitialAuthEvent>((event, emit) async {
      String? token = await getToken();
      if (token != null) {
        UserModel? user = await checkTokenValidity(token);
        // print('user: $user, token: $token');
        if (user != null) {
          emit(AuthenticatedState(token, user));
        } else {
          deleteToken();
          emit(UnauthenticatedState());
        }
      } else {
        emit(UnauthenticatedState());
      }
    });

    on<LoginEvent>((event, emit) async {
      String username = event.username;
      String password = event.password;

      try {
        emit(AuthLoadingState());
        final response = await dio.post(Config.loginUrl, data: {
          'username': username,
          'password': password,
        });

        if (response.statusCode == 200) {
          String token = AuthModel.fromJson(response.data).accessToken!;
          UserModel? user = await checkTokenValidity(token);
          if (user != null && event.context.mounted) {
            CustomSnackBar.show(
              message: 'Login Success',
              type: Type.success,
              context: event.context,
            );
            saveToken(token);
            emit(AuthenticatedState(token, user));
          }
        }
      } on DioException catch (e) {
        // print(e);
        final errorMessage =
            e.response?.statusCode == 401 || e.response?.statusCode == 404
                ? AuthModel.fromJson(e.response?.data).message!
                : 'Login Failed';

        if (event.context.mounted) {
          CustomSnackBar.show(
            message: errorMessage,
            type: Type.error,
            context: event.context,
          );
        }
        emit(UnauthenticatedState());
      }
    });

    on<RegisterEvent>((event, emit) async {
      String name = event.name;
      String username = event.username;
      String email = event.email;
      String password = event.password;

      try {
        emit(AuthLoadingState());
        final response = await dio.post(Config.registerUrl, data: {
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        });

        if (response.statusCode == 201) {
          String token = AuthModel.fromJson(response.data).accessToken!;
          UserModel? user = await checkTokenValidity(token);
          if (user != null && event.context.mounted) {
            CustomSnackBar.show(
              message: 'Register Success',
              type: Type.success,
              context: event.context,
            );
            saveToken(token);
            emit(AuthenticatedState(token, user));
          }
        }
      } on DioException catch (e) {
        // print(e);
        if (e.response?.statusCode == 422) {
          final messages = e.response?.data['message'] as Map<String, dynamic>;
          // print('messages: $messages');

          messages.forEach((field, errorMessages) {
            String errorMessage = ''; // Build a combined error message

            // Concatenate error messages for each field
            for (var message in errorMessages) {
              errorMessage += '$message';
            }

            // Show snackbar with specific field and combined messages
            if (event.context.mounted) {
              CustomSnackBar.show(
                message: '$errorMessage', // Combine field and messages
                type: Type.error,
                context: event.context,
              );
            }
          });

          emit(UnauthenticatedState());
        } else {
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: 'Register Failed',
              type: Type.error,
              context: event.context,
            );
          }
          emit(UnauthenticatedState());
        }
      }
    });

    on<LogoutEvent>((event, emit) async {
      try {
        emit(AuthLoadingState());
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
          if (event.context.mounted) {
            CustomSnackBar.show(
              message: 'Logout Success',
              type: Type.success,
              context: event.context,
            );
          }
          deleteToken();
          emit(UnauthenticatedState());
        }
      } on DioException {
        if (event.context.mounted) {
          CustomSnackBar.show(
            message: 'An error occurred.',
            type: Type.error,
            context: event.context,
          );
        }
        deleteToken();
        emit(UnauthenticatedState());
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

  Future<UserModel?> getUser() async {
    String? token = await getToken();

    if (token != null) {
      UserModel? user = await checkTokenValidity(token);

      if (user != null) {
        return user;
      }
    }

    return null;
  }
}
