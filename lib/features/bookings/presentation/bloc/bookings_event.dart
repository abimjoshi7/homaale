// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookings_bloc.dart';

abstract class BookingsEvent extends Equatable {
  const BookingsEvent();
}

class ServiceBookingInitiated extends BookingsEvent {
  final BookEntityServiceReq service;

  const ServiceBookingInitiated(this.service);
  @override
  List<Object?> get props => [service];
}

class ServiceBookingListLoadInitiated extends BookingsEvent {
  @override
  List<Object?> get props => [];
}

class ServiceBookingEditInitiated extends BookingsEvent {
  final int id;
  final EditBookingReq req;
  const ServiceBookingEditInitiated({
    required this.id,
    required this.req,
  });
  @override
  List<Object?> get props => [
        id,
        req,
      ];
}

class ServiceBookingDeleteInitiated extends BookingsEvent {
  final int id;
  const ServiceBookingDeleteInitiated({
    required this.id,
  });
  @override
  List<Object?> get props => [
        id,
      ];
}

class ServiceBookingCancelInitiated extends BookingsEvent {
  @override
  List<Object?> get props => [];
}
