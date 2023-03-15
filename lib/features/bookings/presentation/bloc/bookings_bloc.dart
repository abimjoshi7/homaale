import 'package:cipher/core/constants/enums.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_res.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_req.dart';
import 'package:cipher/features/bookings/data/models/edit_booking_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list_model.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:dependencies/dependencies.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final repositories = BookingRepositories();
  BookingsBloc() : super(const BookingsState()) {
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

    on<MyTaskServiceBookingListLoadInitiated>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(
              states: TheStates.initial,
            ),
          );
          await repositories
              .fetchMyServiceTaskBookingList(
            isTask: event.isTask,
            status: event.status,
          )
              .then(
            (value) {
              final data = MyBookingListModel.fromJson(value);
              if (event.isTask == true) {
                emit(
                  state.copyWith(
                    states: TheStates.success,
                    myBookingListModelTask: data,
                  ),
                );
              } else {
                emit(
                  state.copyWith(
                    states: TheStates.success,
                    myBookingListModelService: data,
                  ),
                );
              }
            },
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
                  const MyTaskServiceBookingListLoadInitiated(
                    isTask: true,
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
  }
}
