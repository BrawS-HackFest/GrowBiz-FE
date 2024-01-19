import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/user_model.dart';

class UserRepository{
  Dio dio = Dio(BaseOptions(baseUrl: 'https://0bbf-104-28-245-128.ngrok-free.app'));
  
  Future<UserModel> getUser (String token)async{
    try{
      final response = await dio.get('/users/my-profile',options: Options(headers:{"Authorization":"Bearer $token"}));
      print(response.data);
      return UserModel.fromJson(response.data['data']);
    }catch(e){
      throw e.toString();
    }
  }
  Future<UserWorkData> getALlWorkers ()async{
    try{
      final response = await dio.get('/users/all');
      final data = response.data['data'] as List<dynamic>;
      List<UserWorkModel> userData = data.map((user) => UserWorkModel.fromJson(user)).toList();
      return UserWorkData(userWorkData: userData);
    }catch(e){
      throw e.toString();
    }
  }
}