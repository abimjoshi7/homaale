// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TransactionsRes _$TransactionsResFromJson(Map<String, dynamic> json) {
  return _TransactionsRes.fromJson(json);
}

/// @nodoc
mixin _$TransactionsRes {
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "result")
  List<Transactions>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsResCopyWith<TransactionsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsResCopyWith<$Res> {
  factory $TransactionsResCopyWith(
          TransactionsRes value, $Res Function(TransactionsRes) then) =
      _$TransactionsResCopyWithImpl<$Res, TransactionsRes>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Transactions>? result});
}

/// @nodoc
class _$TransactionsResCopyWithImpl<$Res, $Val extends TransactionsRes>
    implements $TransactionsResCopyWith<$Res> {
  _$TransactionsResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Transactions>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionsResCopyWith<$Res>
    implements $TransactionsResCopyWith<$Res> {
  factory _$$_TransactionsResCopyWith(
          _$_TransactionsRes value, $Res Function(_$_TransactionsRes) then) =
      __$$_TransactionsResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Transactions>? result});
}

/// @nodoc
class __$$_TransactionsResCopyWithImpl<$Res>
    extends _$TransactionsResCopyWithImpl<$Res, _$_TransactionsRes>
    implements _$$_TransactionsResCopyWith<$Res> {
  __$$_TransactionsResCopyWithImpl(
      _$_TransactionsRes _value, $Res Function(_$_TransactionsRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_TransactionsRes(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Transactions>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TransactionsRes implements _TransactionsRes {
  const _$_TransactionsRes(
      {@JsonKey(name: "total_pages") this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: "page_size") this.pageSize,
      @JsonKey(name: "result") final List<Transactions>? result})
      : _result = result;

  factory _$_TransactionsRes.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionsResFromJson(json);

  @override
  @JsonKey(name: "total_pages")
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey(name: "page_size")
  final int? pageSize;
  final List<Transactions>? _result;
  @override
  @JsonKey(name: "result")
  List<Transactions>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionsRes(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsRes &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPages, count, current, next,
      previous, pageSize, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionsResCopyWith<_$_TransactionsRes> get copyWith =>
      __$$_TransactionsResCopyWithImpl<_$_TransactionsRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionsResToJson(
      this,
    );
  }
}

abstract class _TransactionsRes implements TransactionsRes {
  const factory _TransactionsRes(
          {@JsonKey(name: "total_pages") final int? totalPages,
          final int? count,
          final int? current,
          final String? next,
          final String? previous,
          @JsonKey(name: "page_size") final int? pageSize,
          @JsonKey(name: "result") final List<Transactions>? result}) =
      _$_TransactionsRes;

  factory _TransactionsRes.fromJson(Map<String, dynamic> json) =
      _$_TransactionsRes.fromJson;

  @override
  @JsonKey(name: "total_pages")
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  @JsonKey(name: "result")
  List<Transactions>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsResCopyWith<_$_TransactionsRes> get copyWith =>
      throw _privateConstructorUsedError;
}

Transactions _$TransactionsFromJson(Map<String, dynamic> json) {
  return _Transactions.fromJson(json);
}

/// @nodoc
mixin _$Transactions {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "payment_method")
  PaymentMethod? get paymentMethod => throw _privateConstructorUsedError;
  Receiver? get sender => throw _privateConstructorUsedError;
  Receiver? get receiver => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: "transaction_type")
  String? get transactionType => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  String? get createdBy => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionsCopyWith<Transactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionsCopyWith<$Res> {
  factory $TransactionsCopyWith(
          Transactions value, $Res Function(Transactions) then) =
      _$TransactionsCopyWithImpl<$Res, Transactions>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "payment_method") PaymentMethod? paymentMethod,
      Receiver? sender,
      Receiver? receiver,
      Currency? currency,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? status,
      String? amount,
      @JsonKey(name: "transaction_type") String? transactionType,
      String? order,
      @JsonKey(name: "created_by") String? createdBy});

  $PaymentMethodCopyWith<$Res>? get paymentMethod;
  $ReceiverCopyWith<$Res>? get sender;
  $ReceiverCopyWith<$Res>? get receiver;
  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class _$TransactionsCopyWithImpl<$Res, $Val extends Transactions>
    implements $TransactionsCopyWith<$Res> {
  _$TransactionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? paymentMethod = freezed,
    Object? sender = freezed,
    Object? receiver = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? order = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodCopyWith<$Res>? get paymentMethod {
    if (_value.paymentMethod == null) {
      return null;
    }

    return $PaymentMethodCopyWith<$Res>(_value.paymentMethod!, (value) {
      return _then(_value.copyWith(paymentMethod: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiverCopyWith<$Res>? get sender {
    if (_value.sender == null) {
      return null;
    }

    return $ReceiverCopyWith<$Res>(_value.sender!, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReceiverCopyWith<$Res>? get receiver {
    if (_value.receiver == null) {
      return null;
    }

    return $ReceiverCopyWith<$Res>(_value.receiver!, (value) {
      return _then(_value.copyWith(receiver: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TransactionsCopyWith<$Res>
    implements $TransactionsCopyWith<$Res> {
  factory _$$_TransactionsCopyWith(
          _$_Transactions value, $Res Function(_$_Transactions) then) =
      __$$_TransactionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "payment_method") PaymentMethod? paymentMethod,
      Receiver? sender,
      Receiver? receiver,
      Currency? currency,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? status,
      String? amount,
      @JsonKey(name: "transaction_type") String? transactionType,
      String? order,
      @JsonKey(name: "created_by") String? createdBy});

  @override
  $PaymentMethodCopyWith<$Res>? get paymentMethod;
  @override
  $ReceiverCopyWith<$Res>? get sender;
  @override
  $ReceiverCopyWith<$Res>? get receiver;
  @override
  $CurrencyCopyWith<$Res>? get currency;
}

/// @nodoc
class __$$_TransactionsCopyWithImpl<$Res>
    extends _$TransactionsCopyWithImpl<$Res, _$_Transactions>
    implements _$$_TransactionsCopyWith<$Res> {
  __$$_TransactionsCopyWithImpl(
      _$_Transactions _value, $Res Function(_$_Transactions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? paymentMethod = freezed,
    Object? sender = freezed,
    Object? receiver = freezed,
    Object? currency = freezed,
    Object? createdAt = freezed,
    Object? status = freezed,
    Object? amount = freezed,
    Object? transactionType = freezed,
    Object? order = freezed,
    Object? createdBy = freezed,
  }) {
    return _then(_$_Transactions(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentMethod?,
      sender: freezed == sender
          ? _value.sender
          : sender // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      receiver: freezed == receiver
          ? _value.receiver
          : receiver // ignore: cast_nullable_to_non_nullable
              as Receiver?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Transactions implements _Transactions {
  const _$_Transactions(
      {this.id,
      @JsonKey(name: "payment_method") this.paymentMethod,
      this.sender,
      this.receiver,
      this.currency,
      @JsonKey(name: "created_at") this.createdAt,
      this.status,
      this.amount,
      @JsonKey(name: "transaction_type") this.transactionType,
      this.order,
      @JsonKey(name: "created_by") this.createdBy});

  factory _$_Transactions.fromJson(Map<String, dynamic> json) =>
      _$$_TransactionsFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: "payment_method")
  final PaymentMethod? paymentMethod;
  @override
  final Receiver? sender;
  @override
  final Receiver? receiver;
  @override
  final Currency? currency;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  final String? status;
  @override
  final String? amount;
  @override
  @JsonKey(name: "transaction_type")
  final String? transactionType;
  @override
  final String? order;
  @override
  @JsonKey(name: "created_by")
  final String? createdBy;

  @override
  String toString() {
    return 'Transactions(id: $id, paymentMethod: $paymentMethod, sender: $sender, receiver: $receiver, currency: $currency, createdAt: $createdAt, status: $status, amount: $amount, transactionType: $transactionType, order: $order, createdBy: $createdBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Transactions &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.receiver, receiver) ||
                other.receiver == receiver) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      paymentMethod,
      sender,
      receiver,
      currency,
      createdAt,
      status,
      amount,
      transactionType,
      order,
      createdBy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionsCopyWith<_$_Transactions> get copyWith =>
      __$$_TransactionsCopyWithImpl<_$_Transactions>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TransactionsToJson(
      this,
    );
  }
}

abstract class _Transactions implements Transactions {
  const factory _Transactions(
      {final String? id,
      @JsonKey(name: "payment_method") final PaymentMethod? paymentMethod,
      final Receiver? sender,
      final Receiver? receiver,
      final Currency? currency,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      final String? status,
      final String? amount,
      @JsonKey(name: "transaction_type") final String? transactionType,
      final String? order,
      @JsonKey(name: "created_by") final String? createdBy}) = _$_Transactions;

  factory _Transactions.fromJson(Map<String, dynamic> json) =
      _$_Transactions.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "payment_method")
  PaymentMethod? get paymentMethod;
  @override
  Receiver? get sender;
  @override
  Receiver? get receiver;
  @override
  Currency? get currency;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  String? get status;
  @override
  String? get amount;
  @override
  @JsonKey(name: "transaction_type")
  String? get transactionType;
  @override
  String? get order;
  @override
  @JsonKey(name: "created_by")
  String? get createdBy;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionsCopyWith<_$_Transactions> get copyWith =>
      throw _privateConstructorUsedError;
}

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) {
  return _PaymentMethod.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethod {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get thumbnail => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentMethodCopyWith<PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodCopyWith<$Res> {
  factory $PaymentMethodCopyWith(
          PaymentMethod value, $Res Function(PaymentMethod) then) =
      _$PaymentMethodCopyWithImpl<$Res, PaymentMethod>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? logo,
      String? type,
      String? thumbnail});
}

/// @nodoc
class _$PaymentMethodCopyWithImpl<$Res, $Val extends PaymentMethod>
    implements $PaymentMethodCopyWith<$Res> {
  _$PaymentMethodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaymentMethodCopyWith<$Res>
    implements $PaymentMethodCopyWith<$Res> {
  factory _$$_PaymentMethodCopyWith(
          _$_PaymentMethod value, $Res Function(_$_PaymentMethod) then) =
      __$$_PaymentMethodCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? logo,
      String? type,
      String? thumbnail});
}

/// @nodoc
class __$$_PaymentMethodCopyWithImpl<$Res>
    extends _$PaymentMethodCopyWithImpl<$Res, _$_PaymentMethod>
    implements _$$_PaymentMethodCopyWith<$Res> {
  __$$_PaymentMethodCopyWithImpl(
      _$_PaymentMethod _value, $Res Function(_$_PaymentMethod) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? logo = freezed,
    Object? type = freezed,
    Object? thumbnail = freezed,
  }) {
    return _then(_$_PaymentMethod(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      thumbnail: freezed == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentMethod implements _PaymentMethod {
  const _$_PaymentMethod(
      {this.id, this.name, this.slug, this.logo, this.type, this.thumbnail});

  factory _$_PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$$_PaymentMethodFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? logo;
  @override
  final String? type;
  @override
  final String? thumbnail;

  @override
  String toString() {
    return 'PaymentMethod(id: $id, name: $name, slug: $slug, logo: $logo, type: $type, thumbnail: $thumbnail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaymentMethod &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, slug, logo, type, thumbnail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaymentMethodCopyWith<_$_PaymentMethod> get copyWith =>
      __$$_PaymentMethodCopyWithImpl<_$_PaymentMethod>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PaymentMethodToJson(
      this,
    );
  }
}

abstract class _PaymentMethod implements PaymentMethod {
  const factory _PaymentMethod(
      {final int? id,
      final String? name,
      final String? slug,
      final String? logo,
      final String? type,
      final String? thumbnail}) = _$_PaymentMethod;

  factory _PaymentMethod.fromJson(Map<String, dynamic> json) =
      _$_PaymentMethod.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  String? get logo;
  @override
  String? get type;
  @override
  String? get thumbnail;
  @override
  @JsonKey(ignore: true)
  _$$_PaymentMethodCopyWith<_$_PaymentMethod> get copyWith =>
      throw _privateConstructorUsedError;
}

Receiver _$ReceiverFromJson(Map<String, dynamic> json) {
  return _Receiver.fromJson(json);
}

/// @nodoc
mixin _$Receiver {
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiverCopyWith<Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiverCopyWith<$Res> {
  factory $ReceiverCopyWith(Receiver value, $Res Function(Receiver) then) =
      _$ReceiverCopyWithImpl<$Res, Receiver>;
  @useResult
  $Res call(
      {String? username,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class _$ReceiverCopyWithImpl<$Res, $Val extends Receiver>
    implements $ReceiverCopyWith<$Res> {
  _$ReceiverCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiverCopyWith<$Res> implements $ReceiverCopyWith<$Res> {
  factory _$$_ReceiverCopyWith(
          _$_Receiver value, $Res Function(_$_Receiver) then) =
      __$$_ReceiverCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? username,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "profile_image") String? profileImage});
}

/// @nodoc
class __$$_ReceiverCopyWithImpl<$Res>
    extends _$ReceiverCopyWithImpl<$Res, _$_Receiver>
    implements _$$_ReceiverCopyWith<$Res> {
  __$$_ReceiverCopyWithImpl(
      _$_Receiver _value, $Res Function(_$_Receiver) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$_Receiver(
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Receiver implements _Receiver {
  const _$_Receiver(
      {this.username,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "profile_image") this.profileImage});

  factory _$_Receiver.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiverFromJson(json);

  @override
  final String? username;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;

  @override
  String toString() {
    return 'Receiver(username: $username, fullName: $fullName, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Receiver &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, fullName, profileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiverCopyWith<_$_Receiver> get copyWith =>
      __$$_ReceiverCopyWithImpl<_$_Receiver>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiverToJson(
      this,
    );
  }
}

abstract class _Receiver implements Receiver {
  const factory _Receiver(
          {final String? username,
          @JsonKey(name: "full_name") final String? fullName,
          @JsonKey(name: "profile_image") final String? profileImage}) =
      _$_Receiver;

  factory _Receiver.fromJson(Map<String, dynamic> json) = _$_Receiver.fromJson;

  @override
  String? get username;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiverCopyWith<_$_Receiver> get copyWith =>
      throw _privateConstructorUsedError;
}
