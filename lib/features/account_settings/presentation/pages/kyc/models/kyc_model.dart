// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

@freezed
class KycModel with _$KycModel {
  const factory KycModel({
    int? id,
    User? user,
    Country? country,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "full_name") String? fullName,
    String? logo,
    @JsonKey(name: "is_company") bool? isCompany,
    @JsonKey(name: "organization_name") String? organizationName,
    String? address,
    @JsonKey(name: "is_kyc_verified") bool? isKycVerified,
    @JsonKey(name: "is_address_verified") bool? isAddressVerified,
    @JsonKey(name: "is_company_kyc_verified") bool? isCompanyKycVerified,
    @JsonKey(name: "is_company_address_verified")
        bool? isCompanyAddressVerified,
    String? comment,
    List<String>? extraData,
  }) = _KycModel;

  factory KycModel.fromJson(Map<String, dynamic> json) =>
      _$KycModelFromJson(json);
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
class User with _$User {
  const factory User({
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
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
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
