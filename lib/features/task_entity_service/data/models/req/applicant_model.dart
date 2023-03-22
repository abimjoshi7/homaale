// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'applicant_model.freezed.dart';
part 'applicant_model.g.dart';

@freezed
class ApplicantModel with _$ApplicantModel {
  const factory ApplicantModel({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _ApplicantModel;

  factory ApplicantModel.fromJson(Map<String, dynamic> json) => _$ApplicantModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: 'created_at') String? createdAt,
    String? status,
    String? currency,
    @JsonKey(name: 'budget_from') double? budgetFrom,
    @JsonKey(name: 'budget_to') double? budgetTo,
    @JsonKey(name: 'budget_type') String? budgetType,
    @JsonKey(name: 'created_by') CreatedBy? createdBy,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    User? user,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? bio,
    String? designation,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    Stats? stats,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}

@freezed
class Stats with _$Stats {
  const factory Stats({
    @JsonKey(name: 'success_rate') double? successRate,
    @JsonKey(name: 'happy_clients') double? happyClients,
    @JsonKey(name: 'user_reviews') double? userReviews,
    @JsonKey(name: 'avg_rating') double? avgRating,
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
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
