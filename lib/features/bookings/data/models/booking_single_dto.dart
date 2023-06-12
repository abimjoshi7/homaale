// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'booking_single_dto.freezed.dart';
part 'booking_single_dto.g.dart';

@freezed
class BookingSingleDto with _$BookingSingleDto {
  const factory BookingSingleDto({
    int? id,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
    CreatedBy? owner,
    @JsonKey(name: 'approved_by') EdBy? approvedBy,
    @JsonKey(name: 'cancelled_by') EdBy? cancelledBy,
    @JsonKey(name: 'entity_service') EntityService? entityService,
    List<Image>? images,
    List<Image>? videos,
    @JsonKey(name: 'progress_percentage') int? progressPercentage,
    City? city,
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
    @JsonKey(name: 'is_accepted') bool? isAccepted,
    @JsonKey(name: 'cancelling_party') String? cancellingParty,
    @JsonKey(name: 'cancellation_reason') String? cancellationReason,
    @JsonKey(name: 'cancellation_description') String? cancellationDescription,
    @JsonKey(name: 'is_refunded') bool? isRefunded,
    @JsonKey(name: 'is_compensated') bool? isCompensated,
    @JsonKey(name: 'is_penalized') bool? isPenalized,
    @JsonKey(name: 'updated_by') String? updatedBy,
  }) = _BookingSingleDto;

  factory BookingSingleDto.fromJson(Map<String, dynamic> json) => _$BookingSingleDtoFromJson(json);
}

@freezed
class EdBy with _$EdBy {
  const factory EdBy({
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
  }) = _EdBy;

  factory EdBy.fromJson(Map<String, dynamic> json) => _$EdByFromJson(json);
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
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    int? id,
    User? user,
    String? bio,
    @JsonKey(name: 'profile_image') String? profileImage,
    Stats? stats,
    List<String>? skills,
    @JsonKey(name: 'charge_currency') ChargeCurrency? chargeCurrency,
    City? city,
    @JsonKey(name: 'address_line1') String? addressLine1,
    @JsonKey(name: 'address_line2') String? addressLine2,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class ChargeCurrency with _$ChargeCurrency {
  const factory ChargeCurrency({
    String? code,
    String? name,
    String? symbol,
  }) = _ChargeCurrency;

  factory ChargeCurrency.fromJson(Map<String, dynamic> json) => _$ChargeCurrencyFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: 'success_rate') double? successRate,
    @JsonKey(name: 'happy_clients') double? happyClients,
    @JsonKey(name: 'task_completed') double? taskCompleted,
    @JsonKey(name: 'user_reviews') double? userReviews,
    @JsonKey(name: 'task_assigned') double? taskAssigned,
    @JsonKey(name: 'task_in_progress') double? taskInProgress,
    @JsonKey(name: 'task_cancelled') double? taskCancelled,
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
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    @JsonKey(name: 'created_by') EdBy? createdBy,
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
    @JsonKey(name: 'discount_value') double? discountValue,
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
    @JsonKey(name: 'active_dates') String? activeDates,
    @JsonKey(name: 'guest_limit') double? guestLimit,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
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
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_verified') bool? isVerified,
    Category? category,
    List<Image>? images,
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
