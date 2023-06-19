// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bookings_bloc.dart';

abstract class BookingsEvent extends Equatable {
  const BookingsEvent();
}

class BookingLoaded extends BookingsEvent {
  final String? status;
  final int? page;
  const BookingLoaded({
    this.status,
    this.page,
  });

  @override
  List<Object?> get props => [status, page];
}

class MyBookingLoaded extends BookingsEvent {
  final int? page;
  const MyBookingLoaded({
    this.page,
  });

  @override
  List<Object?> get props => [page];
}

class BookingSingleLoaded extends BookingsEvent {
  final dynamic id;

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
  final bool isTask;
  const BookingEdited({
    required this.id,
    required this.req,
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        id,
        req,
        isTask,
      ];
}

class BookingApproved extends BookingsEvent {
  final ApproveReq approveReq;
  const BookingApproved({
    required this.approveReq,
  });
  @override
  List<Object?> get props => [
        approveReq,
      ];
}

class BookingDeleted extends BookingsEvent {
  final int id;
  final bool isTask;
  const BookingDeleted({
    required this.id,
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        id,
        isTask,
      ];
}

class BookingRejected extends BookingsEvent {
  final RejectReq rejectReq;
  final bool isTask;
  const BookingRejected({
    required this.rejectReq,
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        rejectReq,
        isTask,
      ];
}

class BookingHistory extends BookingsEvent {
  final BookingHistoryReq bookingHistoryReq;
  const BookingHistory({
    required this.bookingHistoryReq,
  });
  @override
  List<Object?> get props => [
        bookingHistoryReq,
      ];
}

class BookingCancelled extends BookingsEvent {
  final int id;
  final bool isTask;
  const BookingCancelled({
    required this.id,
    required this.isTask,
  });
  @override
  List<Object?> get props => [
        id,
        isTask,
      ];
}

class BookingStatusUpdate extends BookingsEvent {
  final String id;
  final String status;
  const BookingStatusUpdate({
    required this.id,
    required this.status,
  });
  @override
  List<Object?> get props => [id, status];
}

class BookingNegotiationBudgetUpdate extends BookingsEvent {
  final int id;
  final String budget;
  BookingNegotiationBudgetUpdate({
    required this.id,
    required this.budget,
  });
  @override
  List<Object?> get props => [id, budget];
}
