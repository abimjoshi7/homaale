part of 'payment_bloc.dart';

class PaymentIntentState extends Equatable {
  final TheStates? theState;
  final PaymentIntent? paymentIntent;
  final PaymentWithZeroAmount? paymentZero;
  final String? uuid;

  const PaymentIntentState( {
    this.theState = TheStates.initial,
    this.paymentIntent,
    this.paymentZero,
    this.uuid,
  });

  PaymentIntentState copyWith({
    TheStates? theState,
    PaymentIntent? paymentIntent,
    PaymentWithZeroAmount? paymentZero,
    String? uuid,
  }) {
    return PaymentIntentState(
      theState: theState ?? this.theState,
      paymentIntent: paymentIntent ?? this.paymentIntent,
      paymentZero: paymentZero ?? this.paymentZero,
      uuid: uuid ?? uuid,
    );
  }

  @override
  List<Object?> get props {
    return [theState, paymentIntent, uuid];
  }
}
