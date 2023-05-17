// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_req_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WithdrawReqResDto _$$_WithdrawReqResDtoFromJson(Map<String, dynamic> json) =>
    _$_WithdrawReqResDto(
      amount: json['amount'] as String?,
      bankAccount: json['bank_account'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_WithdrawReqResDtoToJson(
        _$_WithdrawReqResDto instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'bank_account': instance.bankAccount,
      'description': instance.description,
    };
