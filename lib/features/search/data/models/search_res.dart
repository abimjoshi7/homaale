import 'package:dependencies/dependencies.dart';

import '../../../saved/data/models/res/saved_model_res.dart';

part 'search_res.freezed.dart';
part 'search_res.g.dart';

@freezed
class SearchRes with _$SearchRes {
  const factory SearchRes({
    @JsonKey(name: "task") List<ServiceElement>? task,
    @JsonKey(name: "service") List<ServiceElement>? service,
    @JsonKey(name: "tasker") List<Tasker>? tasker,
  }) = _SearchRes;

  factory SearchRes.fromJson(Map<String, dynamic> json) =>
      _$SearchResFromJson(json);
}

@freezed
class ServiceElement with _$ServiceElement {
  const factory ServiceElement({
    String? id,
    String? slug,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    String? title,
    Currency? currency,
    City? city,
    @JsonKey(name: "is_online") bool? isOnline,
    Service? service,
    List<Image>? images,
    double? rating,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "is_requested") bool? isRequested,
    @JsonKey(name: "budget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
    String? location,
    int? count,
		 @JsonKey(name: "rating_count") int? ratingCount,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    List<Image>? videos,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
  }) = _ServiceElement;

  factory ServiceElement.fromJson(Map<String, dynamic> json) =>
      _$ServiceElementFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    num? rating,
    @JsonKey(name: "rating_count") num? ratingCount,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Tasker with _$Tasker {
  const factory Tasker({
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
    @JsonKey(name: "security_questions") List<dynamic>? securityQuestions,
  }) = _Tasker;

  factory Tasker.fromJson(Map<String, dynamic> json) => _$TaskerFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    num? id,
    String? name,
    num? latitude,
    num? longitude,
    dynamic country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
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
class Country with _$Country {
  const factory Country({
    String? name,
    String? code,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
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
