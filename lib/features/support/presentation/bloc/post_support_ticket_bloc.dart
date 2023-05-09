import 'package:cipher/features/support/presentation/bloc/post_support_ticket_event.dart';
import 'package:cipher/features/support/presentation/bloc/post_support_ticket_state.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';
import '../../data/model/post_support_ticket.dart';
import '../../data/repositories/support_repository.dart';

class PostSupportTicketBloc
    extends Bloc<PostSupportTicketEvent, PostSupportTicketState> {
  final repositories = SupportRepository();

  PostSupportTicketBloc() : super(PostSupportTicketState()) {
    on<PostSupportTicketLoad>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.PostSupportTicketReport(
          event.model ?? "user",
          event.description,
          event.objectId,
          event.reason,
          event.type,
        ).then(
          (value) => emit(
            state.copyWith(
              theState: TheStates.success,
              postSupportTicket: PostSupportTicket.fromJson(value),
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
    on<PostSupportTicketLoadWithOutModel>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.PostSupportTicketReportWithOutModel(
          event.description,
          event.reason,
          event.type,
        ).then(
          (value) => emit(
            state.copyWith(
              theState: TheStates.success,
              postSupportTicket: PostSupportTicket.fromJson(value),
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(theState: TheStates.failure),
        );
      }
    });
  }
}
