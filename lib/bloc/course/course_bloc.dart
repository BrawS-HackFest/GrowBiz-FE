import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:GrowBiz/models/course_model.dart';
import 'package:flutter/foundation.dart' show immutable;


import '../../repository/course_repository.dart';

part 'course_event.dart';
part 'course_state.dart';

class CourseBloc extends Bloc<CourseEvent, CourseState> {
  final CourseRepository courseRepository;
  CourseBloc({required this.courseRepository}) : super(CourseInitial()) {
    on<CourseFetched>((event, emit)async {
      try{
        emit (CourseLoading());
        final course = await courseRepository.getAllCourse();
        emit(CourseSuccess(courseModel: course.dataCourse));
      }catch(e){
        emit(CourseFailed(e.toString()));
      }
    });
    on<CourseSingleFetched>((event, emit) async{
      try{
        emit(CourseLoading());
        final courseSingle = await courseRepository.getSingleCourse(event.id);
        emit(CourseSingleSuccess(detailCourseModelcourseModel: courseSingle));
      }catch(e){
        emit(CourseFailed(e.toString()));
      }
    });
    on<CourseUserFetched>((event, emit)async{
      try{
        emit(CourseLoading());
        final courseUserData = await courseRepository.getMyCourse(event.token);
        emit(CourseUserSuccess(courseUserModel: courseUserData.courseUserData));
      }catch(e){
        emit(CourseFailed(e.toString()));
      }
    });
    on<CourseMaterialFetched>((event, emit) async{
      try{
        final courseMaterialData = await courseRepository.getCourseMaterials(event.id);
        emit(CourseMaterialSuccess(courseMaterials: courseMaterialData.courseData));
      }catch(e){
        emit(CourseFailed(e.toString()));
      }
    });
    on<CourseDetailMaterialFetched>((event, emit)async{
      try{
        emit(CourseLoading());
        final courseDetail = await courseRepository.getDetailCourseMaterial(event.id);
        emit(CourseDetailMaterialSuccess(courseDetailMaterial: courseDetail));
      }catch(e){
        emit(CourseFailed(e.toString()));
      }
    });
  }
}
