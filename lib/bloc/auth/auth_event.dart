part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class RegisterEvent extends AuthEvent{
  String email;
  String password;
  String confirmPassword;
  RegisterEvent({required this.email, required this.password, required this.confirmPassword});
}

class LoginEvent extends AuthEvent{
  String email;
  String password;

  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvent{}
