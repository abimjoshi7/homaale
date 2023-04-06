// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'single_task_entity_service.freezed.dart';
part 'single_task_entity_service.g.dart';

@freezed
class SingleTaskEntityService with _$SingleTaskEntityService {
  const factory SingleTaskEntityService({
    String? id,
    Currency? currency,
    City? city,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
    Service? service,
    List<Image>? images,
    List<Image>? videos,
    dynamic rating,
    int? count,
    List<Offer>? offers,
    List<dynamic>? endorsements,
    @JsonKey(name: 'is_redeemable') bool? isRedeemable,
    dynamic event,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    String? title,
    String? description,
    List<String>? highlights,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'budget_from') double? budgetFrom,
    @JsonKey(name: 'budget_to') double? budgetTo,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
    @JsonKey(name: 'share_location') bool? shareLocation,
    @JsonKey(name: 'is_negotiable') bool? isNegotiable,
    int? revisions,
    @JsonKey(name: 'recursion_type') dynamic recursionType,
    @JsonKey(name: 'views_count') int? viewsCount,
    String? location,
    @JsonKey(name: 'is_professional') bool? isProfessional,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'discount_type') dynamic discountType,
    @JsonKey(name: 'discount_value') dynamic discountValue,
    @JsonKey(name: 'extra_data') List<dynamic>? extraData,
    @JsonKey(name: 'no_of_reservation') int? noOfReservation,
    String? slug,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'needs_approval') bool? needsApproval,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    dynamic merchant,
    dynamic avatar,
  }) = _SingleTaskEntityService;

  factory SingleTaskEntityService.fromJson(Map<String, dynamic> json) =>
      _$SingleTaskEntityServiceFromJson(json);
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
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? bio,
    @JsonKey(name: 'created_at') String? createdAt,
    String? designation,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
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

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);
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
class Offer with _$Offer {
  const factory Offer({
    int? id,
    String? title,
    String? description,
    String? image,
    @JsonKey(name: 'offer_type') String? offerType,
    String? code,
    @JsonKey(name: 'offer_rule') int? offerRule,
    String? free,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
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
  }) = _Service;

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    int? level,
    String? slug,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
