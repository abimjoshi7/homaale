
import 'dart:developer';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/support/data/model/support_ticket_model.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_event.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../data/repositories/support_repository.dart';

class SupportTicketBloc
    extends Bloc<GetSupportTicketEvent, GetSupportTicketState> {
  SupportTicketBloc() : super(const GetSupportTicketState()) {
    final repo = SupportRepository();

    on<GetSupportTicketInitiated>(
      (event, emit) async {
        try {
          emit(state.copyWith(theStates: TheStates.initial));
          await repo.fetchSupportTickets().then((value) {
            emit(
              state.copyWith(
                theStates: TheStates.success,
                supportTicketList: SupportTicketModel.fromJson(value),
              ),
            );
          });
        } catch (e) {
          log("Item parse error$e");
          emit(state.copyWith(theStates: TheStates.failure));
        }
      },
    );
  }
}
