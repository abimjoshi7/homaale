import 'package:cipher/features/support/presentation/bloc/support_ticket_type_options_event.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_type_options_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../data/repositories/support_repository.dart';

class SupportTicketTypeOptionsBloc
    extends Bloc<SupportTicketTypeOptionsEvent, SupportTicketTypeOptionsState> {
  final respositories = SupportRepository();
  SupportTicketTypeOptionsBloc() : super(SupportTicketTypeOptionsLoading()) {
    on<SupportTicketTypeOptionsLoaded>(
      (event, emit) async {
        try {
          emit(
            SupportTicketTypeOptionsLoading(),
          );

          await respositories.fetchFeedback().then(
            (value) {
              if (value.isNotEmpty) {
                emit(
                  supportTicketTypeOptionsSuccess(
                    list: value,
                  ),
                );
              }
            },
          );
        } catch (e) {
          emit(
            supportTicketTypeOptionsFailure(),
          );
        }
      },
    );
  }
}
