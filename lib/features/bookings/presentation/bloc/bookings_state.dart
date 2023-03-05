part of 'bookings_bloc.dart';

// abstract class BookingsState extends Equatable {
//   const BookingsState();
// }

// class BookingsInitial extends BookingsState {
//   @override
//   List<Object?> get props => [];
// }

// class BookingsFailure extends BookingsState {
//   @override
//   List<Object?> get props => [];
// }

// class ServiceBookingLoadSuccess extends BookingsState {
//   final MyBookingList myBookingList;

//   const ServiceBookingLoadSuccess(this.myBookingList);
//   @override
//   List<Object?> get props => [myBookingList];
// }

// class ServiceBookingAddSuccess extends BookingsState {
//   final BookEntityServiceRes res;

//   const ServiceBookingAddSuccess(this.res);
//   @override
//   List<Object?> get props => [res];
// }

// class ServiceBookingAddFailure extends BookingsState {
//   @override
//   List<Object?> get props => [];
// }

// class ServiceBookingEditSuccess extends BookingsState {
//   final EditBookingRes res;

//   const ServiceBookingEditSuccess(this.res);
//   @override
//   List<Object?> get props => [
//         res,
//       ];
// }

// class ServiceBookingDeleteSuccess extends BookingsState {
//   @override
//   List<Object?> get props => [];
// }

class BookingState extends Equatable {
  final TheStates? states;
  final MyBookingList? myBookingList;
  final BookEntityServiceRes? bookEntityServiceRes;
  final EditBookingRes? editBookingRes;
  final bool? isDeleteSuccess;

  const BookingState({
    this.states = TheStates.initial,
    this.myBookingList,
    this.bookEntityServiceRes,
    this.editBookingRes,
    this.isDeleteSuccess = false,
  });

  BookingState copyWith({
    TheStates? states,
    MyBookingList? myBookingList,
    BookEntityServiceRes? bookEntityServiceRes,
    EditBookingRes? editBookingRes,
    bool? isDeleteSuccess,
  }) {
    return BookingState(
      states: states ?? this.states,
      myBookingList: myBookingList ?? this.myBookingList,
      bookEntityServiceRes: bookEntityServiceRes ?? this.bookEntityServiceRes,
      editBookingRes: editBookingRes ?? this.editBookingRes,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
    );
  }

  @override
  List<Object?> get props {
    return [
      states,
      myBookingList,
      bookEntityServiceRes,
      editBookingRes,
      isDeleteSuccess,
    ];
  }
}
