// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookings_bloc.dart';

abstract class BookingsEvent extends Equatable {
  const BookingsEvent();
}

class BookingLoaded extends BookingsEvent {
  final bool? isTask;
  final String? status;
  const BookingLoaded({
    this.isTask,
    this.status,
  });

  @override
  List<Object?> get props => [
        isTask,
        status,
      ];
}

class BookingSingleLoaded extends BookingsEvent {
  final int id;

  const BookingSingleLoaded(
    this.id,
  );
  @override
  List<Object?> get props => [
        id,
      ];
}

class BookingCreated extends BookingsEvent {
  final BookEntityServiceReq service;

  const BookingCreated(this.service);
  @override
  List<Object?> get props => [service];
}

class BookingEdited extends BookingsEvent {
  final int id;
  final EditBookingReq req;
  const BookingEdited({
    required this.id,
    required this.req,
  });
  @override
  List<Object?> get props => [
        id,
        req,
      ];
}

class BookingApproved extends BookingsEvent {
  final int id;
  const BookingApproved({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}

class BookingDeleted extends BookingsEvent {
  final int id;
  const BookingDeleted({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}

class BookingCancelled extends BookingsEvent {
  final int id;
  const BookingCancelled({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}
