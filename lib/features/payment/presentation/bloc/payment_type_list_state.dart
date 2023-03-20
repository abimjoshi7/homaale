


import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/payment_type_list.dart';

class PaymentTypeListState extends Equatable {
  final TheStates? theState;
  final PaymentTypeList? paymentType;

  const PaymentTypeListState( {
    this.theState ,
    this.paymentType,
  });

  PaymentTypeListState copyWith({
    TheStates? theState,
    PaymentTypeList? paymentType,
  }) {
    return PaymentTypeListState(
      theState: theState ?? this.theState,
      paymentType: paymentType ?? this.paymentType,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      paymentType,
    ];
  }
}
