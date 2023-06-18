// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'recommended_similar_dto.freezed.dart';
part 'recommended_similar_dto.g.dart';

@freezed
class RecommendedSimilarDto with _$RecommendedSimilarDto {
  const factory RecommendedSimilarDto({
    List<Recommend>? similar,
    List<Recommend>? recommend,
  }) = _RecommendedSimilarDto;

  factory RecommendedSimilarDto.fromJson(Map<String, dynamic> json) => _$RecommendedSimilarDtoFromJson(json);
}

@freezed
class Recommend with _$Recommend {
  const factory Recommend({
    String? id,
    String? slug,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    CreatedBy? owner,
    String? title,
    Currency? currency,
    City? city,
    @JsonKey(name: "is_online") bool? isOnline,
    Service? service,
    List<Image>? images,
    dynamic? rating,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "is_requested") bool? isRequested,
    String? location,
    @JsonKey(name: "is_range") bool? isRange,
    int? count,
    @JsonKey(name: "booked_count") int? bookedCount,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    List<dynamic>? videos,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
    @JsonKey(name: "budeget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
    @JsonKey(name: "payable_from") String? payableFrom,
    @JsonKey(name: "payable_to") String? payableTo,
    @JsonKey(name: "rating_count") dynamic? ratingCount,
  }) = _Recommend;

  factory Recommend.fromJson(Map<String, dynamic> json) => _$RecommendFromJson(json);
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
    List<dynamic>? images,
    @JsonKey(name: "required_documents") List<dynamic>? requiredDocuments,
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
