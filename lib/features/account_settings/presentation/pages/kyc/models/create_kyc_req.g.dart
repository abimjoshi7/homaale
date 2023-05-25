// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_kyc_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateKycReq _$$_CreateKycReqFromJson(Map<String, dynamic> json) =>
    _$_CreateKycReq(
      fullName: json['full_name'] as String?,
      logo: const MultipartFileConverter()
          .fromJson(json['logo'] as MultipartFile?),
      isCompany: json['is_company'] as bool?,
      organizationName: json['organization_name'] as String?,
      address: json['address'] as String?,
      company: json['company'] as int?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$$_CreateKycReqToJson(_$_CreateKycReq instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'logo': const MultipartFileConverter().toJson(instance.logo),
      'is_company': instance.isCompany,
      'organization_name': instance.organizationName,
      'address': instance.address,
      'company': instance.company,
      'country': instance.country,
    };
