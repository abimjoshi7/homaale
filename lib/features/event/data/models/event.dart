// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'event.freezed.dart';
part 'event.g.dart';

@freezed
class Event with _$Event {
  const factory Event({
    String? id,
    String? title,
    DateTime? start,
    DateTime? end,
    @JsonKey(name: "is_flexible") bool? isFlexible,
    @JsonKey(name: "is_active") bool? isActive,
    List<Schedule>? schedules,
    String? duration,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "all_shifts") List<AllShift>? allShifts,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class AllShift with _$AllShift {
  const factory AllShift({
    DateTime? date,
    List<Slot>? slots,
  }) = _AllShift;

  factory AllShift.fromJson(Map<String, dynamic> json) =>
      _$AllShiftFromJson(json);
}

@freezed
class Slot with _$Slot {
  const factory Slot({
    String? start,
    String? end,
  }) = _Slot;

  factory Slot.fromJson(Map<String, dynamic> json) => _$SlotFromJson(json);
}

@freezed
class Schedule with _$Schedule {
  const factory Schedule({
    String? id,
    String? title,
    @JsonKey(name: "repeat_type") int? repeatType,
    String? repeat,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "total_slots") int? totalSlots,
  }) = _Schedule;

  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);
}
