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

class UpdatePassEvent extends AuthEvent{
  String password;
  String confirmPassword;
  UpdatePassEvent({required this.password, required this.confirmPassword});
}

class UpdateUserEvent extends AuthEvent{
  String username;
  String email;
  String number;

  UpdateUserEvent({required this.username, required this.email, required this.number});
}

class ResetPassEvent extends AuthEvent{
  String email;
  ResetPassEvent({required this.email});
}
