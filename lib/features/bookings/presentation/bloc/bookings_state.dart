part of 'bookings_bloc.dart';

enum BookingType { all, task, service }

class BookingsState extends Equatable {
  final TheStates states;
  final booking.Result result;
  final Result bookingRes;
  final BookingsResponseDto bookingList;
  final booking.MyBookingListModel myBookingListModel;
  final BookingsResponseDto bookingHistoryRes;
  final BookingType bookingType;
  final EditBookingRes editBookingRes;
  final bool isLoaded;
  final bool isBooked;
  final bool isUpdated;
  final bool isApproved;
  final bool isCancelled;
  final bool isDeleted;
  final bool isRejected;

  const BookingsState({
    this.states = TheStates.initial,
    this.result = const booking.Result(),
    this.bookingRes = const Result(),
    this.bookingList = const BookingsResponseDto(),
    this.bookingType = BookingType.all,
    this.editBookingRes = const EditBookingRes(),
    this.bookingHistoryRes = const BookingsResponseDto(),
    this.myBookingListModel = const booking.MyBookingListModel(),
    this.isLoaded = false,
    this.isBooked = false,
    this.isUpdated = false,
    this.isApproved = false,
    this.isCancelled = false,
    this.isDeleted = false,
    this.isRejected = false,
  });

  BookingsState copyWith({
    TheStates? states,
    booking.Result? result,
    Result? bookingRes,
    BookingsResponseDto? bookingList,
    BookingType? bookingType,
    BookingsResponseDto? bookingHistoryRes,
    EditBookingRes? editBookingRes,
    booking.MyBookingListModel? myBookingListModel,
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
      bookingRes: bookingRes ?? this.bookingRes,
      myBookingListModel: myBookingListModel ?? this.myBookingListModel,
      bookingList: bookingList ?? this.bookingList,
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
      bookingRes,
      bookingList,
      bookingHistoryRes,
      myBookingListModel,
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
