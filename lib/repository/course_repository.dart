import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/course_model.dart';
import 'package:http/http.dart'as http;
class CourseRepository{
  final dio = Dio(BaseOptions(baseUrl:'https://dc4a-182-253-178-156.ngrok-free.app'));

  Future<DataCourse> getAllCourse ()async{
    try{
      final response = await dio.get('/courses/all');
      final data = DataCourse.fromJson(response.data);
      print(data);
      return DataCourse.fromJson(response.data);
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }
  Future<CourseModel> getSingleCourse (int id)async{
    try{
      final response = await dio.get('/courses/$id');
      final data = DataCourse.fromJson(response.data);
      print(data);
      return CourseModel.fromModel(response.data);
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }
}