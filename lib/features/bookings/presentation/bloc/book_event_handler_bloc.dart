import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/bookings/data/models/models.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
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
            startDate: DateFormat("yyyy-MM-dd").format(
              event.req?.startDate ?? DateTime.now(),
            ),
            endDate: DateFormat("yyyy-MM-dd").format(
              event.req?.endDate ?? DateTime.now(),
            ),
            startTime: event.req?.startTime,
            endTime: event.req?.endTime,
            budget: event.req?.budgetTo,
            description: event.req?.description,
            requirements: event.req?.requirements,
            images: event.req?.images,
            videos: event.req?.videos,

            // timeSlot: TimeSlot(
            // 	startTime: event.req!.startTime,

            // )
          ),
        );
      },
    );
  }
}
