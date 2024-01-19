part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}
class UserWorkFetched extends UserEvent{}

class UserWorkDetailFetched extends UserEvent{
  String id;
  UserWorkDetailFetched({required this.id});
}