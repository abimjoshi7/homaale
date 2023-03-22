

import 'package:dependencies/dependencies.dart';

abstract class OrderItemListEvent extends Equatable {
  const OrderItemListEvent();
}

class OrderItemListInitiated extends OrderItemListEvent {
  const OrderItemListInitiated();
  @override
  List<Object?> get props => [];
}
