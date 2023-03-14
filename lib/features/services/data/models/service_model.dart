// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'service_model.freezed.dart';
part 'service_model.g.dart';

@freezed
class ServiceModel with _$ServiceModel {
  const factory ServiceModel({
    String? id,
    Currency? currency,
    City? city,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
    Service? service,
    List<Image>? images,
    List<Image>? videos,
    List<Rating>? rating,
    int? count,
    List<Offer>? offers,
    List<Endorsement>? endorsements,
    @JsonKey(name: 'is_redeemable') bool? isRedeemable,
    Event? event,
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
    @JsonKey(name: 'recursion_type') String? recursionType,
    @JsonKey(name: 'views_count') int? viewsCount,
    String? location,
    @JsonKey(name: 'is_professional') bool? isProfessional,
    @JsonKey(name: 'is_online') bool? isOnline,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'discount_type') String? discountType,
    @JsonKey(name: 'discount_value') int? discountValue,
    @JsonKey(name: 'extra_data') List<String>? extraData,
    @JsonKey(name: 'no_of_reservaton') int? noOfReservation,
    String? slug,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'needs_approval') bool? needsApproval,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    String? merchant,
    int? avatar,
  }) = _ServiceModel;

  factory ServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ServiceModelFromJson(json);
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
    Badge? badge,
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
class Endorsement with _$Endorsement {
  const factory Endorsement({
    int? id,
    String? image,
    String? title,
  }) = _Endorsement;

  factory Endorsement.fromJson(Map<String, dynamic> json) => _$EndorsementFromJson(json);
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
class Event with _$Event {
  const factory Event({
    String? id,
    String? title,
    String? start,
    String? end,
    String? duration,
    @JsonKey(name: 'is_flexible') bool? isFlexible,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'active_dates') List<String>? activeDates,
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
class Rating with _$Rating {
  const factory Rating({
    double? rating,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
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
