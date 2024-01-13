import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart' show immutable;
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
            token: event.token.trim().replaceAll('\n', ''),
            amount: event.amount,
            courseId: event.courseId,
            method: event.method
        );
        emit(PaymentSucces(invCode: paymentReq.invCode));
      }catch(e){
        emit(PaymentFailed(e.toString()));
      }

    });
  }
}
