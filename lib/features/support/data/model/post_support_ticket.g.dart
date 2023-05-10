// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_support_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostSupportTicket _$$_PostSupportTicketFromJson(Map<String, dynamic> json) =>
    _$_PostSupportTicket(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['update_at'] == null
          ? null
          : DateTime.parse(json['update_at'] as String),
      reason: json['reason'] as String?,
      description: json['description'] as String?,
      objectId: json['object_id'] as String?,
      type: json['type'] as String?,
      attachment: json['attachment'] as List<dynamic>?,
    );

Map<String, dynamic> _$$_PostSupportTicketToJson(
        _$_PostSupportTicket instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'update_at': instance.updatedAt?.toIso8601String(),
      'reason': instance.reason,
      'description': instance.description,
      'object_id': instance.objectId,
      'type': instance.type,
      'attachment': instance.attachment,
    };
