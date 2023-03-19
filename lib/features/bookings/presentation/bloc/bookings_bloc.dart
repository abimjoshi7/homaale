import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_res.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final repositories = BookingRepositories();
  BookingsBloc() : super(const BookingsState()) {
    on<BookingLoaded>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              states: TheStates.initial,
            ),
          );
          await repositories
              .fetchMyBookingsList(
            isTask: event.isTask,
            status: event.status,
          )
              .then(
            (value) {
              emit(
                state.copyWith(
                  states: TheStates.success,
                  myBookingListModelService: MyBookingListModel.fromJson(
                    value,
                  ),
                  myBookingListModelTask: MyBookingListModel.fromJson(
                    value,
                  ),
                ),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
            ),
          );
        }
      },
    );

    on<BookingCreated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(states: TheStates.initial),
          );
          await repositories
              .bookServiceOrTask(event.service)
              .then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isBooked: true,
                    // bookEntityServiceRes: BookEntityServiceRes.fromJson(
                    //   value,
                    // ),
                  ),
                ),
              )
              .whenComplete(
                () => emit(
                  state.copyWith(
                    isBooked: false,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(states: TheStates.failure),
          );
        }
      },
    );

    on<BookingEdited>(
      (event, emit) async {
        try {
          await repositories.editBooking(event.id, event.req).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    editBookingRes: EditBookingRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
            ),
          );
        }
      },
    );

    on<BookingApproved>(
      (event, emit) async {
        try {
          await repositories.approveBooking(event.id).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isApproved: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
            ),
          );
        }
      },
    );

    on<BookingDeleted>(
      (event, emit) async {
        try {
          await repositories
              .deleteBooking(event.id)
              .then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isDeleted: true,
                  ),
                ),
              )
              .whenComplete(
                () => add(
                  const BookingLoaded(),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
            ),
          );
        }
      },
    );
  }
}
