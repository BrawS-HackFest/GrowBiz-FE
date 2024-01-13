part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentSucces extends PaymentState{
  String invCode;
  int amount;
  String method;
  PaymentSucces({required this.invCode,required this.amount, required this.method});
}
class PaymentFailed extends PaymentState{
  String error;
  PaymentFailed(this.error);
}
class PaymentLoading extends PaymentState{}
