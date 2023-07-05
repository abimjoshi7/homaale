// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'rating_response_dto.freezed.dart';
part 'rating_response_dto.g.dart';

@freezed
class RatingResponseDto with _$RatingResponseDto {
  const factory RatingResponseDto({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _RatingResponseDto;

  factory RatingResponseDto.fromJson(Map<String, dynamic> json) => _$RatingResponseDtoFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: 'rated_by') RatedBy? ratedBy,
    int? rating,
    String? review,
    String? reply,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'replied_date') String? repliedDate,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class RatedBy with _$RatedBy {
  const factory RatedBy({
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
    @JsonKey(name: 'created_at') String? createdAt,
    String? designation,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
    Badge? badge,
  }) = _RatedBy;

  factory RatedBy.fromJson(Map<String, dynamic> json) => _$RatedByFromJson(json);
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
