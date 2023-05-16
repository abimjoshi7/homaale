// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_payment_method_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavePaymentMethodDto _$$_SavePaymentMethodDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SavePaymentMethodDto(
      bankAccountName: json['bankAccountName'] as String?,
      bankAccountNumber: json['bankAccountNumber'] as String?,
      isPrimary: json['isPrimary'] as bool?,
      bankName: json['bankName'] as int?,
      branchName: json['branchName'] as int?,
    );

Map<String, dynamic> _$$_SavePaymentMethodDtoToJson(
        _$_SavePaymentMethodDto instance) =>
    <String, dynamic>{
      'bankAccountName': instance.bankAccountName,
      'bankAccountNumber': instance.bankAccountNumber,
      'isPrimary': instance.isPrimary,
      'bankName': instance.bankName,
      'branchName': instance.branchName,
    };
