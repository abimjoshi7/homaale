part of 'payment_bloc.dart';

abstract class PaymentIntentEvent extends Equatable {
  const PaymentIntentEvent();
}

class PaymentIntentInitiated extends PaymentIntentEvent {
  final String provider;
  final String uuid;

  const PaymentIntentInitiated(
      { required this.provider,required this.uuid,});
  @override
  List<Object?> get props => [ provider,uuid];
}

class PaymentInitiatedZeroAmount extends PaymentIntentEvent {
  final String uuid;

  const PaymentInitiatedZeroAmount ({required this.uuid});
  @override
  List<Object?> get props => [uuid];
}
