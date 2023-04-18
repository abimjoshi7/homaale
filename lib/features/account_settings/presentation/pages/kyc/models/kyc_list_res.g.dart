// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_list_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_KycListRes _$$_KycListResFromJson(Map<String, dynamic> json) =>
    _$_KycListRes(
      id: json['id'] as int?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      documentType: json['document_type'] as int?,
      documentId: json['document_id'] as String?,
      file: json['file'] as String?,
      issuerOrganization: json['issuer_organization'] as String?,
      issuedDate: json['issued_date'] == null
          ? null
          : DateTime.parse(json['issued_date'] as String),
      validThrough: json['valid_through'] == null
          ? null
          : DateTime.parse(json['valid_through'] as String),
      isVerified: json['is_verified'] as bool?,
      isCompany: json['is_company'] as bool?,
      comment: json['comment'] as String?,
      kyc: json['kyc'] as int?,
    );

Map<String, dynamic> _$$_KycListResToJson(_$_KycListRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'document_type': instance.documentType,
      'document_id': instance.documentId,
      'file': instance.file,
      'issuer_organization': instance.issuerOrganization,
      'issued_date': instance.issuedDate?.toIso8601String(),
      'valid_through': instance.validThrough?.toIso8601String(),
      'is_verified': instance.isVerified,
      'is_company': instance.isCompany,
      'comment': instance.comment,
      'kyc': instance.kyc,
    };
