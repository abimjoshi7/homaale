// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_doc_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KycDocType _$KycDocTypeFromJson(Map<String, dynamic> json) {
  return _KycDocType.fromJson(json);
}

/// @nodoc
mixin _$KycDocType {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "required_for_user")
  bool? get requiredForUser => throw _privateConstructorUsedError;
  @JsonKey(name: "required_for_merchant")
  bool? get requiredForMerchant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycDocTypeCopyWith<KycDocType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycDocTypeCopyWith<$Res> {
  factory $KycDocTypeCopyWith(
          KycDocType value, $Res Function(KycDocType) then) =
      _$KycDocTypeCopyWithImpl<$Res, KycDocType>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: "required_for_user") bool? requiredForUser,
      @JsonKey(name: "required_for_merchant") bool? requiredForMerchant});
}

/// @nodoc
class _$KycDocTypeCopyWithImpl<$Res, $Val extends KycDocType>
    implements $KycDocTypeCopyWith<$Res> {
  _$KycDocTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? requiredForUser = freezed,
    Object? requiredForMerchant = freezed,
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
      requiredForUser: freezed == requiredForUser
          ? _value.requiredForUser
          : requiredForUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredForMerchant: freezed == requiredForMerchant
          ? _value.requiredForMerchant
          : requiredForMerchant // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_KycDocTypeCopyWith<$Res>
    implements $KycDocTypeCopyWith<$Res> {
  factory _$$_KycDocTypeCopyWith(
          _$_KycDocType value, $Res Function(_$_KycDocType) then) =
      __$$_KycDocTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: "required_for_user") bool? requiredForUser,
      @JsonKey(name: "required_for_merchant") bool? requiredForMerchant});
}

/// @nodoc
class __$$_KycDocTypeCopyWithImpl<$Res>
    extends _$KycDocTypeCopyWithImpl<$Res, _$_KycDocType>
    implements _$$_KycDocTypeCopyWith<$Res> {
  __$$_KycDocTypeCopyWithImpl(
      _$_KycDocType _value, $Res Function(_$_KycDocType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? requiredForUser = freezed,
    Object? requiredForMerchant = freezed,
  }) {
    return _then(_$_KycDocType(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      requiredForUser: freezed == requiredForUser
          ? _value.requiredForUser
          : requiredForUser // ignore: cast_nullable_to_non_nullable
              as bool?,
      requiredForMerchant: freezed == requiredForMerchant
          ? _value.requiredForMerchant
          : requiredForMerchant // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KycDocType implements _KycDocType {
  const _$_KycDocType(
      {this.id,
      this.name,
      @JsonKey(name: "required_for_user") this.requiredForUser,
      @JsonKey(name: "required_for_merchant") this.requiredForMerchant});

  factory _$_KycDocType.fromJson(Map<String, dynamic> json) =>
      _$$_KycDocTypeFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: "required_for_user")
  final bool? requiredForUser;
  @override
  @JsonKey(name: "required_for_merchant")
  final bool? requiredForMerchant;

  @override
  String toString() {
    return 'KycDocType(id: $id, name: $name, requiredForUser: $requiredForUser, requiredForMerchant: $requiredForMerchant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KycDocType &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.requiredForUser, requiredForUser) ||
                other.requiredForUser == requiredForUser) &&
            (identical(other.requiredForMerchant, requiredForMerchant) ||
                other.requiredForMerchant == requiredForMerchant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, requiredForUser, requiredForMerchant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KycDocTypeCopyWith<_$_KycDocType> get copyWith =>
      __$$_KycDocTypeCopyWithImpl<_$_KycDocType>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KycDocTypeToJson(
      this,
    );
  }
}

abstract class _KycDocType implements KycDocType {
  const factory _KycDocType(
      {final int? id,
      final String? name,
      @JsonKey(name: "required_for_user")
          final bool? requiredForUser,
      @JsonKey(name: "required_for_merchant")
          final bool? requiredForMerchant}) = _$_KycDocType;

  factory _KycDocType.fromJson(Map<String, dynamic> json) =
      _$_KycDocType.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: "required_for_user")
  bool? get requiredForUser;
  @override
  @JsonKey(name: "required_for_merchant")
  bool? get requiredForMerchant;
  @override
  @JsonKey(ignore: true)
  _$$_KycDocTypeCopyWith<_$_KycDocType> get copyWith =>
      throw _privateConstructorUsedError;
}
