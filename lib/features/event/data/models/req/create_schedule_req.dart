// To parse this JSON data, do
//
//     final createScheduleReq = createScheduleReqFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'create_schedule_req.freezed.dart';
part 'create_schedule_req.g.dart';

@freezed
class CreateScheduleReq with _$CreateScheduleReq {
  const factory CreateScheduleReq({
    // String? id,
    String? event,
    @JsonKey(name: "repeat_type") int? repeatType,
    @JsonKey(name: "start_date") String? startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "is_active") bool? isActive,
    List<Slot>? slots,
  }) = _CreateScheduleReq;

  factory CreateScheduleReq.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleReqFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    String? start,
    String? end,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}
