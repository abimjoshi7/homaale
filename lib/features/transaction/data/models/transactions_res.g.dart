// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionsRes _$$_TransactionsResFromJson(Map<String, dynamic> json) =>
    _$_TransactionsRes(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Transactions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TransactionsResToJson(_$_TransactionsRes instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Transactions _$$_TransactionsFromJson(Map<String, dynamic> json) =>
    _$_Transactions(
      id: json['id'] as String?,
      paymentMethod: json['payment_method'] == null
          ? null
          : PaymentMethod.fromJson(
              json['payment_method'] as Map<String, dynamic>),
      sender: json['sender'] == null
          ? null
          : Receiver.fromJson(json['sender'] as Map<String, dynamic>),
      receiver: json['receiver'] == null
          ? null
          : Receiver.fromJson(json['receiver'] as Map<String, dynamic>),
      currency: json['currency'] == null
          ? null
          : Currency.fromJson(json['currency'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      status: json['status'] as String?,
      amount: json['amount'] as String?,
      transactionType: json['transaction_type'] as String?,
      order: json['order'] as String?,
      createdBy: json['created_by'] as String?,
    );

Map<String, dynamic> _$$_TransactionsToJson(_$_Transactions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'payment_method': instance.paymentMethod,
      'sender': instance.sender,
      'receiver': instance.receiver,
      'currency': instance.currency,
      'created_at': instance.createdAt?.toIso8601String(),
      'status': instance.status,
      'amount': instance.amount,
      'transaction_type': instance.transactionType,
      'order': instance.order,
      'created_by': instance.createdBy,
    };

_$_PaymentMethod _$$_PaymentMethodFromJson(Map<String, dynamic> json) =>
    _$_PaymentMethod(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      logo: json['logo'] as String?,
      type: json['type'] as String?,
      thumbnail: json['thumbnail'] as String?,
    );

Map<String, dynamic> _$$_PaymentMethodToJson(_$_PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.logo,
      'type': instance.type,
      'thumbnail': instance.thumbnail,
    };

_$_Receiver _$$_ReceiverFromJson(Map<String, dynamic> json) => _$_Receiver(
      username: json['username'] as String?,
      fullName: json['full_name'] as String?,
      profileImage: json['profile_image'] as String?,
    );

Map<String, dynamic> _$$_ReceiverToJson(_$_Receiver instance) =>
    <String, dynamic>{
      'username': instance.username,
      'full_name': instance.fullName,
      'profile_image': instance.profileImage,
    };
