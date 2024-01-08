part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  String token;
  AuthSuccess({required this.token});

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

