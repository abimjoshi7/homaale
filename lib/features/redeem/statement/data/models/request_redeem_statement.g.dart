// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_redeem_statement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RequestRedeemStatement _$$_RequestRedeemStatementFromJson(
        Map<String, dynamic> json) =>
    _$_RequestRedeemStatement(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'],
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RequestRedeemStatementToJson(
        _$_RequestRedeemStatement instance) =>
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
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      objectRepr: json['object_repr'] as String?,
      points: json['points'] as int?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'object_repr': instance.objectRepr,
      'points': instance.points,
      'status': instance.status,
    };
