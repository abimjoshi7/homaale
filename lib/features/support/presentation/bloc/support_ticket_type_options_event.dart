import 'package:dependencies/dependencies.dart';

abstract class SupportTicketTypeOptionsEvent extends Equatable {
  const SupportTicketTypeOptionsEvent();
}

class SupportTicketTypeOptionsLoaded extends SupportTicketTypeOptionsEvent {
  @override
  List<Object?> get props => [];
}
