// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_notification_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AllNotificationList _$$_AllNotificationListFromJson(
        Map<String, dynamic> json) =>
    _$_AllNotificationList(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'],
      previous: json['previous'],
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      unreadCount: json['unread_count'] as int?,
    );

Map<String, dynamic> _$$_AllNotificationListToJson(
        _$_AllNotificationList instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
      'unread_count': instance.unreadCount,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      user: json['user'] as String?,
      createdFor: json['created_for'] == null
          ? null
          : CreatedFor.fromJson(json['created_for'] as Map<String, dynamic>),
      contentObject: json['content_object'] == null
          ? null
          : ContentObject.fromJson(
              json['content_object'] as Map<String, dynamic>),
      title: json['title'] as String?,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      readDate: json['read_date'] == null
          ? null
          : DateTime.parse(json['read_date'] as String),
      contentType: json['content_type'] as int?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'created_for': instance.createdFor,
      'content_object': instance.contentObject,
      'title': instance.title,
      'created_date': instance.createdDate?.toIso8601String(),
      'read_date': instance.readDate?.toIso8601String(),
      'content_type': instance.contentType,
    };

_$_ContentObject _$$_ContentObjectFromJson(Map<String, dynamic> json) =>
    _$_ContentObject(
      id: json['id'],
      entityService: json['entity_service'] == null
          ? null
          : EntityService.fromJson(
              json['entity_service'] as Map<String, dynamic>),
      status: json['status'] as String?,
      task: json['task'] as String?,
    );

Map<String, dynamic> _$$_ContentObjectToJson(_$_ContentObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'entity_service': instance.entityService,
      'status': instance.status,
      'task': instance.task,
    };

_$_EntityService _$$_EntityServiceFromJson(Map<String, dynamic> json) =>
    _$_EntityService(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isRequested: json['is_requested'] as bool?,
      slug: json['slug'] as String?,
      createdBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$$_EntityServiceToJson(_$_EntityService instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'is_requested': instance.isRequested,
      'slug': instance.slug,
      'created_by': instance.createdBy,
    };

_$_CreatedFor _$$_CreatedForFromJson(Map<String, dynamic> json) =>
    _$_CreatedFor(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$_CreatedForToJson(_$_CreatedFor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_image': instance.profileImage,
    };
