part of 'bookings_bloc.dart';

enum BookingType { all, task, service }

class BookingsState extends Equatable {
  final TheStates? states;
  final MyBookingListModel? myBookingListModelTask;
  final MyBookingListModel? myBookingListModelService;
  final BookEntityServiceRes? bookEntityServiceRes;
  final BookingType? bookingType;
  final EditBookingRes? editBookingRes;
  final bool? isBooked;
  final bool? isBookingUpdated;
  final bool? isApproved;
  final bool? isCancelled;
  final bool? isDeleted;
  final bool? isRejected;

  const BookingsState({
    this.states = TheStates.initial,
    this.myBookingListModelTask,
    this.myBookingListModelService,
    this.bookEntityServiceRes,
    this.bookingType = BookingType.all,
    this.editBookingRes,
    this.isBooked,
    this.isBookingUpdated,
    this.isApproved,
    this.isCancelled,
    this.isDeleted = false,
    this.isRejected,
  });

  BookingsState copyWith({
    TheStates? states,
    MyBookingListModel? myBookingListModelTask,
    MyBookingListModel? myBookingListModelService,
    BookEntityServiceRes? bookEntityServiceRes,
    BookingType? bookingType,
    EditBookingRes? editBookingRes,
    bool? isBooked,
    bool? isBookingUpdated,
    bool? isApproved,
    bool? isCancelled,
    bool? isDeleted,
    bool? isRejected,
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
      isBooked: isBooked ?? this.isBooked,
      isBookingUpdated: isBookingUpdated ?? this.isBookingUpdated,
      isApproved: isApproved ?? this.isApproved,
      isCancelled: isCancelled ?? this.isCancelled,
      isDeleted: isDeleted ?? this.isDeleted,
      isRejected: isRejected ?? this.isRejected,
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
      isBooked,
      isBookingUpdated,
      isApproved,
      isCancelled,
      isDeleted,
      isRejected,
    ];
  }
}
