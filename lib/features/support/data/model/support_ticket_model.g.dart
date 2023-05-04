// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SupportTicketModel _$$_SupportTicketModelFromJson(
        Map<String, dynamic> json) =>
    _$_SupportTicketModel(
      id: json['id'] as int?,
      type: json['type'] == null
          ? null
          : SupportTicketType.fromJson(json['type'] as Map<String, dynamic>),
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      attachment: (json['attachment'] as List<dynamic>?)
          ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      object: json['object'] as String?,
      objectType: json['object_type'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      isActive: json['is_active'] as bool?,
      status: json['status'] as String?,
      reason: json['reason'] as String?,
      objectId: json['object_id'] as String?,
      isResolved: json['is_resolved'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_SupportTicketModelToJson(
        _$_SupportTicketModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'created_by': instance.createdBy,
      'user': instance.user,
      'attachment': instance.attachment,
      'object': instance.object,
      'object_type': instance.objectType,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'is_active': instance.isActive,
      'status': instance.status,
      'reason': instance.reason,
      'object_id': instance.objectId,
      'is_resolved': instance.isResolved,
      'description': instance.description,
    };

_$_SupportTicketType _$$_SupportTicketTypeFromJson(Map<String, dynamic> json) =>
    _$_SupportTicketType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$$_SupportTicketTypeToJson(
        _$_SupportTicketType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
