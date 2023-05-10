// import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_model.dart';
// import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
// import 'package:dependencies/dependencies.dart';
//
// part 'support_ticket_model.freezed.dart';
// part 'support_ticket_model.g.dart';
//
// @freezed
// class SupportTicketModel with _$SupportTicketModel {
//   const factory SupportTicketModel({
//     int? id,
//     SupportTicketType? type,
//     @JsonKey(name: "created_by") CreatedBy? createdBy,
//     User? user,
//     List<Image>? attachment,
//     String? object,
//     @JsonKey(name: "object_type") String? objectType,
//     @JsonKey(name: "created_at") DateTime? createdAt,
//     @JsonKey(name: "updated_at") DateTime? updatedAt,
//     @JsonKey(name: "is_active") bool? isActive,
//     String? status,
//     String? reason,
//     @JsonKey(name: "object_id") String? objectId,
//     @JsonKey(name: "is_resolved") bool? isResolved,
//     String? description,
//   }) = _SupportTicketModel;
//
//   factory SupportTicketModel.fromJson(Map<String, dynamic> json) =>
//       _$SupportTicketModelFromJson(json);
// }
//
// @freezed
// class SupportTicketType with _$SupportTicketType {
//   const factory SupportTicketType({
//     int? id,
//     String? name,
//     String? slug,
//   }) = _SupportTicketType;
//
//   factory SupportTicketType.fromJson(Map<String, dynamic> json) =>
//       _$SupportTicketTypeFromJson(json);
// }


// To parse this JSON data, do
//
//     final supportTicketModel = supportTicketModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'support_ticket_model.freezed.dart';
part 'support_ticket_model.g.dart';


@freezed
class SupportTicketModel with _$SupportTicketModel {
  const factory SupportTicketModel({
   @JsonKey(name:'total_pages') int? totalPages,
    int? count,
    int? current,
    dynamic next,
    dynamic previous,
    @JsonKey(name:'page_size') int? pageSize,
    List<Result>? result,
  }) = _SupportTicketModel;

  factory SupportTicketModel.fromJson(Map<String, dynamic> json) => _$SupportTicketModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    Type? type,
    @JsonKey(name:'created_by') CreatedBy? createdBy,
    CreatedBy? user,
    List<Attachment>? attachment,
    String? object,
    @JsonKey(name:'object_type') String? objectType,
    @JsonKey(name:'created_at') DateTime? createdAt,
    @JsonKey(name:'updated_at') DateTime? updatedAt,
    @JsonKey(name:'is_active') bool? isActive,
    String? status,
    String? reason,
    String? description,
    @JsonKey(name:'object_id')  String? objectId,
    @JsonKey(name:'is_resolved') bool? isResolved,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Attachment with _$Attachment {
  const factory Attachment({
    int? id,
    String? name,
    String? size,
    @JsonKey(name:'media_type')  String? mediaType,
    String? media,
  }) = _Attachment;

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    String? id,
    String? username,
    String? email,
    dynamic phone,
    @JsonKey(name:'full_name')  String? fullName,
    @JsonKey(name:'first_name') String? firstName,
    @JsonKey(name:'middle_name') String? middleName,
    @JsonKey(name:'last_name') String? lastName,
    @JsonKey(name:'profile_image') String? profileImage,
    String? bio,
    @JsonKey(name:'created_at') DateTime? createdAt,
    String? designation,
    @JsonKey(name:'is_profile_verified')    bool? isProfileVerified,
    @JsonKey(name:'is_followed') bool? isFollowed,
    @JsonKey(name:'is_following') bool? isFollowing,
    Badge? badge,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class Badge with _$Badge {
  const factory Badge({
    int? id,
    String? image,
    String? title,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}

@freezed
class Type with _$Type {
  const factory Type({
    int? id,
    String? name,
    String? slug,
  }) = _Type;

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);
}
