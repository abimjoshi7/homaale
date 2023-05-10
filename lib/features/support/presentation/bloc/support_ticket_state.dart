
import 'package:cipher/features/support/data/model/support_ticket_model.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../core/constants/enums.dart';

class GetSupportTicketState extends Equatable {
  final TheStates? theStates;
  final SupportTicketModel? supportTicketList;
  const GetSupportTicketState({
    this.theStates,
    this.supportTicketList,
  });

  GetSupportTicketState copyWith({
    TheStates? theStates,
    SupportTicketModel? supportTicketList,
  }) {
    return GetSupportTicketState(
      theStates: theStates ?? this.theStates,
      supportTicketList: supportTicketList ?? this.supportTicketList,
    );
  }

  @override
  List<Object?> get props => [
        theStates,
        supportTicketList,
      ];
}
