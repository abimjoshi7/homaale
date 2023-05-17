// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_names_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BankNamesResponseDto _$$_BankNamesResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BankNamesResponseDto(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isWallet: json['is_wallet'] as bool?,
    );

Map<String, dynamic> _$$_BankNamesResponseDtoToJson(
        _$_BankNamesResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_wallet': instance.isWallet,
    };
