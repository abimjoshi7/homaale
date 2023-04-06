// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_schedule_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateScheduleReq _$$_CreateScheduleReqFromJson(Map<String, dynamic> json) =>
    _$_CreateScheduleReq(
      id: json['id'] as String?,
      event: json['event'] as String?,
      repeatType: json['repeat_type'] as int?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      guestLimit: json['guest_limit'] as int?,
      isActive: json['is_active'] as bool?,
      slots: (json['slots'] as List<dynamic>?)
          ?.map((e) => Slot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_CreateScheduleReqToJson(
        _$_CreateScheduleReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event': instance.event,
      'repeat_type': instance.repeatType,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'guest_limit': instance.guestLimit,
      'is_active': instance.isActive,
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
