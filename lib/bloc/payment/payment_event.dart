part of 'payment_bloc.dart';

@immutable
abstract class PaymentEvent {}

class PaymentRequest extends PaymentEvent{
  String token;
  int amount;
  int courseId;
  String method;
  PaymentRequest({required this.token, required this.amount, required this.courseId, required this.method});

}
