// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'task_entity_service.freezed.dart';
part 'task_entity_service.g.dart';

@freezed
class TaskEntityService with _$TaskEntityService {
  const factory TaskEntityService({
    String? id,
    Currency? currency,
    City? city,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    Service? service,
    List<Image>? images,
    List<Image>? videos,
    List<Rating>? rating,
    num? count,
    List<Offer>? offers,
    List<Badge>? endorsements,
    @JsonKey(name: "is_redeemable") bool? isRedeemable,
    Event? event,
    @JsonKey(name: "rating_stats") RatingStats? ratingStats,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "update_at") DateTime? updatedAt,
    @JsonKey(name: "deleted_at") DateTime? deletedAt,
    String? title,
    String? description,
    List<String>? highlights,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "budget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") dynamic startTime,
    @JsonKey(name: "end_time") dynamic endTime,
    @JsonKey(name: "share_location") bool? shareLocation,
    @JsonKey(name: "is_negotiable") bool? isNegotiable,
    num? revisions,
    @JsonKey(name: "recursion_type") dynamic recursionType,
    @JsonKey(name: "views_count") num? viewsCount,
    String? location,
    @JsonKey(name: "is_booked") bool? isBooked,
    @JsonKey(name: "is_professional") bool? isProfessional,
    @JsonKey(name: "is_online") bool? isOnline,
    @JsonKey(name: "is_requested") bool? isRequested,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") String? discountValue,
    @JsonKey(name: "extra_data") List<dynamic>? extraData,
    @JsonKey(name: "no_of_reservation") num? noOfReservation,
    String? slug,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "needs_approval") bool? needsApproval,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    @JsonKey(name: "payable_from") String? payableFrom,
    @JsonKey(name: "payable_to") String? payableTo,
    @JsonKey(name: "updated_by") String? updatedBy,
    String? owner,
    dynamic merchant,
    dynamic avatar,
  }) = _TaskEntityService;

  factory TaskEntityService.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityServiceFromJson(json);
}

@freezed
class City with _$City {
  const factory City({
    num? id,
    String? name,
    num? latitude,
    num? longitude,
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

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
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
    @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
    @JsonKey(name: "is_followed") bool? isFollowed,
    @JsonKey(name: "is_following") bool? isFollowing,
    Badge? badge,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
class Badge with _$Badge {
  const factory Badge({
    num? id,
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

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
}

@freezed
class Event with _$Event {
  const factory Event({
    String? id,
    String? title,
    DateTime? start,
    DateTime? end,
    String? duration,
    @JsonKey(name: "is_flexible") bool? isFlexible,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "active_dates") List<DateTime>? activeDates,
  }) = _Event;

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    num? id,
    String? name,
    String? size,
    @JsonKey(name: "media_type") String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Offer with _$Offer {
  const factory Offer({
    num? id,
    String? title,
    String? description,
    String? image,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "offer_type") String? offerType,
    String? code,
    @JsonKey(name: "offer_rule") num? offerRule,
    String? free,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
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
class RatingStats with _$RatingStats {
  const factory RatingStats({
    @JsonKey(name: "average_rating") double? averageRating,
    double? five,
    double? four,
    double? three,
    double? two,
    double? one,
    @JsonKey(name: "total_counts") int? totalCounts,
  }) = _RatingStats;

  factory RatingStats.fromJson(Map<String, dynamic> json) =>
      _$RatingStatsFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "id_verified") bool? isVerified,
    Category? category,
    List<dynamic>? images,
    @JsonKey(name: "required_documents") List<dynamic>? required_documents,
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    num? id,
    String? name,
    num? level,
    String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
