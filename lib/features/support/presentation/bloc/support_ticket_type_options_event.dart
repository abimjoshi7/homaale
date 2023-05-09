import 'package:dependencies/dependencies.dart';

abstract class SupportTicketTypeOptionsEvent extends Equatable {
  const SupportTicketTypeOptionsEvent();
}

class SupportTicketTypeOptionsLoaded extends SupportTicketTypeOptionsEvent {
  final String? target;
  const SupportTicketTypeOptionsLoaded({this.target});
  @override
  List<Object?> get props => [target];
}
