import 'package:dependencies/dependencies.dart';

abstract class BookingCancelEvent extends Equatable {
  const BookingCancelEvent();
}

class CancelActionPost extends BookingCancelEvent {
  final int bookingId;
  final String reason;
  final String description;

  const CancelActionPost({
    required this.bookingId,
    required this.reason,
    required this.description,
  });
  @override
  List<Object?> get props => [bookingId, reason, description];
}
