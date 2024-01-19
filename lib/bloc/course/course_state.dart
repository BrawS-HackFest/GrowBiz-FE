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
  final DetailCourseModel detailCourseModelcourseModel;
  CourseSingleSuccess({required this.detailCourseModelcourseModel});
}
class CourseFailed extends CourseState{
  String error;
  CourseFailed(this.error);
}

class CourseUserSuccess extends CourseState{
  final List<CourseUserModel> courseUserModel;
  CourseUserSuccess({required this.courseUserModel});
}

class CourseMaterialSuccess extends CourseState{
  final List<CourseMaterials> courseMaterials;
  CourseMaterialSuccess({required this.courseMaterials});
}

class CourseDetailMaterialSuccess extends CourseState{
  final CourseDetailMaterial courseDetailMaterial;
  CourseDetailMaterialSuccess({required this.courseDetailMaterial});
}
