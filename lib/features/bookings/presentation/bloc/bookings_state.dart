part of 'bookings_bloc.dart';

abstract class BookingsState extends Equatable {
  const BookingsState();
}

class BookingsInitial extends BookingsState {
  @override
  List<Object?> get props => [];
}

class BookingsFailure extends BookingsState {
  @override
  List<Object?> get props => [];
}

class ServiceBookingLoadSuccess extends BookingsState {
  final MyBookingList myBookingList;

  const ServiceBookingLoadSuccess(this.myBookingList);
  @override
  List<Object?> get props => [myBookingList];
}

class ServiceBookingAddSuccess extends BookingsState {
  final BookEntityServiceRes res;

  const ServiceBookingAddSuccess(this.res);
  @override
  List<Object?> get props => [res];
}

class ServiceBookingAddFailure extends BookingsState {
  @override
  List<Object?> get props => [];
}

class ServiceBookingEditSuccess extends BookingsState {
  final EditBookingRes res;

  const ServiceBookingEditSuccess(this.res);
  @override
  List<Object?> get props => [
        res,
      ];
}

class ServiceBookingDeleteSuccess extends BookingsState {
  @override
  List<Object?> get props => [];
}
