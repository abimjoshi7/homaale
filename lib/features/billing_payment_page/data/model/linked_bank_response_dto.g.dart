// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'linked_bank_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LinkedBankResponseDto _$$_LinkedBankResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_LinkedBankResponseDto(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => LinkedBankDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LinkedBankResponseDtoToJson(
        _$_LinkedBankResponseDto instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_LinkedBankDto _$$_LinkedBankDtoFromJson(Map<String, dynamic> json) =>
    _$_LinkedBankDto(
      id: json['id'] as int?,
      bankName: json['bank_name'] as String?,
      branchName: json['branch_name'] as String?,
      isWallet: json['is_wallet'] as bool?,
      logo: json['logo'] as String?,
      bankAccountName: json['bank_account_name'] as String?,
      bankAccountNumber: json['bank_account_number'] as String?,
      isPrimary: json['is_primary'] as bool?,
      isVerified: json['is_verified'] as bool?,
    );

Map<String, dynamic> _$$_LinkedBankDtoToJson(_$_LinkedBankDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bank_name': instance.bankName,
      'branch_name': instance.branchName,
      'is_wallet': instance.isWallet,
      'logo': instance.logo,
      'bank_account_name': instance.bankAccountName,
      'bank_account_number': instance.bankAccountNumber,
      'is_primary': instance.isPrimary,
      'is_verified': instance.isVerified,
    };
