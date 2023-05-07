// class PostServiceTicket {
//   PostServiceTicket({
//     this.id,
//     this.name,
//     this.createdAt,
//     this.updatedAt,
//     this.reason,
//     this.description,
//     this.objectId,
//     this.type,
//     this.attachment,
//   });
//
//   final int? id;
//   final String? name;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final String? reason;
//   final String? description;
//   final String? objectId;
//   final int? type;
//   final List<dynamic>? attachment;
//
//   factory PostServiceTicket.fromJson(Map<String, dynamic> json) =>
//       PostServiceTicket(
//         id: json['id'] as int?,
//         name: json["name"] as String?,
//         createdAt: json["create_at"] as DateTime?,
//         updatedAt: json["updated_at"] as DateTime?,
//         reason: json["reason"] as String?,
//         description: json["description"] as String?,
//         objectId: json["object_id"] as String?,
//         type: json["type"] as int?,
//         attachment: json["attachment"] as List?,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "create_at": createdAt,
//         "updated_at": updatedAt,
//         "reason": reason,
//         "description": description,
//         "object_id": objectId,
//         "type": type,
//         "attachment": attachment,
//       };
// }

// To parse this JSON data, do
//
//     final postSupportTicket = postSupportTicketFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'post_support_ticket.freezed.dart';
part 'post_support_ticket.g.dart';

@freezed
class PostSupportTicket with _$PostSupportTicket {
  const factory PostSupportTicket({
    int? id,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'update_at') DateTime? updatedAt,
    String? reason,
    String? description,
    @JsonKey(name: 'object_id') String? objectId,
    int? type,
    List<dynamic>? attachment,
  }) = _PostSupportTicket;

  factory PostSupportTicket.fromJson(Map<String, dynamic> json) =>
      _$PostSupportTicketFromJson(json);
}
