// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'my_booking_list_model.freezed.dart';
part 'my_booking_list_model.g.dart';

@freezed
class MyBookingListModel with _$MyBookingListModel {
  const factory MyBookingListModel({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: "page_size") int? pageSize,
    List<Result>? result,
  }) = _MyBookingListModel;

  factory MyBookingListModel.fromJson(Map<String, dynamic> json) => _$MyBookingListModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: "created_by") ResultCreatedBy? createdBy,
    @JsonKey(name: "entity_service") EntityService? entityService,
    List<Image>? images,
    List<Image>? videos,
    @JsonKey(name: "progress_percent") double? progressPercent,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    String? description,
    List<String>? requirements,
    @JsonKey(name: "budget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    String? location,
    @JsonKey(name: "is_active") bool? isActive,
    String? status,
    @JsonKey(name: "is_accepted") bool? isAccepted,
    // @JsonKey(name: "booking_merchant") dynamic bookingMerchant,
    int? city,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class ResultCreatedBy with _$ResultCreatedBy {
  const factory ResultCreatedBy({
    int? id,
    User? user,
    String? bio,
    @JsonKey(name: "user_type") String? userType,
    @JsonKey(name: "profile_image") String? profileImage,
    Stats? stats,
    String? skill,
    @JsonKey(name: "charge_currency") Currency? chargeCurrency,
    @JsonKey(name: "hourly_rate") double? hourlyRate,
  }) = _ResultCreatedBy;

  factory ResultCreatedBy.fromJson(Map<String, dynamic> json) => _$ResultCreatedByFromJson(json);
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
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: "success_rate") double? successRate,
    @JsonKey(name: "happy_clients") double? happyClients,
    @JsonKey(name: "task_completed") double? taskCompleted,
    @JsonKey(name: "user_reviews") double? userReviews,
    @JsonKey(name: "task_assigned") double? taskAssigned,
    @JsonKey(name: "task_in_progress") double? taskInProgress,
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
    String? phone,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "middle_name") String? middleName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "created_at") DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    @JsonKey(name: "created_by") EntityServiceCreatedBy? createdBy,
    Currency? currency,
    City? city,
    List<Image>? images,
    List<Image>? videos,
    Service? service,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    String? title,
    String? description,
    List<String>? highlights,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "budget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    @JsonKey(name: "share_location") bool? shareLocation,
    @JsonKey(name: "is_negotiable") bool? isNegotiable,
    int? revisions,
    // @JsonKey(name: "recursion_type") String? recursionType,
    @JsonKey(name: "view_count") int? viewsCount,
    String? location,
    @JsonKey(name: "is_professional") bool? isProfessional,
    @JsonKey(name: "is_online") bool? isOnline,
    @JsonKey(name: "is_requested") bool? isRequested,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") String? discountValue,
    @JsonKey(name: "no_of_reservation") int? noOfReservation,
    String? slug,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "needs_approval") bool? needsApproval,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    // dynamic? merchant,
    Event? event,
    // dynamic? avatar,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
}

@freezed
class Event with _$Event {
  const factory Event({
    String? id,
    String? title,
    DateTime? start,
    DateTime? end,
    String? duration,
    bool? isFlexible,
    bool? isActive,
    List<DateTime>? activeDates,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
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
class EntityServiceCreatedBy with _$EntityServiceCreatedBy {
  const factory EntityServiceCreatedBy({
    String? id,
    String? username,
    String? email,
    String? phone,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "middle_name") String? middleName,
    @JsonKey(name: "last_name") String? lastName,
    @JsonKey(name: "profile_image") String? profileImage,
    String? bio,
    @JsonKey(name: "created_at") DateTime? createdAt,
    String? designation,
    @JsonKey(name: "user_type") String? userType,
    @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
    @JsonKey(name: "is_followed") bool? isFollowed,
    @JsonKey(name: "is_following") bool? isFollowing,
    Badge? badge,
  }) = _EntityServiceCreatedBy;

  factory EntityServiceCreatedBy.fromJson(Map<String, dynamic> json) => _$EntityServiceCreatedByFromJson(json);
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
class Image with _$Image {
  const factory Image({
    int? id,
    String? name,
    String? size,
    @JsonKey(name: "media_type") String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "is_verified") bool? isVerified,
    Category? category,
    List<Image>? images,
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
