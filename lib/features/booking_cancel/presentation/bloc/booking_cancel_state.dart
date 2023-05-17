import 'package:cipher/features/booking_cancel/data/models/booking_cancel_model.dart';
import 'package:dependencies/dependencies.dart';

import '../../../../../core/constants/enums.dart';

class BookingCancelState extends Equatable {
  final TheStates? theState;
  final BookingCancelModel? bookingCancelModel;

  const BookingCancelState({
    this.theState,
    this.bookingCancelModel,
  });

  BookingCancelState copyWith({
    TheStates? theState,
    BookingCancelModel? bookingCancelModel,
  }) {
    return BookingCancelState(
      theState: theState ?? this.theState,
      bookingCancelModel: bookingCancelModel ?? this.bookingCancelModel,
    );
  }

  @override
  List<Object?> get props {
    return [
      theState,
      bookingCancelModel,
    ];
  }
}
