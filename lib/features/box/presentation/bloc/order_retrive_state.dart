import 'package:cipher/features/box/data/models/order_item_retrive_list.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class OrderItemRetriveState extends Equatable {
  final TheStates? theStates;
  final OrderItemRetriveList? orderItemRetriveList;
  const OrderItemRetriveState({
    this.theStates,
    this.orderItemRetriveList,
  });

  OrderItemRetriveState copyWith({
    TheStates? theStates,
    OrderItemRetriveList? orderItemRetriveList,
  }) {
    return OrderItemRetriveState(
      theStates: theStates ?? this.theStates,
      orderItemRetriveList: orderItemRetriveList ?? this.orderItemRetriveList,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        orderItemRetriveList,
      ];
}
