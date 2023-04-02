// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'create_schedule_res.freezed.dart';
part 'create_schedule_res.g.dart';

@freezed
class CreateScheduleRes with _$CreateScheduleRes {
  const factory CreateScheduleRes({
    String? id,
    String? title,
    String? event,
    @JsonKey(name: "repeat_type") int? repeatType,
    @JsonKey(name: "start_date") String? startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "total_slots") int? totalSlots,
    List<Slot>? slots,
  }) = _CreateScheduleRes;

  factory CreateScheduleRes.fromJson(Map<String, dynamic> json) =>
      _$CreateScheduleResFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    String? start,
    String? end,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}
