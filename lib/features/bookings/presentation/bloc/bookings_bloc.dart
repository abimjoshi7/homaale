import 'package:bloc/bloc.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_req.dart';
import 'package:cipher/features/bookings/data/models/book_entity_service_res.dart';
import 'package:cipher/features/bookings/data/models/my_booking_list.dart';
import 'package:cipher/features/bookings/data/repositories/booking_repositories.dart';
import 'package:equatable/equatable.dart';

part 'bookings_event.dart';
part 'bookings_state.dart';

class BookingsBloc extends Bloc<BookingsEvent, BookingsState> {
  final repositories = BookingRepositories();
  BookingsBloc() : super(BookingsInitial()) {
    on<EntityServiceBookingInitiated>(
      (event, emit) async {
        try {
          emit(
            BookingsInitial(),
          );
          await repositories.bookEntityService(event.service).then(
                (value) => emit(
                  BookEntityServiceAddSuccess(
                    BookEntityServiceRes.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            BookEntityServiceAddFailure(),
          );
        }
      },
    );

    on<ServiceBookingListInitiated>(
      (event, emit) async {
        try {
          emit(
            BookingsInitial(),
          );
          await repositories.fetchMyBookingList().then(
                (value) => emit(
                  BookEntityServiceLoadSuccess(
                    MyBookingList.fromJson(
                      value,
                    ),
                  ),
                ),
              );
        } catch (e) {
          emit(
            BookEntityServiceLoadFailure(),
          );
        }
      },
    );
  }
}
