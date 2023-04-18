// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_doc_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KycDocType _$$_KycDocTypeFromJson(Map<String, dynamic> json) =>
    _$_KycDocType(
      id: json['id'] as int?,
      name: json['name'] as String?,
      requiredForUser: json['required_for_user'] as bool?,
      requiredForMerchant: json['required_for_merchant'] as bool?,
    );

Map<String, dynamic> _$$_KycDocTypeToJson(_$_KycDocType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'required_for_user': instance.requiredForUser,
      'required_for_merchant': instance.requiredForMerchant,
    };
