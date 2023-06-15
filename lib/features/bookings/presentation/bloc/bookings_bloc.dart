import 'dart:developer';

import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/approve_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/booking_history_req.dart';
import 'package:cipher/features/bookings/data/models/booking_single_dto.dart';
import 'package:cipher/features/bookings/data/models/bookings_response_dto.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart' as booking;
import 'package:cipher/features/bookings/data/models/reject_req.dart';
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
              .fetchBookingsList(
            page: event.page,
          )
              .then(
            (value) {
              final val = BookingsResponseDto.fromJson(value);
              print(val);
              emit(
                state.copyWith(
                  states: TheStates.success,
                  bookingList: val,
                  isLoaded: true,
                  isUpdated: false,
                  isCancelled: false,
                  isRejected: false,
                ),
              );
            },
          );
        } catch (e) {
          log('bookings loaded error:' + e.toString());
          emit(
            state.copyWith(
              states: TheStates.failure,
              isLoaded: false,
            ),
          );
        }
      },
    );

    on<MyBookingLoaded>(
      (event, emit) async {
        try {
          emit(state.copyWith(states: TheStates.initial));
          await repositories.fetchMyBookingsList(page: event.page).then(
            (value) {
              emit(
                state.copyWith(
                  states: TheStates.success,
                  myBookingListModel: booking.MyBookingListModel.fromJson(value),
                  isLoaded: true,
                  isUpdated: false,
                  isCancelled: false,
                  isRejected: false,
                ),
              );
            },
          );
        } catch (e) {
          log('my bookings loaded error:' + e.toString());
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
          if (event.id is int) {
            await repositories.fetchSingleBooking(id: event.id as int).then(
              (value) {
                final val = BookingSingleDto.fromJson(value);

                emit(
                  state.copyWith(
                    states: TheStates.success,
                    result: val,
                  ),
                );
              },
            );
          } else {
            // Might need to update fromJson model in future
            await repositories.fetchBooking(id: event.id as String).then(
              (value) {
                emit(
                  state.copyWith(
                    states: TheStates.success,
                    bookingRes: (Result.fromJson(value)).copyWith(),
                  ),
                );
              },
            );
          }
        } catch (e) {
          print("error $e");

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
          ).whenComplete(
            () => add(MyBookingLoaded(page: 1)),
          );
        } catch (e) {
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
            (value) {
              print(value);
              emit(
                state.copyWith(
                  states: TheStates.success,
                  isCancelled: true,
                ),
              );
            },
          ).whenComplete(
            () => add(
              MyBookingLoaded(
                page: 1,
              ),
            ),
          );
          ;
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
                  MyBookingLoaded(
                    page: 1,
                  ),
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

    on<BookingRejected>(
      (event, emit) async {
        try {
          await repositories
              .rejectBooking(event.rejectReq)
              .then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isRejected: true,
                  ),
                ),
              )
              .whenComplete(
                () => add(
                  MyBookingLoaded(
                    page: 1,
                  ),
                ),
              );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
              isRejected: false,
            ),
          );
        }
      },
    );

    on<BookingStatusUpdate>(
      (event, emit) async {
        try {
          await repositories.updateStatus(status: event.status, id: event.id).then(
            (value) {
              print(value);
              emit(
                state.copyWith(
                  states: TheStates.success,
                ),
              );
            },
          ).whenComplete(
            () => add(
              BookingSingleLoaded(event.id),
            ),
          );
        } catch (e) {
          emit(
            state.copyWith(
              states: TheStates.failure,
              isRejected: false,
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
              emit(
                state.copyWith(
                  states: TheStates.success,
                  bookingHistoryRes: BookingsResponseDto.fromJson(value),
                  isLoaded: true,
                  isUpdated: false,
                  isCancelled: false,
                  isRejected: false,
                ),
              );
            },
          );
        } catch (e) {
          log('history error' + e.toString());
          emit(
            state.copyWith(states: TheStates.failure, isLoaded: false),
          );
        }
      },
    );
  }
}
