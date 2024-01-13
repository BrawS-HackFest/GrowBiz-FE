part of 'payment_bloc.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentSucces extends PaymentState{
  String invCode;
  PaymentSucces({required this.invCode});
}
class PaymentFailed extends PaymentState{
  String error;
  PaymentFailed(this.error);
}
class PaymentLoading extends PaymentState{}
