part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthenticatedState extends AuthState {
  final String token;
  final UserModel user;

  AuthenticatedState(this.token, this.user);

  UserModel get getUser => user;
}

class UnauthenticatedState extends AuthState {}
