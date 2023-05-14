
import 'package:dependencies/dependencies.dart';

abstract class GetSupportTicketEvent extends Equatable {
  const GetSupportTicketEvent();
}

class GetSupportTicketInitiated extends GetSupportTicketEvent {
  const GetSupportTicketInitiated();
  @override
  List<Object?> get props => [];
}
