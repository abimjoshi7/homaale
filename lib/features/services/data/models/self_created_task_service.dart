// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'self_created_task_service.freezed.dart';
part 'self_created_task_service.g.dart';

@freezed
class SelfCreatedTaskService with _$SelfCreatedTaskService {
  const factory SelfCreatedTaskService({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _SelfCreatedTaskService;

  factory SelfCreatedTaskService.fromJson(Map<String, dynamic> json) => _$SelfCreatedTaskServiceFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? id,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
    Currency? currency,
    City? city,
    List<Image>? images,
    List<Image>? videos,
    Service? service,
    Event? event,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? title,
    String? description,
    List<String>? highlights,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'is_range') bool? isRange,
    @JsonKey(name: 'budget_from') String? budgetFrom,
    @JsonKey(name: 'budget_to') String? budgetTo,
    @JsonKey(name: 'payable_from') String? payableFrom,
    @JsonKey(name: 'payable_to') String? payableTo,
    @JsonKey(name: 'start_date') dynamic? startDate,
    @JsonKey(name: 'end_date') dynamic? endDate,
    @JsonKey(name: 'start_time') dynamic? startTime,
    @JsonKey(name: 'end_time') dynamic? endTime,
    @JsonKey(name: 'share_location') bool? shareLocation,
    @JsonKey(name: 'is_negotiable') bool? isNegotiable,
    int? revisions,
    @JsonKey(name: 'views_count') int? viewsCount,
    String? location,
    @JsonKey(name: 'is_professional') bool? isProfessional,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'discount_type') String? discountType,
    @JsonKey(name: 'discount_value') String? discountValue,
    @JsonKey(name: 'extra_data') dynamic? extraData,
    String? slug,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'needs_approval') bool? needsApproval,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    @JsonKey(name: 'updated_by') String? updatedBy,
    String? owner,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    Country? country,
  }) = _City;

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
}

@freezed
class Country with _$Country {
  const factory Country({
    String? name,
    String? code,
  }) = _Country;

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? designation,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
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
class Currency with _$Currency {
  const factory Currency({
    String? code,
    String? name,
    String? symbol,
  }) = _Currency;

  factory Currency.fromJson(Map<String, dynamic> json) => _$CurrencyFromJson(json);
}

@freezed
class Event with _$Event {
  const factory Event({
    String? id,
    String? title,
    DateTime? start,
    DateTime? end,
    String? duration,
    @JsonKey(name: 'is_flexible') bool? isFlexible,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'active_dates') List<DateTime>? activeDates,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class ExtraDataClass with _$ExtraDataClass {
  const factory ExtraDataClass() = _ExtraDataClass;

  factory ExtraDataClass.fromJson(Map<String, dynamic> json) => _$ExtraDataClassFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    int? id,
    String? name,
    String? size,
    @JsonKey(name: 'meida_type') String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_verified') bool? isVerified,
    Category? category,
    List<dynamic>? images,
    @JsonKey(name: 'required_documents') List<dynamic>? requiredDocuments,
    String? commission,
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
