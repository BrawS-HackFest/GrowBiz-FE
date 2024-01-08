import 'package:dio/dio.dart';


class AuthRepository{
  Dio dio = Dio();
  Future registerRepository(String uid, String email)async{
    try{
      print("uuid : $uid");
      print('email : $email');
      var response = await dio.post('https://74ff-180-248-32-238.ngrok-free.app/create-user',data: {
        'id':uid,
        'email':email
      });

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