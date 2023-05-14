// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_history_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WalletHistoryRes _$$_WalletHistoryResFromJson(Map<String, dynamic> json) =>
    _$_WalletHistoryRes(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_WalletHistoryResToJson(_$_WalletHistoryRes instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      sender: json['sender'] as String?,
      receiver: json['receiver'] as String?,
      taskTitle: (json['task_title'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      amount: json['amount'] as String?,
      wallet: json['wallet'] as int?,
      transaction: json['transaction'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'task_title': instance.taskTitle,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'amount': instance.amount,
      'wallet': instance.wallet,
      'transaction': instance.transaction,
    };
