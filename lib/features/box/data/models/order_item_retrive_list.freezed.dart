// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item_retrive_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderItemRetriveList _$OrderItemRetriveListFromJson(Map<String, dynamic> json) {
  return _OrderItemRetriveList.fromJson(json);
}

/// @nodoc
mixin _$OrderItemRetriveList {
  String? get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_item')
  List<OrderItem>? get orderItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'grand_total')
  double? get grandTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemRetriveListCopyWith<OrderItemRetriveList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemRetriveListCopyWith<$Res> {
  factory $OrderItemRetriveListCopyWith(OrderItemRetriveList value,
          $Res Function(OrderItemRetriveList) then) =
      _$OrderItemRetriveListCopyWithImpl<$Res, OrderItemRetriveList>;
  @useResult
  $Res call(
      {String? id,
      String? user,
      String? currency,
      String? status,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'order_item') List<OrderItem>? orderItem,
      @JsonKey(name: 'grand_total') double? grandTotal});
}

/// @nodoc
class _$OrderItemRetriveListCopyWithImpl<$Res,
        $Val extends OrderItemRetriveList>
    implements $OrderItemRetriveListCopyWith<$Res> {
  _$OrderItemRetriveListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? currency = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? orderItem = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderItem: freezed == orderItem
          ? _value.orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderItemRetriveListCopyWith<$Res>
    implements $OrderItemRetriveListCopyWith<$Res> {
  factory _$$_OrderItemRetriveListCopyWith(_$_OrderItemRetriveList value,
          $Res Function(_$_OrderItemRetriveList) then) =
      __$$_OrderItemRetriveListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? user,
      String? currency,
      String? status,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'order_item') List<OrderItem>? orderItem,
      @JsonKey(name: 'grand_total') double? grandTotal});
}

