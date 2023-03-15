// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_notification_list.freezed.dart';
part 'all_notification_list.g.dart';

@freezed
class AllNotificationList with _$AllNotificationList {
  const factory AllNotificationList({
    @JsonKey(name: "total_pages")  int? totalPages,
    int? count,
    int? current,
    dynamic? next,
    dynamic? previous,
    @JsonKey(name: "page_size") int? pageSize,
    List<Result>? result,
    @JsonKey(name: "unread_count") int? unreadCount,
  }) = _AllNotificationList;

  factory AllNotificationList.fromJson(Map<String, dynamic> json) => _$AllNotificationListFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? user,
    @JsonKey(name: "create_for")  CreatedFor? createdFor,
    @JsonKey(name: "content_object")  ContentObject? contentObject,
    String? title,
    @JsonKey(name:"created_date") DateTime? createdDate,
    @JsonKey(name:"read_date") DateTime? readDate,
    @JsonKey(name:"content_type") int? contentType,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class ContentObject with _$ContentObject {
  const factory ContentObject({
    dynamic id,
    @JsonKey(name: "entity_service")EntityService? entityService,
    String? status,
  }) = _ContentObject;

  factory ContentObject.fromJson(Map<String, dynamic> json) => _$ContentObjectFromJson(json);
}

@freezed
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    String? title,
   @JsonKey(name: "is_requested") bool? isRequested,
    String? slug,
    @JsonKey(name:"created_by") String? createdBy,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
}

@freezed
class CreatedFor with _$CreatedFor {
  const factory CreatedFor({
    String? id,
   @JsonKey(name: "full_name") String? fullName,
   @JsonKey(name:"profile_image") String? profileImage,
  }) = _CreatedFor;

  factory CreatedFor.fromJson(Map<String, dynamic> json) => _$CreatedForFromJson(json);
}
