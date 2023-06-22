// To parse this JSON data, do
//
//     final singleScheduleRes = singleScheduleResFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'single_schedule_res.freezed.dart';
part 'single_schedule_res.g.dart';

@freezed
class SingleScheduleRes with _$SingleScheduleRes {
  const factory SingleScheduleRes({
    String? id,
    String? title,
    String? event,
    @JsonKey(name: "repeat_type") int? repeatType,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "is_active")bool? isActive,
    @JsonKey(name: "total_slots")int? totalSlots,
    List<Slot>? slots,
  }) = _SingleScheduleRes;

  factory SingleScheduleRes.fromJson(Map<String, dynamic> json) =>
      _$SingleScheduleResFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    String? start,
    String? end,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}
