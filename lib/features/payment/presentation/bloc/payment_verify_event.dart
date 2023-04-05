
import 'package:dependencies/dependencies.dart';

abstract class PaymentVerifyEvent extends Equatable {
  const PaymentVerifyEvent();
}

class PaymentVerifyInitiated extends PaymentVerifyEvent {
  final String provider;
  final String pidx;

  const PaymentVerifyInitiated(
      { required this.provider,required this.pidx,});
  @override
  List<Object?> get props => [ provider,pidx];
}
