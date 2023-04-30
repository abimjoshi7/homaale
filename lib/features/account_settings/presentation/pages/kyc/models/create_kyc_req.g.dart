// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_kyc_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateKycReq _$$_CreateKycReqFromJson(Map<String, dynamic> json) =>
    _$_CreateKycReq(
      fullName: json['full_name'] as String?,
      logo: json['logo'],
      isCompany: json['is_company'] as bool?,
      organizationName: json['organization_name'] as String?,
      address: json['address'] as String?,
      extraData: json['extra_data'] == null
          ? null
          : ExtraData.fromJson(json['extra_data'] as Map<String, dynamic>),
      company: json['company'] as int?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_CreateKycReqToJson(_$_CreateKycReq instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'logo': instance.logo,
      'is_company': instance.isCompany,
      'organization_name': instance.organizationName,
      'address': instance.address,
      'extra_data': instance.extraData,
      'company': instance.company,
      'country': instance.country,
    };

_$_ExtraData _$$_ExtraDataFromJson(Map<String, dynamic> json) => _$_ExtraData(
      additionalProp1: json['additionalProp1'] as String?,
      additionalProp2: json['additionalProp2'] as String?,
      additionalProp3: json['additionalProp3'] as String?,
    );

Map<String, dynamic> _$$_ExtraDataToJson(_$_ExtraData instance) =>
    <String, dynamic>{
      'additionalProp1': instance.additionalProp1,
      'additionalProp2': instance.additionalProp2,
      'additionalProp3': instance.additionalProp3,
    };
