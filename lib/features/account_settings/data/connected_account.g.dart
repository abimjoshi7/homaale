// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connected_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectedAccount _$$_ConnectedAccountFromJson(Map<String, dynamic> json) =>
    _$_ConnectedAccount(
      id: json['id'] as int?,
      provider: json['provider'] as String?,
      uid: json['uid'] as String?,
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      modified: json['modified'] == null
          ? null
          : DateTime.parse(json['modified'] as String),
      user: json['user'] as String?,
    );

Map<String, dynamic> _$$_ConnectedAccountToJson(_$_ConnectedAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provider': instance.provider,
      'uid': instance.uid,
      'extra_data': instance.extraData,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'user': instance.user,
    };

_$_ExtraData _$$_ExtraDataFromJson(Map<String, dynamic> json) => _$_ExtraData(
      hd: json['hd'] as String?,
      aud: json['aud'] as String?,
      azp: json['azp'] as String?,
      exp: json['exp'] as int?,
      iat: json['iat'] as int?,
      iss: json['iss'] as String?,
      sub: json['sub'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      locale: json['locale'] as String?,
      picture: json['picture'] as String?,
      givenName: json['given_name'] as String?,
      familyName: json['family_name'] as String?,
      emailVerified: json['email_verifed'] as bool?,
    );

Map<String, dynamic> _$$_ExtraDataToJson(_$_ExtraData instance) =>
    <String, dynamic>{
      'hd': instance.hd,
      'aud': instance.aud,
      'azp': instance.azp,
      'exp': instance.exp,
      'iat': instance.iat,
      'iss': instance.iss,
      'sub': instance.sub,
      'name': instance.name,
      'email': instance.email,
      'locale': instance.locale,
      'picture': instance.picture,
      'given_name': instance.givenName,
      'family_name': instance.familyName,
      'email_verifed': instance.emailVerified,
    };
