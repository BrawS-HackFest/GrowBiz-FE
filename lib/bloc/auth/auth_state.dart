part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  String token;
  UserModel userModel;
  AuthSuccess({required this.token, required this.userModel});

  get state => token;
}
class AuthError extends AuthState{
  String error;
  AuthError({required this.error});

}

class RegisterSuccess extends AuthState{}
class RegisterError extends AuthState{
  String error;
  RegisterError({required this.error});
}
class LogoutSuccess extends AuthState{}
class LogoutError extends AuthState{
  String error;
  LogoutError(this.error);
}

class UpdatePassSuccess extends AuthState{}
class UpdatePassFailed extends AuthState{
  String error;
  UpdatePassFailed(this.error);
}
