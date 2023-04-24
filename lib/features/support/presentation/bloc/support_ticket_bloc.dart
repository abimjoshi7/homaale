import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/support/data/repositories/support_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'support_ticket_event.dart';
part 'support_ticket_state.dart';

class SupportTicketBloc extends Bloc<SupportTicketEvent, SupportTicketState> {
  final _repo = SupportRepository();
  SupportTicketBloc(_repo) : super(SupportTicketState()) {
    on<SupportTicketInitialEvent>((event, emit) {
      emit(state.copyWith(
        theStates: TheStates.initial,
      ));
    });
    on<SupportTicketFetchInitiated>(
      (event, emit) async {
        try {
          final x = await _repo.fetchSupportTickets(
            {
              "is_active": true,
              "status": event.supportTicketStatus,
            },
          );
          log("Support Ticket Response: $x");
          emit(
            state.copyWith(
              theStates: TheStates.success,
              supportTicketList: x as List?,
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              theStates: TheStates.failure,
            ),
          );
        }
      },
    );
    on<SupportTicketCreateInitiated>((event, emit) {});
  }
}
