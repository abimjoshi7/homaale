// import 'package:freezed_annotation/freezed_annotation.dart';
//
// part 'order_item_list.freezed.dart';
// part 'order_item_list.g.dart';
//
// @freezed
// class OrderItemList with _$OrderItemList {
//   const factory OrderItemList({
//     @JsonKey(name: 'total_pages') int? totalPages,
//     int? count,
//     int? current,
//     dynamic next,
//     dynamic previous,
//     @JsonKey(name: 'page_size') int? pageSize,
//     List<Result>? result,
//   }) = _OrderItemList;
//
//   factory OrderItemList.fromJson(Map<String, dynamic> json) =>
//       _$OrderItemListFromJson(json);
// }
//
// @freezed
// class Result with _$Result {
//   const factory Result({
//     String? id,
//     String? title,
//     double? charge,
//     @JsonKey(name: 'entity_service') EntityService? entityService,
//     Assignee? assigner,
//     Assignee? assignee,
//     Currency? currency,
//     List<dynamic>? images,
//     List<dynamic>? videos,
//     @JsonKey(name: 'start_date') String? startDate,
//     @JsonKey(name: 'end_date') String? endDate,
//     @JsonKey(name: 'start_time') String? startTime,
//     @JsonKey(name: 'end_time') String? endTime,
//   }) = _Result;
//
//   factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
// }
//
// @freezed
// class Assignee with _$Assignee {
//   const factory Assignee({
//     String? id,
//     String? username,
//     String? email,
//     String? phone,
//     @JsonKey(name: 'full_name') String? fullName,
//     @JsonKey(name: 'first_name') String? firstName,
//     @JsonKey(name: 'middle_name') String? middleName,
//     @JsonKey(name: 'last_name') String? lastName,
//     @JsonKey(name: 'profile_image') String? profileImage,
//     String? bio,
//     @JsonKey(name: 'created_at') String? createdAt,
//     String? designation,
//     @JsonKey(name: 'user_type') String? userType,
//     @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
//     @JsonKey(name: 'is_followed') bool? isFollowed,
//     @JsonKey(name: 'is_following') bool? isFollowing,
//     Badge? badge,
//   }) = _Assignee;
//
//   factory Assignee.fromJson(Map<String, dynamic> json) =>
//       _$AssigneeFromJson(json);
// }
//
// @freezed
// class Badge with _$Badge {
//   const factory Badge({
//     int? id,
//     String? image,
//     String? title,
//   }) = _Badge;
//
//   factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
// }
//
//
// @freezed
// class Currency with _$Currency {
//   const factory Currency({
//     String? code,
//     String? name,
//     String? symbol,
//   }) = _Currency;
//
//   factory Currency.fromJson(Map<String, dynamic> json) =>
//       _$CurrencyFromJson(json);
// }
//
//
// @freezed
// class EntityService with _$EntityService {
//   const factory EntityService({
//     String? id,
//     String? slug,
//     @JsonKey(name: 'created_at') String? createdAt,
//     @JsonKey(name: 'created_by') String? createdBy,
//     String? title,
//     Currency? currency,
//     City? city,
//     @JsonKey(name: 'is_online') bool? isOnline,
//     Service? service,
//     List<Image>? images,
//     List<Rating>? rating,
//     @JsonKey(name: 'budget_type') String? budgetType,
//     @JsonKey(name: 'is_requested') bool? isRequested,
//     @JsonKey(name: 'budget_form') int? budgetFrom,
//     @JsonKey(name: 'budget_to') int? budgetTo,
//     String? location,
//     int? count,
//     @JsonKey(name: 'is_endorsed') bool? isEndorsed,
//     @JsonKey(name: 'end_date') DateTime? endDate,
//     List<dynamic>? videos,
//   }) = _EntityService;
//
//   factory EntityService.fromJson(Map<String, dynamic> json) =>
//       _$EntityServiceFromJson(json);
// }
//
// @freezed
// class City with _$City {
//   const factory City({
//     int? id,
//     String? name,
//     Country? country,
//   }) = _City;
//
//   factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
// }
//
// @freezed
// class Country with _$Country {
//   const factory Country({
//     String? name,
//     String? code,
//   }) = _Country;
//
//   factory Country.fromJson(Map<String, dynamic> json) =>
//       _$CountryFromJson(json);
// }
//
// @freezed
// class Image with _$Image {
//   const factory Image({
//     int? id,
//     String? name,
//     String? size,
//     @JsonKey(name: 'media_type') String? mediaType,
//     String? media,
//   }) = _Image;
//
//   factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
// }
//
// @freezed
// class Rating with _$Rating {
//   const factory Rating({
//     int? rating,
//     @JsonKey(name: 'rating_count') int? ratingCount,
//   }) = _Rating;
//
//   factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
// }
//
// @freezed
// class Service with _$Service {
//   const factory Service({
//     String? id,
//     String? title,
//     @JsonKey(name: 'is_active') bool? isActive,
//     @JsonKey(name: 'is_verified') bool? isVerified,
//     Category? category,
//     List<dynamic>? images,
//   }) = _Service;
//
//   factory Service.fromJson(Map<String, dynamic> json) =>
//       _$ServiceFromJson(json);
// }
//
// @freezed
// class Category with _$Category {
//   const factory Category({
//     int? id,
//     String? name,
//     String? level,
//     String? slug,
//   }) = _Category;
//
//   factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);
// }

// To parse this JSON data, do
//
//     final orderItemList = orderItemListFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_item_list.freezed.dart';
part 'order_item_list.g.dart';

@freezed
class OrderItemList with _$OrderItemList {
  const factory OrderItemList({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    dynamic next,
    dynamic previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _OrderItemList;

  factory OrderItemList.fromJson(Map<String, dynamic> json) => _$OrderItemListFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? id,
    String? title,
    String? charge,
    @JsonKey(name: 'entity_service') EntityService? entityService,
    Assignee? assigner,
    Assignee? assignee,
    Currency? currency,
    List<dynamic>? images,
    List<dynamic>? videos,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'end_time') String? endTime,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Assignee with _$Assignee {
  const factory Assignee({
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
  }) = _Assignee;

  factory Assignee.fromJson(Map<String, dynamic> json) => _$AssigneeFromJson(json);
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
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    String? slug,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'created_by') Assignee? createdBy,
    String? title,
    Currency? currency,
    City? city,
    @JsonKey(name: 'is_online') bool? isOnline,
    Service? service,
    List<Image>? images,
    List<Rating>? rating,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'is_requested') bool? isRequested,
    @JsonKey(name: 'budget_from') String? budgetFrom,
    @JsonKey(name: 'budget_to') String? budgetTo,
    String? location,
    int? count,
    @JsonKey(name: 'is_endorsed') bool? isEndorsed,
    @JsonKey(name: 'end_date') String? endDate,
    List<dynamic>? videos,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
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
class Image with _$Image {
  const factory Image({
    int? id,
    String? name,
    String? size,
    String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

@freezed
class Rating with _$Rating {
  const factory Rating({
    double? rating,
    int? ratingCount,
  }) = _Rating;

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
}

@freezed
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    bool? isActive,
    bool? isVerified,
    Category? category,
    List<dynamic>? images,
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
