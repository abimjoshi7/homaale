import 'package:dependencies/dependencies.dart';

import '../../data/model/support_ticket_type_options.dart';

abstract class SupportTicketTypeOptionsState extends Equatable {
  const SupportTicketTypeOptionsState();
}

class SupportTicketTypeOptionsLoading extends SupportTicketTypeOptionsState {
  @override
  List<Object?> get props => [];
}

class supportTicketTypeOptionsSuccess extends SupportTicketTypeOptionsState {
  final List<SupportTicketTypeOptions> list;
  const supportTicketTypeOptionsSuccess({
    required this.list,
  });
  @override
  List<Object?> get props => [list];
}

class supportTicketTypeOptionsFailure extends SupportTicketTypeOptionsState {
  @override
  List<Object?> get props => [];
}
