import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_res.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final repositories = BookingRepositories();
  BookingsBloc() : super(BookingsInitial()) {
    on<ServiceBookingInitiated>(
      (event, emit) async {
        try {
          emit(
            BookingsInitial(),
          );
          await repositories.bookServiceOrTask(event.service).then(
                (value) => emit(
                  ServiceBookingAddSuccess(
                    BookEntityServiceRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            ServiceBookingAddFailure(),
          );
        }
      },
    );

    on<ServiceBookingListLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            BookingsInitial(),
          );
          await repositories.fetchMyServiceBookingList().then(
                (value) => emit(
                  ServiceBookingLoadSuccess(
                    MyBookingList.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            BookingsFailure(),
          );
        }
      },
    );

    on<ServiceBookingEditInitiated>(
      (event, emit) async {
        try {
          await repositories.editBooking(event.id, event.req).then(
                (value) => ServiceBookingEditSuccess(
                  EditBookingRes.fromJson(
                    value,
                  ),
                ),
              );
        } catch (e) {
          emit(
            BookingsFailure(),
          );
        }
      },
    );

    on<ServiceBookingDeleteInitiated>(
      (event, emit) async {
        try {
          await repositories
              .deleteBooking(event.id)
              .then(
                (value) => emit(
                  ServiceBookingDeleteSuccess(),
                ),
              )
              .whenComplete(
                () => add(
                  ServiceBookingListLoadInitiated(),
                ),
              );
        } catch (e) {
          emit(
            BookingsFailure(),
          );
        }
      },
    );
  }
}
