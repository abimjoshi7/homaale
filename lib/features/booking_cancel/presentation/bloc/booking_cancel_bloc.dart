import 'package:cipher/features/booking_cancel/data/models/booking_cancel_model.dart';
import 'package:cipher/features/booking_cancel/data/repo/booking_cancel_repository.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';
import 'booking_cancel_event.dart';
import 'booking_cancel_state.dart';

class BookingCancelBloc extends Bloc<BookingCancelEvent, BookingCancelState> {
  final repositories = BookingCancelRepository();

  BookingCancelBloc() : super(BookingCancelState()) {
    on<CancelActionPost>((event, emit) async {
      try {
        emit(
          state.copyWith(theState: TheStates.initial),
        );
        await repositories.PostCancelAction(
                event.bookingId, event.reason, event.description)
            .then(
          (value) => emit(
            state.copyWith(
              theState: TheStates.success,
              bookingCancelModel: BookingCancelModel.fromJson(value),
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
