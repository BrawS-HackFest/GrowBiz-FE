part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}
class UserWorkSuccess extends UserState{
  List<UserWorkModel> userData;
  UserWorkSuccess({required this.userData});
}
class UserLoading extends UserState{}
class UserFailed extends UserState{
  String error;
  UserFailed(this.error);
}

class UserWorkDetailSuccess extends UserState{
  final UserWorkDetail userWorkDetail;
  UserWorkDetailSuccess({required this.userWorkDetail});
}