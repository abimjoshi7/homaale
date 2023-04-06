// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_apply_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskApplyCountModel _$$_TaskApplyCountModelFromJson(
        Map<String, dynamic> json) =>
    _$_TaskApplyCountModel(
      count: (json['count'] as List<dynamic>?)
          ?.map((e) => Count.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskApplyCountModelToJson(
        _$_TaskApplyCountModel instance) =>
    <String, dynamic>{
      'count': instance.count,
    };

_$_Count _$$_CountFromJson(Map<String, dynamic> json) => _$_Count(
      taskerCount: json['tasker_count'] as int?,
    );

Map<String, dynamic> _$$_CountToJson(_$_Count instance) => <String, dynamic>{
      'tasker_count': instance.taskerCount,
    };
