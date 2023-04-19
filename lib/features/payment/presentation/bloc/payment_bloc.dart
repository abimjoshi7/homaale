import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/payment/data/models/payment_intent.dart';
import 'package:cipher/features/payment/data/repositories/payment_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentIntentEvent, PaymentIntentState> {
  final repositories = PaymentRepositories();

  PaymentBloc() : super(const PaymentIntentState()) {
    on<PaymentIntentInitiated>((event, emit) async {
      emit(state.copyWith(theState: TheStates.loading));
      try {
        await repositories.postPaymentIntent(event.provider, event.uuid).then(
              (value) => emit(
                state.copyWith(
                  theState: TheStates.success,
                  paymentIntent: PaymentIntent.fromJson(value),
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
