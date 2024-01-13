import 'package:dio/dio.dart';
import 'package:hackfest_mobile/models/payment_model.dart';

class PaymentRepository{
  Dio dio = Dio();

  Future<PaymentModel> paymentRequest ({required String token, required int amount, required int courseId, required String method})async{
    try{
      //String tokenCleaned = token.replaceAll(RegExp(r'\s+'), '');
      final response =await dio.post('https://b031-180-248-16-90.ngrok-free.app/transactions/charge',options: Options(headers:{"Authorization":"Bearer $token"}),data: {
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


}