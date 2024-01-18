import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:hackfest_mobile/models/payment_model.dart';
import 'package:hackfest_mobile/repository/payment_repository.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepository paymentRepository;

  PaymentBloc({required this.paymentRepository}) : super(PaymentInitial()) {
    on<PaymentRequest>((event, emit)async {
      try{
        emit(PaymentLoading());
        final paymentReq = await paymentRepository.paymentRequest(
            token: event.token,
            amount: event.amount,
            courseId: event.courseId,
            method: event.method
        );
        emit(PaymentSucces(invCode: paymentReq.invCode, method: paymentReq.method,amount: paymentReq.amount));
      }catch(e){
        emit(PaymentFailed(e.toString()));
      }

    });
    on<WaitingPaymentUserFetch>((event, emit) async{
      try{
        emit(PaymentLoading());
        String token = event.token;
        final waitingPaymentData = await paymentRepository.getAllPaymentUser(token);
        emit(WaitingPaymentUserSuccess(waitingPayment: waitingPaymentData.dataWaitingPayment));
      }catch(e){
        emit(WaitingPaymentUserFailed(e.toString()));
      }
    });
    on<DetailPaymentUserFetch>((event, emit)async{
      try{
        emit(PaymentLoading());
        final detailPaymentUser = await paymentRepository.getDetailWaitingPayment(id: event.id);
        emit(DetailPaymentUserSuccess(paymentModel: detailPaymentUser));
      }catch(e){
        emit(DetailPaymentUserFailed(e.toString()));
      }
    });
  }
}
