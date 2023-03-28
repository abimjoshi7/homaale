import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';
import '../../data/models/order_item_list.dart';

class OrderItemListState extends Equatable {
  final TheStates? theStates;
  final OrderItemList? orderItemList;
  const OrderItemListState({
    this.theStates,
    this.orderItemList,
  });

  OrderItemListState copyWith({
    TheStates? theStates,
    OrderItemList? orderItemList,
  }) {
    return OrderItemListState(
      theStates: theStates ?? this.theStates,
      orderItemList: orderItemList ?? this.orderItemList,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        orderItemList,
      ];
}
