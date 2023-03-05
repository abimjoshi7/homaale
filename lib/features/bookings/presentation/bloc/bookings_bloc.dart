import 'package:bloc/bloc.dart';
import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_res.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:equatable/equatable.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingState> {
  final repositories = BookingRepositories();
  BookingsBloc() : super(const BookingState()) {
    on<ServiceBookingInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(states: TheStates.initial),
          );
          await repositories.bookServiceOrTask(event.service).then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    bookEntityServiceRes: BookEntityServiceRes.fromJson(
                      value,
                    ),
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

    on<ServiceBookingListLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              states: TheStates.initial,
            ),
          );
          await repositories.fetchMyServiceBookingList().then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    myBookingList: MyBookingList.fromJson(
                      value,
                    ),
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

    on<ServiceBookingEditInitiated>(
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

    on<ServiceBookingDeleteInitiated>(
      (event, emit) async {
        try {
          await repositories
              .deleteBooking(event.id)
              .then(
                (value) => emit(
                  state.copyWith(
                    states: TheStates.success,
                    isDeleteSuccess: true,
                  ),
                ),
              )
              .whenComplete(
                () => add(
                  ServiceBookingListLoadInitiated(),
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
