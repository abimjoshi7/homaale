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
    @JsonKey(name: 'created_by') ResultCreatedBy? createdBy,
    @JsonKey(name: 'entity_service') EntityService? entityService,
    List<dynamic>? images,
    List<dynamic>? videos,
    @JsonKey(name: 'progress_percentage') int? progressPercent,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? description,
    List<String>? requirements,
    String? price,
    String? earning,
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    String? location,
    @JsonKey(name: 'is_active') bool? isActive,
    String? status,
    @JsonKey(name: 'extra_data') dynamic? extraData,
    @JsonKey(name: 'is_accepted') bool? isAccepted,
    @JsonKey(name: 'cancelling_party') String? cancellingParty,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    @JsonKey(name: 'cancellation_description') String? cancellationDescription,
    @JsonKey(name: 'is_refunded') bool? isRefunded,
    @JsonKey(name: 'is_compensated') bool? isCompensated,
    @JsonKey(name: 'is_penalized') bool? isPenalized,
    @JsonKey(name: 'updated_by') String? updatedBy,
    @JsonKey(name: 'approved_by') dynamic? approvedBy,
    String? owner,
    int? city,
    @JsonKey(name: 'cancelled_by') dynamic? cancelledBy,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class ResultCreatedBy with _$ResultCreatedBy {
  const factory ResultCreatedBy({
    int? id,
    User? user,
    String? bio,
    @JsonKey(name: 'profile_image') String? profileImage,
    Stats? stats,
    List<String>? skills,
    @JsonKey(name: 'charge_currency') Currency? chargeCurrency,
    CreatedByCity? city,
    @JsonKey(name: 'address_line1') String? addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
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
class CreatedByCity with _$CreatedByCity {
  const factory CreatedByCity({
    int? id,
    String? name,
    @JsonKey(name: 'local_name') String? localName,
    @JsonKey(name: 'zip_code') String? zipCode,
    double? latitude,
    double? longitude,
    String? country,
  }) = _CreatedByCity;

  factory CreatedByCity.fromJson(Map<String, dynamic> json) => _$CreatedByCityFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: 'success_rate') num? successRate,
    @JsonKey(name: 'happy_clients') num? happyClients,
    @JsonKey(name: 'task_completed') num? taskCompleted,
    @JsonKey(name: 'user_reviews') num? userReviews,
    @JsonKey(name: 'task_assigned') num? taskAssigned,
    @JsonKey(name: 'task_in_progress') num? taskInProgress,
    @JsonKey(name: 'task_cancelled') num? taskCancelled,
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
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    @JsonKey(name: 'created_by') EntityServiceCreatedBy? createdBy,
    Currency? currency,
    EntityServiceCity? city,
    List<dynamic>? images,
    List<dynamic>? videos,
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
    @JsonKey(name: 'start_date') DateTime? startDate,
    @JsonKey(name: 'end_date') DateTime? endDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'share_location') bool? shareLocation,
    @JsonKey(name: 'is_negotiable') bool? isNegotiable,
    int? revisions,
    @JsonKey(name: 'views_count') int? viewsCount,
    String? location,
    @JsonKey(name: 'is_profesisonal') bool? isProfessional,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'discount_type') String? discountType,
    @JsonKey(name: 'discount_value') String? discountValue,
    String? slug,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'needs_approval') bool? needsApproval,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    @JsonKey(name: 'updated_by') String? updatedBy,
    String? owner,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
}

@freezed
class EntityServiceCity with _$EntityServiceCity {
  const factory EntityServiceCity({
    int? id,
    String? name,
    double? latitude,
    double? longitude,
    Country? country,
  }) = _EntityServiceCity;

  factory EntityServiceCity.fromJson(Map<String, dynamic> json) => _$EntityServiceCityFromJson(json);
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
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_verified') bool? isVerified,
    Category? category,
    List<dynamic>? images,
    @JsonKey(name: 'required_documents') List<RequiredDocument>? requiredDocuments,
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

@freezed
class RequiredDocument with _$RequiredDocument {
  const factory RequiredDocument({
    int? id,
    String? name,
    @JsonKey(name: 'required_for_user') bool? requiredForUser,
    @JsonKey(name: 'required_for_merchant') bool? requiredForMerchant,
  }) = _RequiredDocument;

  factory RequiredDocument.fromJson(Map<String, dynamic> json) => _$RequiredDocumentFromJson(json);
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
    @JsonKey(name: 'active_dates') List<String>? activeDates,
    @JsonKey(name: 'guest_limit') double? guestLimit,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
