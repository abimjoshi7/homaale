import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_cancel_model.freezed.dart';
part 'booking_cancel_model.g.dart';

@freezed
class BookingCancelModel with _$BookingCancelModel {
  const factory BookingCancelModel(
      {@JsonKey(name: 'cancellation_reason')
          String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          String? cancellationDescription}) = _BookingCancelModel;

  factory BookingCancelModel.fromJson(Map<String, dynamic> json) =>
      _$BookingCancelModelFromJson(json);
}
