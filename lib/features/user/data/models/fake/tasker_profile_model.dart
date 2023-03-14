// // To parse this JSON data, do
// //
// //     final taskerProfileModel = taskerProfileModelFromJson(jsonString);

// import 'package:dependencies/dependencies.dart';

// part 'tasker_profile_model.freezed.dart';
// part 'tasker_profile_model.g.dart';

// @freezed
// class FakeTaskerProfileModel with _$TaskerProfileModel {
//   const factory FakeTaskerProfileModel({
//     @JsonKey(name: "total_pages") int? totalPages,
//     int? count,
//     int? current,
//     String? next,
//     String? previous,
//     @JsonKey(name: "page_size") int? pageSize,
//     List<FakeTaskerProfile>? taskerProfile,
//   }) = _TaskerProfileModel;

//   factory FakeTaskerProfileModel.fromJson(Map<String, dynamic> json) =>
//       _$TaskerProfileModelFromJson(json);
// }

// @freezed
// class FakeTaskerProfile with _$TaskerProfile {
//   const factory FakeTaskerProfile({
//     String? id,
//     @JsonKey(name: "created_by") CreatedBy? createdBy,
//     Currency? currency,
//     City? city,
//     List<dynamic>? images,
//     List<dynamic>? videos,
//     Service? service,
//     @JsonKey(name: "created_at") DateTime? createdAt,
//     @JsonKey(name: "updated_at") DateTime? updatedAt,
//     String? title,
//     String? description,
//     List<String>? highlights,
//     @JsonKey(name: "budget_type") String? budgetType,
//     @JsonKey(name: "budget_from") int? budgetFrom,
//     @JsonKey(name: "budget_to") int? budgetTo,
//     @JsonKey(name: "start_date") DateTime? startDate,
//     @JsonKey(name: "end_date") DateTime? endDate,
//     @JsonKey(name: "start_time") String? startTime,
//     @JsonKey(name: "end_time") String? endTime,
//     @JsonKey(name: "share_location") bool? shareLocation,
//     @JsonKey(name: "is_negotiable") bool? isNegotiable,
//     int? revisions,
//     @JsonKey(name: "recursion_type") String? recursionType,
//     @JsonKey(name: "view_count") int? viewsCount,
//     String? location,
//     @JsonKey(name: "is_professional") bool? isProfessional,
//     @JsonKey(name: "is_online") bool? isOnline,
//     @JsonKey(name: "is_requested") bool? isRequested,
//     @JsonKey(name: "discount_type") String? discountType,
//     @JsonKey(name: "discount_value") num? discountValue,
//     @JsonKey(name: "extra_data") List<String>? extraData,
//     @JsonKey(name: "no_of_reservation") int? noOfReservation,
//     String? slug,
//     @JsonKey(name: "is_active") bool? isActive,
//     @JsonKey(name: "needs_approval") bool? needsApproval,
//     @JsonKey(name: "is_endorsed") bool? isEndorsed,
//     dynamic merchant,
//     dynamic event,
//     dynamic avatar,
//   }) = _TaskerProfile;

//   factory FakeTaskerProfile.fromJson(Map<String, dynamic> json) =>
//       _$TaskerProfileFromJson(json);
// }

// @freezed
// class City with _$City {
//   const factory City({
//     int? id,
//     String? name,
//     double? latitude,
//     double? longitude,
//     Country? country,
//   }) = _City;

//   factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);
// }

// @freezed
// class Country with _$Country {
//   const factory Country({
//     String? name,
//     String? code,
//   }) = _Country;

//   factory Country.fromJson(Map<String, dynamic> json) =>
//       _$CountryFromJson(json);
// }

// @freezed
// class CreatedBy with _$CreatedBy {
//   const factory CreatedBy({
//     String? id,
//     String? username,
//     String? email,
//     String? phone,
//     @JsonKey(name: "full_name") String? fullName,
//     @JsonKey(name: "first_name") String? firstName,
//     @JsonKey(name: "middle_name") String? middleName,
//     @JsonKey(name: "last_name") String? lastName,
//     @JsonKey(name: "profile_image") String? profileImage,
//     String? bio,
//     @JsonKey(name: "created_at") DateTime? createdAt,
//     String? designation,
//     @JsonKey(name: "user_type") String? userType,
//     @JsonKey(name: "is_profile_verified") String? isProfileVerified,
//     @JsonKey(name: "is_followed") bool? isFollowed,
//     @JsonKey(name: "is_following") bool? isFollowing,
//     dynamic avatar,
//     Badge? badge,
//   }) = _CreatedBy;

//   factory CreatedBy.fromJson(Map<String, dynamic> json) =>
//       _$CreatedByFromJson(json);
// }

// @freezed
// class Badge with _$Badge {
//   const factory Badge({
//     int? id,
//     String? image,
//     String? title,
//   }) = _Badge;

//   factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
// }

// @freezed
// class Currency with _$Currency {
//   const factory Currency({
//     String? code,
//     String? name,
//     String? symbol,
//   }) = _Currency;

//   factory Currency.fromJson(Map<String, dynamic> json) =>
//       _$CurrencyFromJson(json);
// }

// @freezed
// class Service with _$Service {
//   const factory Service({
//     String? id,
//     String? title,
//     @JsonKey(name: "is_active") bool? isActive,
//     @JsonKey(name: "is_verified") bool? isVerified,
//     Category? category,
//     List<dynamic>? images,
//   }) = _Service;

//   factory Service.fromJson(Map<String, dynamic> json) =>
//       _$ServiceFromJson(json);
// }

// @freezed
// class Category with _$Category {
//   const factory Category({
//     int? id,
//     String? name,
//     int? level,
//     String? slug,
//   }) = _Category;

//   factory Category.fromJson(Map<String, dynamic> json) =>
//       _$CategoryFromJson(json);
// }
