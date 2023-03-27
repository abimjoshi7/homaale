part of 'bookings_bloc.dart';

enum BookingType { all, task, service }

class BookingsState extends Equatable {
  final TheStates? states;
  final booking.Result? result;
  final booking.MyBookingListModel? myBookingListModelTask;
  final booking.MyBookingListModel? myBookingListModelService;
  final BookingHistoryRes? bookingHistoryRes;
  final BookingType? bookingType;
  final EditBookingRes? editBookingRes;
  final bool? isLoaded;
  final bool? isBooked;
  final bool? isUpdated;
  final bool? isApproved;
  final bool? isCancelled;
  final bool? isDeleted;
  final bool? isRejected;

  const BookingsState({
    this.states = TheStates.initial,
    this.result,
    this.myBookingListModelTask,
    this.myBookingListModelService,
    this.bookingType = BookingType.all,
    this.editBookingRes,
    this.isLoaded,
    this.isBooked,
    this.isUpdated,
    this.bookingHistoryRes,
    this.isApproved,
    this.isCancelled,
    this.isDeleted = false,
    this.isRejected,
  });

  BookingsState copyWith({
    TheStates? states,
    booking.Result? result,
    booking.MyBookingListModel? myBookingListModelTask,
    booking.MyBookingListModel? myBookingListModelService,
    BookingType? bookingType,
    BookingHistoryRes? bookingHistoryRes,
    EditBookingRes? editBookingRes,
    bool? isLoaded,
    bool? isBooked,
    bool? isUpdated,
    bool? isApproved,
    bool? isCancelled,
    bool? isDeleted,
    bool? isRejected,
  }) {
    return BookingsState(
      states: states ?? this.states,
      result: result ?? this.result,
      myBookingListModelTask: myBookingListModelTask ?? this.myBookingListModelTask,
      myBookingListModelService: myBookingListModelService ?? this.myBookingListModelService,
      bookingHistoryRes: bookingHistoryRes ?? this.bookingHistoryRes,
      bookingType: bookingType ?? this.bookingType,
      editBookingRes: editBookingRes ?? this.editBookingRes,
      isLoaded: isLoaded ?? this.isLoaded,
      isBooked: isBooked ?? this.isBooked,
      isUpdated: isUpdated ?? this.isUpdated,
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
      result,
      myBookingListModelTask,
      myBookingListModelService,
      bookingHistoryRes,
      bookingType,
      editBookingRes,
      isLoaded,
      isBooked,
      isUpdated,
      isApproved,
      isCancelled,
      isDeleted,
      isRejected,
    ];
  }
}
