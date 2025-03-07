// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'bookings_response_dto.freezed.dart';
part 'bookings_response_dto.g.dart';

@freezed
class BookingsResponseDto with _$BookingsResponseDto {
  const factory BookingsResponseDto({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _BookingsResponseDto;

  factory BookingsResponseDto.fromJson(Map<String, dynamic> json) => _$BookingsResponseDtoFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? id,
    Assigner? assigner,
    Assignee? assignee,
    @JsonKey(name: 'entity_service') EntityService? entityService,
    Currency? currency,
    @JsonKey(name: 'is_rated') bool? isRated,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    @JsonKey(name: 'cancellation_description') String? cancellationDescription,
    @JsonKey(name: 'cancelled_by') Assignee? cancelledBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    @JsonKey(name: 'is_active') bool? isActive,
    String? status,
    String? title,
    String? description,
    String? price,
    String? earning,
    @JsonKey(name: 'estimated_time') int? estimatedTime,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'completed_on') DateTime? completedOn,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'extra_data') dynamic extraData,
    @JsonKey(name: 'is_paid') bool? isPaid,
    @JsonKey(name: 'approved_by') String? approvedBy,
    int? booking,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Assignee with _$Assignee {
  const factory Assignee({
    String? id,
    String? username,
    String? email,
    String? phone,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? bio,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? designation,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
    Badge? badge,
  }) = _Assignee;

  factory Assignee.fromJson(Map<String, dynamic> json) => _$AssigneeFromJson(json);
}
@freezed
class Assigner with _$Assigner {
  const factory Assigner({
    String? id,
    String? username,
    String? email,
    String? phone,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? bio,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? designation,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
    Badge? badge,
  }) = _Assigner;

  factory Assigner.fromJson(Map<String, dynamic> json) => _$AssignerFromJson(json);
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
class Currency with _$Currency {
  const factory Currency({
    String? code,
    String? name,
    String? symbol,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}

@freezed
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'budget_from') String? budgetFrom,
    @JsonKey(name: 'budget_to') String? budgetTo,
    List<Image>? images,
    List<Image>? videos,
    @JsonKey(name: 'created_by') Assignee? createdBy,
    List<String>? highlights,
    String? location,
  @JsonKey(name: 'is_requested')  bool? isRequested ,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    int? id,
    String? name,
    String? size,
    @JsonKey(name: 'media_type') String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class ExtraDataClass with _$ExtraDataClass {
  const factory ExtraDataClass() = _ExtraDataClass;

  factory ExtraDataClass.fromJson(Map<String, dynamic> json) => _$ExtraDataClassFromJson(json);
}
