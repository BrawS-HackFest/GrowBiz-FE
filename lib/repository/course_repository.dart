import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/course_model.dart';
import 'package:http/http.dart'as http;
class CourseRepository{
  final dio = Dio(BaseOptions(baseUrl:'https://b19e-180-248-16-90.ngrok-free.app'));

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
}