import 'package:dio/dio.dart';


class AuthRepository{
  Dio dio = Dio();
  Future registerRepository(String uid, String email)async{
    try{
      print("uuid : $uid");
      print('email : $email');
      var response = await dio.post('https://0bbf-104-28-245-128.ngrok-free.app/users/register',data: {
        'id':uid,
        'email':email
      });
      print(response.data);

      if(response.statusCode ==200){
        var data = response.data;
        print(data);
        return true;
      }
      else{
        throw Exception('error registration');
      }
    }catch(e){
      throw Exception(e.toString());
    }


    
  }
}