part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String token;
  final UserModel user;

  AuthSuccess(this.token, this.user);
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}
