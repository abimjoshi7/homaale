import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:dependencies/dependencies.dart';

part 'book_event_handler_event.dart';
part 'book_event_handler_state.dart';

class BookEventHandlerBloc
    extends Bloc<BookEventHandlerEvent, BookEventHandlerState> {
  BookEventHandlerBloc() : super(const BookEventHandlerState()) {
    on<BookEventPicked>(
      (event, emit) async {
        emit(
          state.copyWith(
            startDate: event.req?.startDate == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    event.req!.startDate!,
                  ),
            endDate: event.req?.endDate == null
                ? null
                : DateFormat("yyyy-MM-dd").format(
                    event.req!.endDate!,
                  ),
            startTime: event.req?.startTime,
            endTime: event.req?.endTime,
            budget: event.req?.budgetTo,
            description: event.req?.description,
            requirements: event.req?.requirements,
            city: event.req?.city.toString(),
            address: event.req?.location,
          ),
        );
      },
    );

    on<BookEventAcceptTerms>(
      (event, emit) => emit(
        state.copyWith(
          isTermAccepted: event.isTermAccepted,
        ),
      ),
    );

    on<BookEventRequirementCleared>(
      (event, emit) => emit(
        state.copyWith(
          requirements: [],
        ),
      ),
    );
  }
}
