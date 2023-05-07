// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_activities_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserActivitiesTimeline _$$_UserActivitiesTimelineFromJson(
        Map<String, dynamic> json) =>
    _$_UserActivitiesTimeline(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_UserActivitiesTimelineToJson(
        _$_UserActivitiesTimeline instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      contentType: json['content_type'] as String?,
      actionTime: json['action_time'] == null
          ? null
          : DateTime.parse(json['action_time'] as String),
      objectId: json['object_id'] as String?,
      objectRepr: json['object_repr'] as String?,
      action: json['action'] as String?,
      changeMessage: json['change_message'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'content_type': instance.contentType,
      'action_time': instance.actionTime?.toIso8601String(),
      'object_id': instance.objectId,
      'object_repr': instance.objectRepr,
      'action': instance.action,
      'change_message': instance.changeMessage,
      'user': instance.user,
    };
