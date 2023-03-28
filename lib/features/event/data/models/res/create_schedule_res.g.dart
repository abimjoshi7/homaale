// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_schedule_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateScheduleRes _$$_CreateScheduleResFromJson(Map<String, dynamic> json) =>
    _$_CreateScheduleRes(
      id: json['id'] as String?,
      title: json['title'] as String?,
      event: json['event'] as String?,
      repeatType: json['repeat_type'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      guestLimit: json['guest_limit'] as int?,
      isActive: json['is_active'] as bool?,
      totalSlots: json['total_slots'] as int?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CreateScheduleResToJson(
        _$_CreateScheduleRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'event': instance.event,
      'repeat_type': instance.repeatType,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'guest_limit': instance.guestLimit,
      'is_active': instance.isActive,
      'total_slots': instance.totalSlots,
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
