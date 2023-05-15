

import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_cancel_model.freezed.dart';
part 'booking_cancel_model.g.dart';


@freezed
class BookingCancelModel with _$BookingCancelModel {
  const factory BookingCancelModel({
    String? status,
    String? message,
  }) = _BookingCancelModel;

  factory BookingCancelModel.fromJson(Map<String, dynamic> json) => _$BookingCancelModelFromJson(json);
}
