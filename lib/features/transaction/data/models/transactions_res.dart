import 'package:dependencies/dependencies.dart';

import '../../../task_entity_service/data/models/task_entity_service.dart';

part 'transactions_res.freezed.dart';
part 'transactions_res.g.dart';

@freezed
class TransactionsRes with _$TransactionsRes {
  const factory TransactionsRes({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "result") List<Transactions>? result,
  }) = _TransactionsRes;

  factory TransactionsRes.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResFromJson(json);
}

@freezed
class Transactions with _$Transactions {
  const factory Transactions({
    String? id,
    @JsonKey(name: "payment_method") PaymentMethod? paymentMethod,
    Receiver? sender,
    Receiver? receiver,
    Currency? currency,
    @JsonKey(name: "created_at") DateTime? createdAt,
    String? status,
    String? amount,
    @JsonKey(name: "transaction_type") String? transactionType,
    String? order,
    @JsonKey(name: "created_by") String? createdBy,
  }) = _Transactions;

  factory Transactions.fromJson(Map<String, dynamic> json) =>
      _$TransactionsFromJson(json);
}

@freezed
class PaymentMethod with _$PaymentMethod {
  const factory PaymentMethod({
    int? id,
    String? name,
    String? slug,
    String? logo,
    String? type,
    String? thumbnail,
  }) = _PaymentMethod;

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);
}

@freezed
class Receiver with _$Receiver {
  const factory Receiver({
    String? username,
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "profile_image") String? profileImage,
  }) = _Receiver;

  factory Receiver.fromJson(Map<String, dynamic> json) =>
      _$ReceiverFromJson(json);
}