/// @nodoc
class __$$_OrderItemRetriveListCopyWithImpl<$Res>
    extends _$OrderItemRetriveListCopyWithImpl<$Res, _$_OrderItemRetriveList>
    implements _$$_OrderItemRetriveListCopyWith<$Res> {
  __$$_OrderItemRetriveListCopyWithImpl(_$_OrderItemRetriveList _value,
      $Res Function(_$_OrderItemRetriveList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? currency = freezed,
    Object? status = freezed,
    Object? isActive = freezed,
    Object? orderItem = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_$_OrderItemRetriveList(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      orderItem: freezed == orderItem
          ? _value._orderItem
          : orderItem // ignore: cast_nullable_to_non_nullable
              as List<OrderItem>?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderItemRetriveList implements _OrderItemRetriveList {
  const _$_OrderItemRetriveList(
      {this.id,
      this.user,
      this.currency,
      this.status,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'order_item') final List<OrderItem>? orderItem,
      @JsonKey(name: 'grand_total') this.grandTotal})
      : _orderItem = orderItem;

  factory _$_OrderItemRetriveList.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemRetriveListFromJson(json);

  @override
  final String? id;
  @override
  final String? user;
  @override
  final String? currency;
  @override
  final String? status;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  final List<OrderItem>? _orderItem;
  @override
  @JsonKey(name: 'order_item')
  List<OrderItem>? get orderItem {
    final value = _orderItem;
    if (value == null) return null;
    if (_orderItem is EqualUnmodifiableListView) return _orderItem;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'grand_total')
  final double? grandTotal;

  @override
  String toString() {
    return 'OrderItemRetriveList(id: $id, user: $user, currency: $currency, status: $status, isActive: $isActive, orderItem: $orderItem, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItemRetriveList &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._orderItem, _orderItem) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, currency, status,
      isActive, const DeepCollectionEquality().hash(_orderItem), grandTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderItemRetriveListCopyWith<_$_OrderItemRetriveList> get copyWith =>
      __$$_OrderItemRetriveListCopyWithImpl<_$_OrderItemRetriveList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemRetriveListToJson(
      this,
    );
  }
}

abstract class _OrderItemRetriveList implements OrderItemRetriveList {
  const factory _OrderItemRetriveList(
          {final String? id,
          final String? user,
          final String? currency,
          final String? status,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'order_item') final List<OrderItem>? orderItem,
          @JsonKey(name: 'grand_total') final double? grandTotal}) =
      _$_OrderItemRetriveList;

  factory _OrderItemRetriveList.fromJson(Map<String, dynamic> json) =
      _$_OrderItemRetriveList.fromJson;

  @override
  String? get id;
  @override
  String? get user;
  @override
  String? get currency;
  @override
  String? get status;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'order_item')
  List<OrderItem>? get orderItem;
  @override
  @JsonKey(name: 'grand_total')
  double? get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemRetriveListCopyWith<_$_OrderItemRetriveList> get copyWith =>
      throw _privateConstructorUsedError;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) {
  return _OrderItem.fromJson(json);
}

/// @nodoc
mixin _$OrderItem {
  String? get id => throw _privateConstructorUsedError;
  Task? get task => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get vat => throw _privateConstructorUsedError;
  @JsonKey(name: 'offer_value')
  double? get offerValue => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_charge')
  double? get platformCharge => throw _privateConstructorUsedError;
  @JsonKey(name: 'platform_charge_discount')
  double? get platformChargeDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'equipment_charges')
  double? get equipmentCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'revision_charges')
  double? get revisionCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_charges')
  double? get otherCharges => throw _privateConstructorUsedError;
  @JsonKey(name: 'other_discounts')
  double? get otherDiscounts => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_data')
  ExtraData? get extraData => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  String? get order => throw _privateConstructorUsedError;
  dynamic get offer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderItemCopyWith<OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderItemCopyWith<$Res> {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) then) =
      _$OrderItemCopyWithImpl<$Res, OrderItem>;
  @useResult
  $Res call(
      {String? id,
      Task? task,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      double? amount,
      double? tax,
      double? vat,
      @JsonKey(name: 'offer_value') double? offerValue,
      double? discount,
      @JsonKey(name: 'platform_charge') double? platformCharge,
      @JsonKey(name: 'platform_charge_discount') double? platformChargeDiscount,
      @JsonKey(name: 'equipment_charges') double? equipmentCharges,
      @JsonKey(name: 'revision_charges') double? revisionCharges,
      @JsonKey(name: 'other_charges') double? otherCharges,
      @JsonKey(name: 'other_discounts') double? otherDiscounts,
      @JsonKey(name: 'extra_data') ExtraData? extraData,
      @JsonKey(name: 'is_active') bool? isActive,
      String? order,
      dynamic offer});

  $TaskCopyWith<$Res>? get task;
  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class _$OrderItemCopyWithImpl<$Res, $Val extends OrderItem>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? task = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amount = freezed,
    Object? tax = freezed,
    Object? vat = freezed,
    Object? offerValue = freezed,
    Object? discount = freezed,
    Object? platformCharge = freezed,
    Object? platformChargeDiscount = freezed,
    Object? equipmentCharges = freezed,
    Object? revisionCharges = freezed,
    Object? otherCharges = freezed,
    Object? otherDiscounts = freezed,
    Object? extraData = freezed,
    Object? isActive = freezed,
    Object? order = freezed,
    Object? offer = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double?,
      offerValue: freezed == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      platformCharge: freezed == platformCharge
          ? _value.platformCharge
          : platformCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      platformChargeDiscount: freezed == platformChargeDiscount
          ? _value.platformChargeDiscount
          : platformChargeDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      equipmentCharges: freezed == equipmentCharges
          ? _value.equipmentCharges
          : equipmentCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      revisionCharges: freezed == revisionCharges
          ? _value.revisionCharges
          : revisionCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      otherCharges: freezed == otherCharges
          ? _value.otherCharges
          : otherCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      otherDiscounts: freezed == otherDiscounts
          ? _value.otherDiscounts
          : otherDiscounts // ignore: cast_nullable_to_non_nullable
              as double?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskCopyWith<$Res>? get task {
    if (_value.task == null) {
      return null;
    }

    return $TaskCopyWith<$Res>(_value.task!, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ExtraDataCopyWith<$Res>? get extraData {
    if (_value.extraData == null) {
      return null;
    }

    return $ExtraDataCopyWith<$Res>(_value.extraData!, (value) {
      return _then(_value.copyWith(extraData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$$_OrderItemCopyWith(
          _$_OrderItem value, $Res Function(_$_OrderItem) then) =
      __$$_OrderItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      Task? task,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      double? amount,
      double? tax,
      double? vat,
      @JsonKey(name: 'offer_value') double? offerValue,
      double? discount,
      @JsonKey(name: 'platform_charge') double? platformCharge,
      @JsonKey(name: 'platform_charge_discount') double? platformChargeDiscount,
      @JsonKey(name: 'equipment_charges') double? equipmentCharges,
      @JsonKey(name: 'revision_charges') double? revisionCharges,
      @JsonKey(name: 'other_charges') double? otherCharges,
      @JsonKey(name: 'other_discounts') double? otherDiscounts,
      @JsonKey(name: 'extra_data') ExtraData? extraData,
      @JsonKey(name: 'is_active') bool? isActive,
      String? order,
      dynamic offer});

  @override
  $TaskCopyWith<$Res>? get task;
  @override
  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class __$$_OrderItemCopyWithImpl<$Res>
    extends _$OrderItemCopyWithImpl<$Res, _$_OrderItem>
    implements _$$_OrderItemCopyWith<$Res> {
  __$$_OrderItemCopyWithImpl(
      _$_OrderItem _value, $Res Function(_$_OrderItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? task = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? amount = freezed,
    Object? tax = freezed,
    Object? vat = freezed,
    Object? offerValue = freezed,
    Object? discount = freezed,
    Object? platformCharge = freezed,
    Object? platformChargeDiscount = freezed,
    Object? equipmentCharges = freezed,
    Object? revisionCharges = freezed,
    Object? otherCharges = freezed,
    Object? otherDiscounts = freezed,
    Object? extraData = freezed,
    Object? isActive = freezed,
    Object? order = freezed,
    Object? offer = freezed,
  }) {
    return _then(_$_OrderItem(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as Task?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      vat: freezed == vat
          ? _value.vat
          : vat // ignore: cast_nullable_to_non_nullable
              as double?,
      offerValue: freezed == offerValue
          ? _value.offerValue
          : offerValue // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      platformCharge: freezed == platformCharge
          ? _value.platformCharge
          : platformCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      platformChargeDiscount: freezed == platformChargeDiscount
          ? _value.platformChargeDiscount
          : platformChargeDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      equipmentCharges: freezed == equipmentCharges
          ? _value.equipmentCharges
          : equipmentCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      revisionCharges: freezed == revisionCharges
          ? _value.revisionCharges
          : revisionCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      otherCharges: freezed == otherCharges
          ? _value.otherCharges
          : otherCharges // ignore: cast_nullable_to_non_nullable
              as double?,
      otherDiscounts: freezed == otherDiscounts
          ? _value.otherDiscounts
          : otherDiscounts // ignore: cast_nullable_to_non_nullable
              as double?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
      offer: freezed == offer
          ? _value.offer
          : offer // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderItem implements _OrderItem {
  const _$_OrderItem(
      {this.id,
      this.task,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.amount,
      this.tax,
      this.vat,
      @JsonKey(name: 'offer_value') this.offerValue,
      this.discount,
      @JsonKey(name: 'platform_charge') this.platformCharge,
      @JsonKey(name: 'platform_charge_discount') this.platformChargeDiscount,
      @JsonKey(name: 'equipment_charges') this.equipmentCharges,
      @JsonKey(name: 'revision_charges') this.revisionCharges,
      @JsonKey(name: 'other_charges') this.otherCharges,
      @JsonKey(name: 'other_discounts') this.otherDiscounts,
      @JsonKey(name: 'extra_data') this.extraData,
      @JsonKey(name: 'is_active') this.isActive,
      this.order,
      this.offer});

  factory _$_OrderItem.fromJson(Map<String, dynamic> json) =>
      _$$_OrderItemFromJson(json);

  @override
  final String? id;
  @override
  final Task? task;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final double? amount;
  @override
  final double? tax;
  @override
  final double? vat;
  @override
  @JsonKey(name: 'offer_value')
  final double? offerValue;
  @override
  final double? discount;
  @override
  @JsonKey(name: 'platform_charge')
  final double? platformCharge;
  @override
  @JsonKey(name: 'platform_charge_discount')
  final double? platformChargeDiscount;
  @override
  @JsonKey(name: 'equipment_charges')
  final double? equipmentCharges;
  @override
  @JsonKey(name: 'revision_charges')
  final double? revisionCharges;
  @override
  @JsonKey(name: 'other_charges')
  final double? otherCharges;
  @override
  @JsonKey(name: 'other_discounts')
  final double? otherDiscounts;
  @override
  @JsonKey(name: 'extra_data')
  final ExtraData? extraData;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  final String? order;
  @override
  final dynamic offer;

  @override
  String toString() {
    return 'OrderItem(id: $id, task: $task, createdAt: $createdAt, updatedAt: $updatedAt, amount: $amount, tax: $tax, vat: $vat, offerValue: $offerValue, discount: $discount, platformCharge: $platformCharge, platformChargeDiscount: $platformChargeDiscount, equipmentCharges: $equipmentCharges, revisionCharges: $revisionCharges, otherCharges: $otherCharges, otherDiscounts: $otherDiscounts, extraData: $extraData, isActive: $isActive, order: $order, offer: $offer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderItem &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.vat, vat) || other.vat == vat) &&
            (identical(other.offerValue, offerValue) ||
                other.offerValue == offerValue) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.platformCharge, platformCharge) ||
                other.platformCharge == platformCharge) &&
            (identical(other.platformChargeDiscount, platformChargeDiscount) ||
                other.platformChargeDiscount == platformChargeDiscount) &&
            (identical(other.equipmentCharges, equipmentCharges) ||
                other.equipmentCharges == equipmentCharges) &&
            (identical(other.revisionCharges, revisionCharges) ||
                other.revisionCharges == revisionCharges) &&
            (identical(other.otherCharges, otherCharges) ||
                other.otherCharges == otherCharges) &&
            (identical(other.otherDiscounts, otherDiscounts) ||
                other.otherDiscounts == otherDiscounts) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other.offer, offer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        task,
        createdAt,
        updatedAt,
        amount,
        tax,
        vat,
        offerValue,
        discount,
        platformCharge,
        platformChargeDiscount,
        equipmentCharges,
        revisionCharges,
        otherCharges,
        otherDiscounts,
        extraData,
        isActive,
        order,
        const DeepCollectionEquality().hash(offer)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      __$$_OrderItemCopyWithImpl<_$_OrderItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderItemToJson(
      this,
    );
  }
}

abstract class _OrderItem implements OrderItem {
  const factory _OrderItem(
      {final String? id,
      final Task? task,
      @JsonKey(name: 'created_at')
          final String? createdAt,
      @JsonKey(name: 'updated_at')
          final DateTime? updatedAt,
      final double? amount,
      final double? tax,
      final double? vat,
      @JsonKey(name: 'offer_value')
          final double? offerValue,
      final double? discount,
      @JsonKey(name: 'platform_charge')
          final double? platformCharge,
      @JsonKey(name: 'platform_charge_discount')
          final double? platformChargeDiscount,
      @JsonKey(name: 'equipment_charges')
          final double? equipmentCharges,
      @JsonKey(name: 'revision_charges')
          final double? revisionCharges,
      @JsonKey(name: 'other_charges')
          final double? otherCharges,
      @JsonKey(name: 'other_discounts')
          final double? otherDiscounts,
      @JsonKey(name: 'extra_data')
          final ExtraData? extraData,
      @JsonKey(name: 'is_active')
          final bool? isActive,
      final String? order,
      final dynamic offer}) = _$_OrderItem;

  factory _OrderItem.fromJson(Map<String, dynamic> json) =
      _$_OrderItem.fromJson;

  @override
  String? get id;
  @override
  Task? get task;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  double? get amount;
  @override
  double? get tax;
  @override
  double? get vat;
  @override
  @JsonKey(name: 'offer_value')
  double? get offerValue;
  @override
  double? get discount;
  @override
  @JsonKey(name: 'platform_charge')
  double? get platformCharge;
  @override
  @JsonKey(name: 'platform_charge_discount')
  double? get platformChargeDiscount;
  @override
  @JsonKey(name: 'equipment_charges')
  double? get equipmentCharges;
  @override
  @JsonKey(name: 'revision_charges')
  double? get revisionCharges;
  @override
  @JsonKey(name: 'other_charges')
  double? get otherCharges;
  @override
  @JsonKey(name: 'other_discounts')
  double? get otherDiscounts;
  @override
  @JsonKey(name: 'extra_data')
  ExtraData? get extraData;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  String? get order;
  @override
  dynamic get offer;
  @override
  @JsonKey(ignore: true)
  _$$_OrderItemCopyWith<_$_OrderItem> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) {
  return _ExtraData.fromJson(json);
}

/// @nodoc
mixin _$ExtraData {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraDataCopyWith<$Res> {
  factory $ExtraDataCopyWith(ExtraData value, $Res Function(ExtraData) then) =
      _$ExtraDataCopyWithImpl<$Res, ExtraData>;
}

/// @nodoc
class _$ExtraDataCopyWithImpl<$Res, $Val extends ExtraData>
    implements $ExtraDataCopyWith<$Res> {
  _$ExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ExtraDataCopyWith<$Res> {
  factory _$$_ExtraDataCopyWith(
          _$_ExtraData value, $Res Function(_$_ExtraData) then) =
      __$$_ExtraDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExtraDataCopyWithImpl<$Res>
    extends _$ExtraDataCopyWithImpl<$Res, _$_ExtraData>
    implements _$$_ExtraDataCopyWith<$Res> {
  __$$_ExtraDataCopyWithImpl(
      _$_ExtraData _value, $Res Function(_$_ExtraData) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ExtraData implements _ExtraData {
  const _$_ExtraData();

  factory _$_ExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraDataFromJson(json);

  @override
  String toString() {
    return 'ExtraData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ExtraData);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraDataToJson(
      this,
    );
  }
}

abstract class _ExtraData implements ExtraData {
  const factory _ExtraData() = _$_ExtraData;

  factory _ExtraData.fromJson(Map<String, dynamic> json) =
      _$_ExtraData.fromJson;
}

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get booking => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_service')
  String? get entityService => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_service_images')
  List<dynamic>? get entityServiceImages => throw _privateConstructorUsedError;
  Assigne? get assigner => throw _privateConstructorUsedError;
  Assigne? get assignee => throw _privateConstructorUsedError;
  String? get currency => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      int? booking,
      @JsonKey(name: 'entity_service')
          String? entityService,
      @JsonKey(name: 'entity_service_images')
          List<dynamic>? entityServiceImages,
      Assigne? assigner,
      Assigne? assignee,
      String? currency,
      String? location});

  $AssigneCopyWith<$Res>? get assigner;
  $AssigneCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? booking = freezed,
    Object? entityService = freezed,
    Object? entityServiceImages = freezed,
    Object? assigner = freezed,
    Object? assignee = freezed,
    Object? currency = freezed,
    Object? location = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as String?,
      entityServiceImages: freezed == entityServiceImages
          ? _value.entityServiceImages
          : entityServiceImages // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assigne?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Assigne?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssigneCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $AssigneCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssigneCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $AssigneCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$_TaskCopyWith(_$_Task value, $Res Function(_$_Task) then) =
      __$$_TaskCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      int? booking,
      @JsonKey(name: 'entity_service')
          String? entityService,
      @JsonKey(name: 'entity_service_images')
          List<dynamic>? entityServiceImages,
      Assigne? assigner,
      Assigne? assignee,
      String? currency,
      String? location});

  @override
  $AssigneCopyWith<$Res>? get assigner;
  @override
  $AssigneCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$$_TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res, _$_Task>
    implements _$$_TaskCopyWith<$Res> {
  __$$_TaskCopyWithImpl(_$_Task _value, $Res Function(_$_Task) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? booking = freezed,
    Object? entityService = freezed,
    Object? entityServiceImages = freezed,
    Object? assigner = freezed,
    Object? assignee = freezed,
    Object? currency = freezed,
    Object? location = freezed,
  }) {
    return _then(_$_Task(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as String?,
      entityServiceImages: freezed == entityServiceImages
          ? _value._entityServiceImages
          : entityServiceImages // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assigne?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Assigne?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {this.id,
      this.title,
      this.booking,
      @JsonKey(name: 'entity_service')
          this.entityService,
      @JsonKey(name: 'entity_service_images')
          final List<dynamic>? entityServiceImages,
      this.assigner,
      this.assignee,
      this.currency,
      this.location})
      : _entityServiceImages = entityServiceImages;

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final int? booking;
  @override
  @JsonKey(name: 'entity_service')
  final String? entityService;
  final List<dynamic>? _entityServiceImages;
  @override
  @JsonKey(name: 'entity_service_images')
  List<dynamic>? get entityServiceImages {
    final value = _entityServiceImages;
    if (value == null) return null;
    if (_entityServiceImages is EqualUnmodifiableListView)
      return _entityServiceImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Assigne? assigner;
  @override
  final Assigne? assignee;
  @override
  final String? currency;
  @override
  final String? location;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, booking: $booking, entityService: $entityService, entityServiceImages: $entityServiceImages, assigner: $assigner, assignee: $assignee, currency: $currency, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Task &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.booking, booking) || other.booking == booking) &&
            (identical(other.entityService, entityService) ||
                other.entityService == entityService) &&
            const DeepCollectionEquality()
                .equals(other._entityServiceImages, _entityServiceImages) &&
            (identical(other.assigner, assigner) ||
                other.assigner == assigner) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      booking,
      entityService,
      const DeepCollectionEquality().hash(_entityServiceImages),
      assigner,
      assignee,
      currency,
      location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskCopyWith<_$_Task> get copyWith =>
      __$$_TaskCopyWithImpl<_$_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(
      this,
    );
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {final String? id,
      final String? title,
      final int? booking,
      @JsonKey(name: 'entity_service')
          final String? entityService,
      @JsonKey(name: 'entity_service_images')
          final List<dynamic>? entityServiceImages,
      final Assigne? assigner,
      final Assigne? assignee,
      final String? currency,
      final String? location}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  int? get booking;
  @override
  @JsonKey(name: 'entity_service')
  String? get entityService;
  @override
  @JsonKey(name: 'entity_service_images')
  List<dynamic>? get entityServiceImages;
  @override
  Assigne? get assigner;
  @override
  Assigne? get assignee;
  @override
  String? get currency;
  @override
  String? get location;
  @override
  @JsonKey(ignore: true)
  _$$_TaskCopyWith<_$_Task> get copyWith => throw _privateConstructorUsedError;
}

Assigne _$AssigneFromJson(Map<String, dynamic> json) {
  return _Assigne.fromJson(json);
}

/// @nodoc
mixin _$Assigne {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_images')
  String? get profileImage => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_followed')
  bool? get isFollowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssigneCopyWith<Assigne> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssigneCopyWith<$Res> {
  factory $AssigneCopyWith(Assigne value, $Res Function(Assigne) then) =
      _$AssigneCopyWithImpl<$Res, Assigne>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_images') String? profileImage,
      String? bio,
      @JsonKey(name: 'created_at') String? createdAt,
      String? designation,
      @JsonKey(name: 'user_type') String? userType,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      Badge? badge});

  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$AssigneCopyWithImpl<$Res, $Val extends Assigne>
    implements $AssigneCopyWith<$Res> {
  _$AssigneCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? designation = freezed,
    Object? userType = freezed,
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? badge = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $BadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AssigneCopyWith<$Res> implements $AssigneCopyWith<$Res> {
  factory _$$_AssigneCopyWith(
          _$_Assigne value, $Res Function(_$_Assigne) then) =
      __$$_AssigneCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_images') String? profileImage,
      String? bio,
      @JsonKey(name: 'created_at') String? createdAt,
      String? designation,
      @JsonKey(name: 'user_type') String? userType,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      Badge? badge});

  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_AssigneCopyWithImpl<$Res>
    extends _$AssigneCopyWithImpl<$Res, _$_Assigne>
    implements _$$_AssigneCopyWith<$Res> {
  __$$_AssigneCopyWithImpl(_$_Assigne _value, $Res Function(_$_Assigne) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? designation = freezed,
    Object? userType = freezed,
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? badge = freezed,
  }) {
    return _then(_$_Assigne(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Assigne implements _Assigne {
  const _$_Assigne(
      {this.id,
      this.username,
      this.email,
      this.phone,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'middle_name') this.middleName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'profile_images') this.profileImage,
      this.bio,
      @JsonKey(name: 'created_at') this.createdAt,
      this.designation,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'is_profile_verified') this.isProfileVerified,
      @JsonKey(name: 'is_followed') this.isFollowed,
      @JsonKey(name: 'is_following') this.isFollowing,
      this.badge});

  factory _$_Assigne.fromJson(Map<String, dynamic> json) =>
      _$$_AssigneFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'profile_images')
  final String? profileImage;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final String? designation;
  @override
  @JsonKey(name: 'user_type')
  final String? userType;
  @override
  @JsonKey(name: 'is_profile_verified')
  final bool? isProfileVerified;
  @override
  @JsonKey(name: 'is_followed')
  final bool? isFollowed;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;
  @override
  final Badge? badge;

  @override
  String toString() {
    return 'Assigne(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, userType: $userType, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assigne &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isProfileVerified, isProfileVerified) ||
                other.isProfileVerified == isProfileVerified) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.badge, badge) || other.badge == badge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      phone,
      fullName,
      firstName,
      middleName,
      lastName,
      profileImage,
      bio,
      createdAt,
      designation,
      userType,
      isProfileVerified,
      isFollowed,
      isFollowing,
      badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AssigneCopyWith<_$_Assigne> get copyWith =>
      __$$_AssigneCopyWithImpl<_$_Assigne>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssigneToJson(
      this,
    );
  }
}

abstract class _Assigne implements Assigne {
  const factory _Assigne(
      {final String? id,
      final String? username,
      final String? email,
      final String? phone,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'middle_name') final String? middleName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'profile_images') final String? profileImage,
      final String? bio,
      @JsonKey(name: 'created_at') final String? createdAt,
      final String? designation,
      @JsonKey(name: 'user_type') final String? userType,
      @JsonKey(name: 'is_profile_verified') final bool? isProfileVerified,
      @JsonKey(name: 'is_followed') final bool? isFollowed,
      @JsonKey(name: 'is_following') final bool? isFollowing,
      final Badge? badge}) = _$_Assigne;

  factory _Assigne.fromJson(Map<String, dynamic> json) = _$_Assigne.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'middle_name')
  String? get middleName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'profile_images')
  String? get profileImage;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  String? get designation;
  @override
  @JsonKey(name: 'user_type')
  String? get userType;
  @override
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified;
  @override
  @JsonKey(name: 'is_followed')
  bool? get isFollowed;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_AssigneCopyWith<_$_Assigne> get copyWith =>
      throw _privateConstructorUsedError;
}

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class _$BadgeCopyWithImpl<$Res, $Val extends Badge>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$_BadgeCopyWith(_$_Badge value, $Res Function(_$_Badge) then) =
      __$$_BadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class __$$_BadgeCopyWithImpl<$Res> extends _$BadgeCopyWithImpl<$Res, _$_Badge>
    implements _$$_BadgeCopyWith<$Res> {
  __$$_BadgeCopyWithImpl(_$_Badge _value, $Res Function(_$_Badge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_Badge(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Badge implements _Badge {
  const _$_Badge({this.id, this.image, this.title});

  factory _$_Badge.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? title;

  @override
  String toString() {
    return 'Badge(id: $id, image: $image, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Badge &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BadgeCopyWith<_$_Badge> get copyWith =>
      __$$_BadgeCopyWithImpl<_$_Badge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BadgeToJson(
      this,
    );
  }
}

abstract class _Badge implements Badge {
  const factory _Badge(
      {final int? id, final String? image, final String? title}) = _$_Badge;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$_Badge.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeCopyWith<_$_Badge> get copyWith =>
      throw _privateConstructorUsedError;
}
