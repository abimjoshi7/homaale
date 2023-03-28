import 'dart:developer';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/data/models/booking_history_res.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart' as booking;
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
          emit(state.copyWith(states: TheStates.initial));
          await repositories
              .fetchMyBookingsList(
            isTask: event.isTask,
            status: event.status,
            page: event.page,
          )
              .then(
            (value) {
              emit(
                state.copyWith(
                    states: TheStates.success,
                    myBookingListModelService: booking.MyBookingListModel.fromJson(
                      value,
                    ),
                    myBookingListModelTask: booking.MyBookingListModel.fromJson(
                      value,
                    ),
                    isLoaded: true,
                    isUpdated: false),
              );
            },
          );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
              isLoaded: false,
            ),
          );
        }
      },
    );

    on<BookingSingleLoaded>(
      (event, emit) async {
        try {
          emit(state.copyWith(states: TheStates.initial));
          await repositories.fetchSingleBooking(id: event.id).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    result: booking.Result.fromJson(value),
                  ),
                ),
              );
        } catch (e) {
          emit(state.copyWith(states: TheStates.failure));
        }
      },
    );

    on<BookingCreated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              states: TheStates.initial,
              isBooked: false,
            ),
          );
          await repositories.bookServiceOrTask(event.service).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isBooked: true,
                    // bookEntityServiceRes: BookEntityServiceRes.fromJson(
                    //   value,
                    // ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
              isBooked: false,
            ),
          );
        }
      },
    );

    on<BookingEdited>(
      (event, emit) async {
        try {
          await repositories.editBooking(event.id, event.req).then(
            (value) {
              emit(
                state.copyWith(
                  states: TheStates.success,
                  editBookingRes: EditBookingRes.fromJson(value),
                  isUpdated: true,
                ),
              );
            },
          ).whenComplete(() => add(BookingLoaded(isTask: event.isTask, page: 1)));
        } catch (e) {
          log(e.toString());
          emit(
            state.copyWith(
              states: TheStates.failure,
              isUpdated: false,
            ),
          );
        }
      },
    );

    on<BookingApproved>(
      (event, emit) async {
        try {
          await repositories.approveBooking(event.approveReq).then(
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
              isApproved: false,
            ),
          );
        }
      },
    );

    on<BookingCancelled>(
      (event, emit) async {
        try {
          await repositories.cancelBooking(event.id).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isCancelled: true,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
              isCancelled: false,
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
              isDeleted: false,
            ),
          );
        }
      },
    );

    on<BookingHistory>(
      (event, emit) async {
        emit(state.copyWith(states: TheStates.initial));
        try {
          await repositories.bookingHistory(event.bookingHistoryReq).then(
            (value) {
              log('booking history from bloc: $value');
              emit(
                state.copyWith(
                  states: TheStates.success,
                  bookingHistoryRes: BookingHistoryRes.fromJson(value),
                ),
              );
            },
          );
        } catch (e) {
          log('history error' + e.toString());
          emit(
            state.copyWith(states: TheStates.failure),
          );
        }
      },
    );
  }
}
