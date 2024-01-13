import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/payment_model.dart';

class PaymentRepository{
  Dio dio = Dio();

  Future<PaymentModel> paymentRequest ({required String token, required int amount, required int courseId, required String method})async{
    try{
      final response = dio.post('https://ff8e-180-248-32-238.ngrok-free.app/transactions/charge',options: Options(headers:{"Authorization":"Bearer $token"}),data: {
        'amount': amount,
        'course_id':courseId,
        'method':method
      });
      return PaymentModel(invCode: response.toString());
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }


}