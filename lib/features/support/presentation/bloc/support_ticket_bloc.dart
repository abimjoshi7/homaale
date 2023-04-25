import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/support/data/model/support_ticket_model.dart';
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
          List<SupportTicketModel> _supportTicketList = [];

          final _xList = await _repo.fetchSupportTickets(
            {
              "is_active": true,
              "status": event.supportTicketStatus,
            },
          );
          if (_xList != null) {
            for (final supportTicket in _xList) {
              _supportTicketList.add(
                SupportTicketModel.fromJson(
                    supportTicket as Map<String, dynamic>),
              );
            }
            emit(state.copyWith(
              theStates: TheStates.success,
              supportTicketList: _supportTicketList,
              isTicketClosed:
                  event.supportTicketStatus == "open" ? false : true,
            ));
          } else {
            emit(state.copyWith(
              theStates: TheStates.success,
              supportTicketList: List.empty(),
              isTicketClosed:
                  event.supportTicketStatus == "open" ? false : true,
            ));
          }
        } catch (e) {
          log("Support Ticket BLOC ERR: " + e.toString());
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
