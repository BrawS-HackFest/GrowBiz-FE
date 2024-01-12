part of 'course_bloc.dart';

@immutable
abstract class CourseState {}

class CourseInitial extends CourseState {}

class CourseLoading extends CourseState{}

class CourseSuccess extends CourseState{
  final List<CourseModel> courseModel;
  CourseSuccess({required this.courseModel});
}
class CourseSingleSuccess extends CourseState{
  final CourseModel courseModel;
  CourseSingleSuccess({required this.courseModel});
}
class CourseFailed extends CourseState{
  String error;
  CourseFailed(this.error);
}
