import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/data/models/payment_verify.dart';
import 'package:cipher/features/payment/data/repositories/payment_repositories.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_event.dart';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_state.dart';
import 'package:dependencies/dependencies.dart';

class PaymentVerifyBloc extends Bloc<PaymentVerifyEvent, PaymentVerifyState> {
  final repositories = PaymentRepositories();

  PaymentVerifyBloc() : super(const PaymentVerifyState()) {
    on<PaymentVerifyInitiated>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.postPaymentIntent(event.provider, event.pidx).then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                  paymentVerify: PaymentVerify.fromJson(value),
                ),
              ),
            );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
