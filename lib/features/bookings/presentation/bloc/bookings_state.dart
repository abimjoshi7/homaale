part of 'bookings_bloc.dart';

class BookingsState extends Equatable {
  final TheStates? states;
  final MyBookingListModel? myBookingListModel;
  final MyBookingList? myBookingList;
  final BookEntityServiceRes? bookEntityServiceRes;
  final EditBookingRes? editBookingRes;
  final bool? isDeleteSuccess;

  const BookingsState({
    this.states = TheStates.initial,
    this.myBookingListModel,
    this.myBookingList,
    this.bookEntityServiceRes,
    this.editBookingRes,
    this.isDeleteSuccess = false,
  });

  BookingsState copyWith({
    TheStates? states,
    MyBookingListModel? myBookingListModel,
    MyBookingList? myBookingList,
    BookEntityServiceRes? bookEntityServiceRes,
    EditBookingRes? editBookingRes,
    bool? isDeleteSuccess,
  }) {
    return BookingsState(
      states: states ?? this.states,
      myBookingListModel: myBookingListModel ?? this.myBookingListModel,
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
      myBookingListModel,
      myBookingList,
      bookEntityServiceRes,
      editBookingRes,
      isDeleteSuccess,
    ];
  }
}
