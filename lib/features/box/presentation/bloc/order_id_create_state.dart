


import 'package:cipher/features/box/data/models/order_id_create.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class OrderIdCreateState extends Equatable {
  final TheStates? theState;
  final OrderIdCreate? orderIdCreate;

  const OrderIdCreateState( {
    this.theState ,
    this.orderIdCreate,
  });

  OrderIdCreateState copyWith({
    TheStates? theState,
    OrderIdCreate? orderIdCreate,
  }) {
    return OrderIdCreateState(
      theState: theState ?? this.theState,
      orderIdCreate: orderIdCreate ?? this.orderIdCreate,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      orderIdCreate,
    ];
  }
}
