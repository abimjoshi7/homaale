part of 'bookings_bloc.dart';

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
