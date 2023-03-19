// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Event _$$_EventFromJson(Map<String, dynamic> json) => _$_Event(
      id: json['id'] as String?,
      title: json['title'] as String?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
      isFlexible: json['is_flexible'] as bool?,
      isActive: json['is_active'] as bool?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => Schedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as String?,
      guestLimit: json['guest_limit'] as int?,
      allShifts: (json['all_shifts'] as List<dynamic>?)
          ?.map((e) => AllShift.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_EventToJson(_$_Event instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'is_flexible': instance.isFlexible,
      'is_active': instance.isActive,
      'schedules': instance.schedules,
      'duration': instance.duration,
      'guest_limit': instance.guestLimit,
      'all_shifts': instance.allShifts,
    };

_$_AllShift _$$_AllShiftFromJson(Map<String, dynamic> json) => _$_AllShift(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      slots: (json['slots'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AllShiftToJson(_$_AllShift instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'slots': instance.slots,
    };

_$_Slot _$$_SlotFromJson(Map<String, dynamic> json) => _$_Slot(
      start: json['start'] as String?,
      end: json['end'] as String?,
    );

Map<String, dynamic> _$$_SlotToJson(_$_Slot instance) => <String, dynamic>{
      'start': instance.start,
      'end': instance.end,
    };

_$_Schedule _$$_ScheduleFromJson(Map<String, dynamic> json) => _$_Schedule(
      id: json['id'] as String?,
      title: json['title'] as String?,
      repeatType: json['repeat_type'] as int?,
      repeat: json['repeat'] as String?,
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      totalSlots: json['total_slots'] as int?,
    );

Map<String, dynamic> _$$_ScheduleToJson(_$_Schedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'repeat_type': instance.repeatType,
      'repeat': instance.repeat,
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'total_slots': instance.totalSlots,
    };
