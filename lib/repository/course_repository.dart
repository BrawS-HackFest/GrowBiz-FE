import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/course_model.dart';
class CourseRepository{
  final dio = Dio(BaseOptions(baseUrl:'https://0bbf-104-28-245-128.ngrok-free.app'));

  Future<DataCourse> getAllCourse ()async{
    try{
      final response = await dio.get('/courses/all');
      return DataCourse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }
  Future<DetailCourseModel> getSingleCourse (int id)async{
    try{
      final response = await dio.get('/courses/$id');
      print(response.data);
      final data = DetailCourseModel.fromJson(response.data);
      print(data);
      return DetailCourseModel.fromJson(response.data);
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }
  
  Future<CourseUserData> getMyCourse (String token) async{
    try{
      final response = await dio.get('/courses/courses-by-user', options: Options(headers: {"Authorization": "Bearer $token"}));
      final data = response.data;
      return CourseUserData.fromJson(data);
    }catch(e){
      throw e.toString();
    }
  }
}