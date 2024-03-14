part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthInitialEvent extends AuthEvent {}

class SetInitialAuthEvent extends AuthEvent {
  final String token;
  SetInitialAuthEvent({required this.token});
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;
  LoginEvent({required this.username, required this.password});
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String username;
  final String email;
  final String password;

  RegisterEvent(
      {required this.name,
      required this.username,
      required this.email,
      required this.password});
}

class LogoutEvent extends AuthEvent {}

class CheckTokenValidityEvent extends AuthEvent {
  final String token;
  CheckTokenValidityEvent({required this.token});
}

// class AuthErrorEvent extends AuthEvent {
//   final String message;
//   AuthErrorEvent({required this.message});
// }

// class AuthSuccessEvent extends AuthEvent {
//   final AuthModel authModel;
//   AuthSuccessEvent({required this.authModel});
// }
