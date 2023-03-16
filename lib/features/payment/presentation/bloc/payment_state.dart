part of 'payment_bloc.dart';

 class PaymentIntentState extends Equatable {
  final TheStates? theState;
  final PaymentIntent? paymentIntent;
  final String? uuid;

  const PaymentIntentState( {
    this.theState = TheStates.initial,
    this.paymentIntent,this.uuid,
  });

  PaymentIntentState copyWith({
    TheStates? theState,
    PaymentIntent? paymentIntent,
  }) {
    return PaymentIntentState(
      theState: theState ?? this.theState,
      paymentIntent: paymentIntent ?? this.paymentIntent,
      uuid: uuid ?? uuid,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      paymentIntent,
      uuid
    ];
  }
}
