// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_suspension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAccountSuspension _$$_UserAccountSuspensionFromJson(
        Map<String, dynamic> json) =>
    _$_UserAccountSuspension(
      id: json['id'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      isActive: json['is_active'] as bool?,
      isVerified: json['is_verified'] as bool?,
      groups: (json['groups'] as List<dynamic>?)
          ?.map((e) => Group.fromJson(e as Map<String, dynamic>))
          .toList(),
      permissions: json['permissions'] as List<dynamic>?,
      isKycVerified: json['is_kyc_verified'] as bool?,
      socialOnly: json['social_only'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      isSuspended: json['is_suspended'] as bool?,
      hasProfile: json['has_profile'] as bool?,
    );

Map<String, dynamic> _$$_UserAccountSuspensionToJson(
        _$_UserAccountSuspension instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone': instance.phone,
      'is_active': instance.isActive,
      'is_verified': instance.isVerified,
      'groups': instance.groups,
      'permissions': instance.permissions,
      'is_kyc_verified': instance.isKycVerified,
      'social_only': instance.socialOnly,
      'created_at': instance.createdAt?.toIso8601String(),
      'is_suspended': instance.isSuspended,
      'has_profile': instance.hasProfile,
    };

_$_Group _$$_GroupFromJson(Map<String, dynamic> json) => _$_Group(
      id: json['id'] as int?,
      permissions: (json['permissions'] as List<dynamic>?)
          ?.map((e) => Permission.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$$_GroupToJson(_$_Group instance) => <String, dynamic>{
      'id': instance.id,
      'permissions': instance.permissions,
      'name': instance.name,
    };

_$_Permission _$$_PermissionFromJson(Map<String, dynamic> json) =>
    _$_Permission(
      id: json['id'] as int?,
      name: json['name'] as String?,
      codename: json['codename'] as String?,
    );

Map<String, dynamic> _$$_PermissionToJson(_$_Permission instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'codename': instance.codename,
    };
