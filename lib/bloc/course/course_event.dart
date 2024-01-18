part of 'course_bloc.dart';

@immutable
abstract class CourseEvent {}

class CourseFetched extends CourseEvent{}

class CourseSingleFetched extends CourseEvent{
  int id;
  CourseSingleFetched({required this.id});
}

class CourseUserFetched extends CourseEvent{
  String token;
  CourseUserFetched({required this.token});
}
