part of 'bookings_bloc.dart';

enum BookingType { all, task, service }

class BookingsState extends Equatable {
  final TheStates? states;
  final MyBookingListModel? myBookingListModelTask;
  final MyBookingListModel? myBookingListModelService;
  final BookEntityServiceRes? bookEntityServiceRes;
  final BookingType? bookingType;
  final EditBookingRes? editBookingRes;
  final bool? isBookingSuccess;
  final bool? isDeleteSuccess;

  const BookingsState({
    this.states = TheStates.initial,
    this.myBookingListModelTask,
    this.myBookingListModelService,
    this.bookEntityServiceRes,
    this.bookingType = BookingType.all,
    this.editBookingRes,
    this.isBookingSuccess,
    this.isDeleteSuccess = false,
  });

  BookingsState copyWith({
    TheStates? states,
    MyBookingListModel? myBookingListModelTask,
    MyBookingListModel? myBookingListModelService,
    BookEntityServiceRes? bookEntityServiceRes,
    BookingType? bookingType,
    EditBookingRes? editBookingRes,
    bool? isBookingSuccess,
    bool? isDeleteSuccess,
  }) {
    return BookingsState(
      states: states ?? this.states,
      myBookingListModelTask:
          myBookingListModelTask ?? this.myBookingListModelTask,
      myBookingListModelService:
          myBookingListModelService ?? this.myBookingListModelService,
      bookEntityServiceRes: bookEntityServiceRes ?? this.bookEntityServiceRes,
      bookingType: bookingType ?? this.bookingType,
      editBookingRes: editBookingRes ?? this.editBookingRes,
      isBookingSuccess: isBookingSuccess ?? this.isBookingSuccess,
      isDeleteSuccess: isDeleteSuccess ?? this.isDeleteSuccess,
    );
  }

  @override
  List<Object?> get props {
    return [
      states,
      myBookingListModelTask,
      myBookingListModelService,
      bookEntityServiceRes,
      bookingType,
      editBookingRes,
      isBookingSuccess,
      isDeleteSuccess,
    ];
  }
}
