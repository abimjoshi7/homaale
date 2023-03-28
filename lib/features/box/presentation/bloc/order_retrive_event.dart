import 'package:dependencies/dependencies.dart';

abstract class OrderItemRetriveEvent extends Equatable {
  const OrderItemRetriveEvent();
}

class OrderItemRetriveInitiated extends OrderItemRetriveEvent {
  final String uuid;

  const OrderItemRetriveInitiated({required this.uuid});
  @override
  List<Object?> get props => [
    uuid
  ];
}
