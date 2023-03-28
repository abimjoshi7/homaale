


import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/payment_type_list.dart';

class PaymentTypeListState extends Equatable {
  final TheStates? theState;
  final PaymentTypeList? paymentType;
  final int? currentIndex;

  const PaymentTypeListState({
    this.theState ,
    this.paymentType,
    this.currentIndex,
  });

  PaymentTypeListState copyWith({
    TheStates? theState,
    PaymentTypeList? paymentType,
    int? currentIndex,
  }) {
    return PaymentTypeListState(
      theState: theState ?? this.theState,
      paymentType: paymentType ?? this.paymentType,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      paymentType,
      currentIndex,
    ];
  }
}
