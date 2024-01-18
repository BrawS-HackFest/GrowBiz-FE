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

class WaitingPaymentUserSuccess extends PaymentState{
  final List<WaitingPaymentModel> waitingPayment;
  WaitingPaymentUserSuccess({required this.waitingPayment});
}
class WaitingPaymentUserFailed extends PaymentState{
  String error;
  WaitingPaymentUserFailed(this.error);
}

class DetailPaymentUserSuccess extends PaymentState{
  PaymentModel paymentModel;
  DetailPaymentUserSuccess({required this.paymentModel});
}
class DetailPaymentUserFailed extends PaymentState{
  String error;
  DetailPaymentUserFailed(this.error);
}
