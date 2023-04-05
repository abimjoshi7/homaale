import 'package:cipher/features/payment/data/models/payment_verify.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class PaymentVerifyState extends Equatable {
  final TheStates? theState;
  final PaymentVerify? paymentVerify;
  final String? pidx;

  const PaymentVerifyState({
    this.theState = TheStates.initial,
    this.paymentVerify,
    this.pidx,
  });

  PaymentVerifyState copyWith({
    TheStates? theState,
    PaymentVerify? paymentVerify,
  }) {
    return PaymentVerifyState(
      theState: theState ?? this.theState,
      paymentVerify: paymentVerify ?? this.paymentVerify,
      pidx: pidx ?? pidx,
    );
  }

  @override
  List<Object?> get props {
    return [theState, paymentVerify, pidx];
  }
}
