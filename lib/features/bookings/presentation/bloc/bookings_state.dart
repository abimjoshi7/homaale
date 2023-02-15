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

class BookEntityServiceLoadSuccess extends BookingsState {
  final MyBookingList myBookingList;

  const BookEntityServiceLoadSuccess(this.myBookingList);
  @override
  List<Object?> get props => [myBookingList];
}

class BookEntityServiceLoadFailure extends BookingsState {
  @override
  List<Object?> get props => [];
}

class BookEntityServiceAddSuccess extends BookingsState {
  final BookEntityServiceRes res;

  const BookEntityServiceAddSuccess(this.res);
  @override
  List<Object?> get props => [res];
}

class BookEntityServiceAddFailure extends BookingsState {
  @override
  List<Object?> get props => [];
}
