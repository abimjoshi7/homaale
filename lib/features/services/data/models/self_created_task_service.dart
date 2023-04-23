// To parse this JSON data, do
//
//     final selfCreatedTaskService = selfCreatedTaskServiceFromJson(jsonString);

import 'package:dependencies/dependencies.dart';

part 'self_created_task_service.freezed.dart';
part 'self_created_task_service.g.dart';

@freezed
class SelfCreatedTaskService with _$SelfCreatedTaskService {
  const factory SelfCreatedTaskService({
    int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    int? pageSize,
    List<Result>? result,
  }) = _SelfCreatedTaskService;

  factory SelfCreatedTaskService.fromJson(Map<String, dynamic> json) =>
      _$SelfCreatedTaskServiceFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? id,
    CreatedBy? createdBy,
    Currency? currency,
    City? city,
    List<dynamic>? images,
    List<dynamic>? videos,
    Service? service,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    List<String>? highlights,
    String? budgetType,
    String? budgetFrom,
    String? budgetTo,
    DateTime? startDate,
    DateTime? endDate,
    String? startTime,
    String? endTime,
    bool? shareLocation,
    bool? isNegotiable,
    int? revisions,
    String? recursionType,
    int? viewsCount,
    String? location,
    bool? isProfessional,
    bool? isOnline,
    bool? isRequested,
    String? discountType,
    String? discountValue,
    List<String>? extraData,
    int? noOfReservation,
    String? slug,
    bool? isActive,
    bool? needsApproval,
    bool? isEndorsed,
    dynamic merchant,
    dynamic event,
    dynamic avatar,
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
    String? fullName,
    String? firstName,
    String? middleName,
    String? lastName,
    String? profileImage,
    String? bio,
    DateTime? createdAt,
    String? designation,
    String? userType,
    String? isProfileVerified,
    bool? isFollowed,
    bool? isFollowing,
    Avatar? avatar,
    Badge? badge,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$CreatedByFromJson(json);
}

@freezed
class Avatar with _$Avatar {
  const factory Avatar({
    dynamic image,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);
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
class Service with _$Service {
  const factory Service({
    String? id,
    String? title,
    bool? isActive,
    bool? isVerified,
    Category? category,
    List<dynamic>? images,
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
