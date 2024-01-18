import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/payment_model.dart';

class PaymentRepository{
  Dio dio = Dio(BaseOptions(baseUrl:'https://0bbf-104-28-245-128.ngrok-free.app'));

  Future<PaymentModel> paymentRequest ({required String token, required int amount, required int courseId, required String method})async{
    try{
      final response =await dio.post('/transactions/charge',options: Options(headers:{"Authorization":"Bearer $token"}),data: {
        'amount': amount,
        'course_id':courseId,
        'method':method
      });
      if (response.statusCode == 200) {
        final paymentRes = response.data['data'];
        print(paymentRes);
        return PaymentModel(invCode: paymentRes['va_number'], amount: paymentRes['amount'], method: paymentRes['method']);
      } else {
        throw 'Failed to perform payment request: ${response.statusCode}';
      }
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }
  Future<WaitingPaymentData> getAllPaymentUser (String token)async{
   try{
     final response = await dio.get('/transactions/transactions-by-user',options: Options(headers:{"Authorization":"Bearer $token"}));
     print(response.data);
     return WaitingPaymentData.fromJson(response.data);
   }catch(e){
     throw e.toString();
   }
  }
  Future<PaymentModel> getDetailWaitingPayment ({required int id})async{
    try{
      final response =await dio.get('/transactions/$id');
      if (response.statusCode == 200) {
        final paymentRes = response.data['data'];
        print(paymentRes);
        return PaymentModel(invCode: paymentRes['va_number'], amount: paymentRes['amount'], method: paymentRes['method']);
      } else {
        throw 'Failed to perform payment request: ${response.statusCode}';
      }
    }catch(e){
      print(e.toString());
      throw e.toString();
    }
  }

}