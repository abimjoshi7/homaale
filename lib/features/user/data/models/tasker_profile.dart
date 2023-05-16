// To parse this JSON data, do
//
//     final taskerProfile = taskerProfileFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

import '../../../bookings/data/models/bookings_response_dto.dart';
import '../../../search/data/models/search_res.dart';

part 'tasker_profile.freezed.dart';
part 'tasker_profile.g.dart';

@freezed
class TaskerProfile with _$TaskerProfile {
  const factory TaskerProfile({
    int? id,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "charge_currency") Currency? chargeCurrency,
    User? user,
    List<Portfolio>? portfolio,
    List<Experience>? experience,
    List<Education>? education,
    List<Certificate>? certificates,
    Stats? stats,
    Rating? rating,
    Country? country,
    Language? language,
    City? city,
    List<Interest>? interests,
    @JsonKey(name: "is_followed") bool? isFollowed,
    Badge? badge,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    String? status,
    String? bio,
    String? gender,
    @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
    String? skill,
    @JsonKey(name: "active_hour_start") String? activeHourStart,
    @JsonKey(name: "active_hour_end") String? activeHourEnd,
    @JsonKey(name: "experience_level") String? experienceLevel,
    @JsonKey(name: "profile_visibility") String? profileVisibility,
    @JsonKey(name: "task_preferences") String? taskPreferences,
    @JsonKey(name: "address_line1") String? addressLine1,
    @JsonKey(name: "address_line2") String? addressLine2,
    @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
    String? designation,
    int? points,
    @JsonKey(name: "remaining_points") int? remainingPoints,
    @JsonKey(name: "followers_count") int? followersCount,
    @JsonKey(name: "following_count") int? followingCount,
    dynamic avatar,
    List<dynamic>? subscription,
    @JsonKey(name: "") List<dynamic>? securityQuestions,
  }) = _TaskerProfile;

  factory TaskerProfile.fromJson(Map<String, dynamic> json) =>
      _$TaskerProfileFromJson(json);
}

@freezed
class Badge with _$Badge {
  const factory Badge({
    int? id,
    dynamic next,
    String? image,
    String? title,
    @JsonKey(name: "progress_level_start") int? progressLevelStart,
    @JsonKey(name: "progress_level_end") int? progressLevelEnd,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}

@freezed
class Language with _$Language {
  const factory Language({
    String? name,
    String? code,
  }) = _Language;

  factory Language.fromJson(Map<String, dynamic> json) =>
      _$LanguageFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    int? id,
    String? title,
    String? description,
    @JsonKey(name: "employment_type") String? employmentType,
    @JsonKey(name: "company_name") String? companyName,
    String? location,
    @JsonKey(name: "currently_working") bool? currentlyWorking,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    int? id,
    String? school,
    String? description,
    String? degree,
    @JsonKey(name: "field_of_study") String? fieldOfStudy,
    String? location,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);
}

@freezed
class Certificate with _$Certificate {
  const factory Certificate({
    int? id,
    String? name,
    @JsonKey(name: "issuing_organization") String? issuingOrganization,
    String? description,
    bool? doesExpire,
    @JsonKey(name: "credential_id") String? credentialId,
    @JsonKey(name: "certificate_url") String? certificateUrl,
    @JsonKey(name: "issued_date") DateTime? issuedDate,
    @JsonKey(name: "expire_date") DateTime? expireDate,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) =>
      _$CertificateFromJson(json);
}

@freezed
class Interest with _$Interest {
  const factory Interest({
    int? id,
    String? name,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) =>
      _$InterestFromJson(json);
}

@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    int? id,
    List<Image>? images,
    List<dynamic>? files,
    String? title,
    String? description,
    @JsonKey(name: "issued_date") DateTime? issuedDate,
    @JsonKey(name: "credential_url") String? credentialUrl,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) =>
      _$PortfolioFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    @JsonKey(name: "user_rating_count") int? userRatingCount,
    @JsonKey(name: "avg_rating") num? avgRating,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: "success_rate") double? successRate,
    @JsonKey(name: "happy_clients") double? happyClients,
    @JsonKey(name: "task_completed") double? taskCompleted,
    @JsonKey(name: "user_reviews") double? userReviews,
    @JsonKey(name: "task_assigned") double? taskAssigned,
    @JsonKey(name: "task_in_progess") double? taskInProgress,
    @JsonKey(name: "task_cancelled") double? taskCancelled,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? username,
    String? email,
    @JsonKey(name: "draft_email") String? draftEmail,
    String? phone,
    @JsonKey(name: "draft_phone") String? draftPhone,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "middle_name") String? middleName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "profile_image") String? profileImage,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
