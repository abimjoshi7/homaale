
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_account_suspension.freezed.dart';
part 'user_account_suspension.g.dart';


@freezed
class UserAccountSuspension with _$UserAccountSuspension {
  const factory UserAccountSuspension({
    String? id,
    String? email,
    String? phone,
  @JsonKey(name:'is_active')  bool? isActive,
    @JsonKey(name:'is_verified') bool? isVerified,
    List<Group>? groups,
    List<dynamic>? permissions,
    @JsonKey(name:'is_kyc_verified') bool? isKycVerified,
    @JsonKey(name:'social_only') bool? socialOnly,
    @JsonKey(name:'created_at') DateTime? createdAt,
    @JsonKey(name:'is_suspended') bool? isSuspended,
    @JsonKey(name:'has_profile')   bool? hasProfile,
  }) = _UserAccountSuspension;

  factory UserAccountSuspension.fromJson(Map<String, dynamic> json) => _$UserAccountSuspensionFromJson(json);
}

@freezed
class Group with _$Group {
  const factory Group({
    int? id,
    List<Permission>? permissions,
    String? name,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

@freezed
class Permission with _$Permission {
  const factory Permission({
    int? id,
    String? name,
    String? codename,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);
}
