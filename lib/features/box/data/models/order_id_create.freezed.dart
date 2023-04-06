// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_id_create.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderIdCreate _$OrderIdCreateFromJson(Map<String, dynamic> json) {
  return _OrderIdCreate.fromJson(json);
}

/// @nodoc
mixin _$OrderIdCreate {
  String? get order => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderIdCreateCopyWith<OrderIdCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderIdCreateCopyWith<$Res> {
  factory $OrderIdCreateCopyWith(
          OrderIdCreate value, $Res Function(OrderIdCreate) then) =
      _$OrderIdCreateCopyWithImpl<$Res, OrderIdCreate>;
  @useResult
  $Res call({String? order});
}

/// @nodoc
class _$OrderIdCreateCopyWithImpl<$Res, $Val extends OrderIdCreate>
    implements $OrderIdCreateCopyWith<$Res> {
  _$OrderIdCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OrderIdCreateCopyWith<$Res>
    implements $OrderIdCreateCopyWith<$Res> {
  factory _$$_OrderIdCreateCopyWith(
          _$_OrderIdCreate value, $Res Function(_$_OrderIdCreate) then) =
      __$$_OrderIdCreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? order});
}

/// @nodoc
class __$$_OrderIdCreateCopyWithImpl<$Res>
    extends _$OrderIdCreateCopyWithImpl<$Res, _$_OrderIdCreate>
    implements _$$_OrderIdCreateCopyWith<$Res> {
  __$$_OrderIdCreateCopyWithImpl(
      _$_OrderIdCreate _value, $Res Function(_$_OrderIdCreate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? order = freezed,
  }) {
    return _then(_$_OrderIdCreate(
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderIdCreate implements _OrderIdCreate {
  const _$_OrderIdCreate({this.order});

  factory _$_OrderIdCreate.fromJson(Map<String, dynamic> json) =>
      _$$_OrderIdCreateFromJson(json);

  @override
  final String? order;

  @override
  String toString() {
    return 'OrderIdCreate(order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderIdCreate &&
            (identical(other.order, order) || other.order == order));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, order);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderIdCreateCopyWith<_$_OrderIdCreate> get copyWith =>
      __$$_OrderIdCreateCopyWithImpl<_$_OrderIdCreate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OrderIdCreateToJson(
      this,
    );
  }
}

abstract class _OrderIdCreate implements OrderIdCreate {
  const factory _OrderIdCreate({final String? order}) = _$_OrderIdCreate;

  factory _OrderIdCreate.fromJson(Map<String, dynamic> json) =
      _$_OrderIdCreate.fromJson;

  @override
  String? get order;
  @override
  @JsonKey(ignore: true)
  _$$_OrderIdCreateCopyWith<_$_OrderIdCreate> get copyWith =>
      throw _privateConstructorUsedError;
}
