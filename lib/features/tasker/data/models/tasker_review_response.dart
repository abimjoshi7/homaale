// To parse this JSON data, do
//
//     final taskerReviewResponse = taskerReviewResponseFromJson(jsonString);

import 'package:dependencies/dependencies.dart';

part 'tasker_review_response.freezed.dart';
part 'tasker_review_response.g.dart';

@freezed
class TaskerReviewResponse with _$TaskerReviewResponse {
  const factory TaskerReviewResponse({
    int? totalPages,
    int? count,
    int? current,
    dynamic? next,
    dynamic? previous,
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
    Rated? ratedTo,
    Rated? ratedBy,
    DateTime? createdAt,
    int? rating,
    String? review,
    dynamic? reply,
    dynamic? repliedDate,
    bool? isVerified,
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
    dynamic? phone,
    String? fullName,
    String? firstName,
    String? middleName,
    String? lastName,
    String? profileImage,
    String? bio,
    DateTime? createdAt,
    String? designation,
    String? userType,
    String? isProfileVerified,
    bool? isFollowed,
    bool? isFollowing,
    Avatar? avatar,
    Badge? badge,
  }) = _Rated;

  factory Rated.fromJson(Map<String, dynamic> json) => _$RatedFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    String? image,
    int? id,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
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
