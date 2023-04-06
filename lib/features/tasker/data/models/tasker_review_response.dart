// To parse this JSON data, do
//
//     final taskerReviewResponse = taskerReviewResponseFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'tasker_review_response.freezed.dart';
part 'tasker_review_response.g.dart';

@freezed
class TaskerReviewResponse with _$TaskerReviewResponse {
  const factory TaskerReviewResponse({
    int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    int? pageSize,
    List<Result>? result,
  }) = _TaskerReviewResponse;

  factory TaskerReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$TaskerReviewResponseFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: 'rated_to') Rated? ratedTo,
    @JsonKey(name: 'rated_by') Rated? ratedBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    int? rating,
    String? review,
    dynamic reply,
    @JsonKey(name: 'replied_date') dynamic repliedDate,
    @JsonKey(name: 'is_verified') bool? isVerified,
    String? task,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Rated with _$Rated {
  const factory Rated({
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
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
    Badge? badge,
  }) = _Rated;

  factory Rated.fromJson(Map<String, dynamic> json) => _$RatedFromJson(json);
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
