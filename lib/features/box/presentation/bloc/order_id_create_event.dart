
import 'package:dependencies/dependencies.dart';

abstract class OrderIdCreateEvent extends Equatable {
  const OrderIdCreateEvent();
}

class OrderIdCreateInitiated extends OrderIdCreateEvent {
  final List <String> uuid;

  const OrderIdCreateInitiated({ required this.uuid});
  @override
  List<Object?> get props => [ uuid];
}
