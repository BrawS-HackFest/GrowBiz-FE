import 'package:GrowBiz/shared/api_url.dart';
import 'package:dio/dio.dart';
import 'package:GrowBiz/models/user_model.dart';

class UserRepository{
  Dio dio = Dio();
  
  Future<UserModel> getUser (String token)async{
    try{
      final response = await dio.get(ApiUrl().pathUrl('/users/my-profile'),options: Options(headers:{"Authorization":"Bearer $token"}));
      print(response.data);
      return UserModel.fromJson(response.data['data']);
    }catch(e){
      throw e.toString();
    }
  }
  Future<UserWorkData> getALlWorkers ()async{
    try{
      final response = await dio.get(ApiUrl().pathUrl('/users/all'));
      final data = response.data['data'] as List<dynamic>;
      List<UserWorkModel> userData = data.map((user) => UserWorkModel.fromJson(user)).toList();
      return UserWorkData(userWorkData: userData);
    }catch(e){
      throw e.toString();
    }
  }
  
  Future<UserWorkDetail> getUserWorkDetail(String id)async{
    try{
      final response = await dio.get(ApiUrl().pathUrl('/users/check-user?id=$id'));
      return UserWorkDetail.fromJson(response.data);
    }catch(e){
      throw e.toString();
    }
  }
  
  Future updateProfile({required String email, required String username, required String number, required String token})async{
    try{
     final response = await dio.post(ApiUrl().pathUrl('/users/update-profile'),options: Options(headers:{"Authorization":"Bearer $token"}),data: {
       "username":username,
       "number":number,
     });
    }catch(e){
      throw e.toString();
    }
  }
}