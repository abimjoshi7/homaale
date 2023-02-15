part of 'bookings_bloc.dart';

abstract class BookingsEvent extends Equatable {
  const BookingsEvent();
}

class EntityServiceBookingInitiated extends BookingsEvent {
  final BookEntityServiceReq service;

  const EntityServiceBookingInitiated(this.service);
  @override
  List<Object?> get props => [service];
}
