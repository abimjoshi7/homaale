// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'saved_model_res.freezed.dart';
part 'saved_model_res.g.dart';

@freezed
class SavedModelRes with _$SavedModelRes {
  const factory SavedModelRes({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _SavedModelRes;

  factory SavedModelRes.fromJson(Map<String, dynamic> json) => _$SavedModelResFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? user,
    String? type,
    Data? data,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'object_id') String? objectId,
    @JsonKey(name: 'content_type') int? contentType,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    dynamic? id,
    @JsonKey(name: 'profile_image') String? profileImage,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'charge_currency') Currency? chargeCurrency,
    User? user,
    List<Portfolio>? portfolio,
    List<Experience>? experience,
    List<Education>? education,
    List<Certificate>? certificates,
    Stats? stats,
    double? rating,
    CountryClass? country,
    CountryClass? language,
    City? city,
    List<Interest>? interests,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    NextClass? badge,
    @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
    String? status,
    String? bio,
    String? gender,
    @JsonKey(name: 'date_of_brith') DateTime? dateOfBirth,
    String? skill,
    @JsonKey(name: 'active_hour_start') String? activeHourStart,
    @JsonKey(name: 'active_hour_end') String? activeHourEnd,
    @JsonKey(name: 'experience_level') String? experienceLevel,
    @JsonKey(name: 'profile_visibility') String? profileVisibility,
    @JsonKey(name: 'task_preferences') String? taskPreferences,
    @JsonKey(name: 'address_line1') String? addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    String? designation,
    int? points,
    @JsonKey(name: 'remaining_point') int? remainingPoints,
    @JsonKey(name: 'followers_count') int? followersCount,
    @JsonKey(name: 'following_count') int? followingCount,
    int? avatar,
    List<dynamic>? subscription,
    @JsonKey(name: 'security_questions') List<int>? securityQuestions,
    String? slug,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
    String? title,
    Currency? currency,
    @JsonKey(name: 'is_online') bool? isOnline,
    Service? service,
    List<dynamic>? images,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'is_range') bool? isRange,
    @JsonKey(name: 'budget_from') String? budgetFrom,
    @JsonKey(name: 'budget_to') String? budgetTo,
    String? location,
    int? count,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    List<dynamic>? videos,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class NextClass with _$NextClass {
  const factory NextClass({
    int? id,
    NextClass? next,
    String? image,
    String? title,
    @JsonKey(name: 'progress_level_start') int? progressLevelStart,
    @JsonKey(name: 'progress_level_end') int? progressLevelEnd,
  }) = _NextClass;

  factory NextClass.fromJson(Map<String, dynamic> json) => _$NextClassFromJson(json);
}

@freezed
class Certificate with _$Certificate {
  const factory Certificate({
    int? id,
    String? name,
    @JsonKey(name: 'issuing_organization') String? issuingOrganization,
    String? description,
    @JsonKey(name: 'created_at') bool? doesExpire,
    @JsonKey(name: 'credential_id') String? credentialId,
    @JsonKey(name: 'certificate_url') String? certificateUrl,
    dynamic? image,
    @JsonKey(name: 'issued_date') DateTime? issuedDate,
    @JsonKey(name: 'expire_date') DateTime? expireDate,
  }) = _Certificate;

  factory Certificate.fromJson(Map<String, dynamic> json) => _$CertificateFromJson(json);
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
class City with _$City {
  const factory City({
    int? id,
    String? name,
    @JsonKey(name: 'local_name') String? localName,
    @JsonKey(name: 'zip_code') String? zipCode,
    double? latitude,
    double? longitude,
    dynamic? country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class CountryClass with _$CountryClass {
  const factory CountryClass({
    String? name,
    String? code,
  }) = _CountryClass;

  factory CountryClass.fromJson(Map<String, dynamic> json) => _$CountryClassFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
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
    CreatedByBadge? badge,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class CreatedByBadge with _$CreatedByBadge {
  const factory CreatedByBadge({
    int? id,
    String? image,
    String? title,
  }) = _CreatedByBadge;

  factory CreatedByBadge.fromJson(Map<String, dynamic> json) => _$CreatedByBadgeFromJson(json);
}

@freezed
class Education with _$Education {
  const factory Education({
    int? id,
    String? school,
    String? description,
    String? degree,
    @JsonKey(name: 'field_of_study') String? fieldOfStudy,
    String? location,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
  }) = _Education;

  factory Education.fromJson(Map<String, dynamic> json) => _$EducationFromJson(json);
}

@freezed
class Experience with _$Experience {
  const factory Experience({
    int? id,
    String? title,
    String? description,
    @JsonKey(name: 'employment_type') String? employmentType,
    @JsonKey(name: 'company_name') String? companyName,
    String? location,
    @JsonKey(name: 'currently_working') bool? currentlyWorking,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
  }) = _Experience;

  factory Experience.fromJson(Map<String, dynamic> json) => _$ExperienceFromJson(json);
}

@freezed
class Interest with _$Interest {
  const factory Interest({
    int? id,
    String? name,
  }) = _Interest;

  factory Interest.fromJson(Map<String, dynamic> json) => _$InterestFromJson(json);
}

@freezed
class Portfolio with _$Portfolio {
  const factory Portfolio({
    int? id,
    List<Image>? images,
    List<Image>? files,
    String? title,
    String? description,
    @JsonKey(name: 'issued_date') DateTime? issuedDate,
    @JsonKey(name: 'cretential_url') String? credentialUrl,
  }) = _Portfolio;

  factory Portfolio.fromJson(Map<String, dynamic> json) => _$PortfolioFromJson(json);
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
class RatingElement with _$RatingElement {
  const factory RatingElement({
    int? rating,
    @JsonKey(name: 'rating_count') int? ratingCount,
  }) = _RatingElement;

  factory RatingElement.fromJson(Map<String, dynamic> json) => _$RatingElementFromJson(json);
}

@freezed
class PurpleRating with _$PurpleRating {
  const factory PurpleRating({
    @JsonKey(name: 'user_rating_count') int? userRatingCount,
    @JsonKey(name: 'avg_rating') double? avgRating,
  }) = _PurpleRating;

  factory PurpleRating.fromJson(Map<String, dynamic> json) => _$PurpleRatingFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_verified') bool? isVerified,
    Category? category,
    List<Image>? images,
    @JsonKey(name: 'required_documents') List<dynamic>? requiredDocuments,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) => _$ServiceFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    int? level,
    String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: 'success_rate') double? successRate,
    @JsonKey(name: 'happy_clients') int? happyClients,
    @JsonKey(name: 'task_completed') int? taskCompleted,
    @JsonKey(name: 'user_reviews') int? userReviews,
    @JsonKey(name: 'task_assigned') int? taskAssigned,
    @JsonKey(name: 'task_in_progress') int? taskInProgress,
    @JsonKey(name: 'task_cancelled') int? taskCancelled,
  }) = _Stats;

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);
}

@freezed
class User with _$User {
  const factory User({
    String? id,
    String? username,
    String? email,
    dynamic? phone,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
