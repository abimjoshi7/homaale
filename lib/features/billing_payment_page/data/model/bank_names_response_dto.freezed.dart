// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_names_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankNamesResponseDto _$BankNamesResponseDtoFromJson(Map<String, dynamic> json) {
  return _BankNamesResponseDto.fromJson(json);
}

/// @nodoc
mixin _$BankNamesResponseDto {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wallet')
  bool? get isWallet => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankNamesResponseDtoCopyWith<BankNamesResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankNamesResponseDtoCopyWith<$Res> {
  factory $BankNamesResponseDtoCopyWith(BankNamesResponseDto value,
          $Res Function(BankNamesResponseDto) then) =
      _$BankNamesResponseDtoCopyWithImpl<$Res, BankNamesResponseDto>;
  @useResult
  $Res call(
      {int? id, String? name, @JsonKey(name: 'is_wallet') bool? isWallet});
}

/// @nodoc
class _$BankNamesResponseDtoCopyWithImpl<$Res,
        $Val extends BankNamesResponseDto>
    implements $BankNamesResponseDtoCopyWith<$Res> {
  _$BankNamesResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isWallet = freezed,
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
      isWallet: freezed == isWallet
          ? _value.isWallet
          : isWallet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankNamesResponseDtoCopyWith<$Res>
    implements $BankNamesResponseDtoCopyWith<$Res> {
  factory _$$_BankNamesResponseDtoCopyWith(_$_BankNamesResponseDto value,
          $Res Function(_$_BankNamesResponseDto) then) =
      __$$_BankNamesResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id, String? name, @JsonKey(name: 'is_wallet') bool? isWallet});
}

/// @nodoc
class __$$_BankNamesResponseDtoCopyWithImpl<$Res>
    extends _$BankNamesResponseDtoCopyWithImpl<$Res, _$_BankNamesResponseDto>
    implements _$$_BankNamesResponseDtoCopyWith<$Res> {
  __$$_BankNamesResponseDtoCopyWithImpl(_$_BankNamesResponseDto _value,
      $Res Function(_$_BankNamesResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? isWallet = freezed,
  }) {
    return _then(_$_BankNamesResponseDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      isWallet: freezed == isWallet
          ? _value.isWallet
          : isWallet // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankNamesResponseDto implements _BankNamesResponseDto {
  const _$_BankNamesResponseDto(
      {this.id, this.name, @JsonKey(name: 'is_wallet') this.isWallet});

  factory _$_BankNamesResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_BankNamesResponseDtoFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'is_wallet')
  final bool? isWallet;

  @override
  String toString() {
    return 'BankNamesResponseDto(id: $id, name: $name, isWallet: $isWallet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankNamesResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isWallet, isWallet) ||
                other.isWallet == isWallet));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, isWallet);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankNamesResponseDtoCopyWith<_$_BankNamesResponseDto> get copyWith =>
      __$$_BankNamesResponseDtoCopyWithImpl<_$_BankNamesResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankNamesResponseDtoToJson(
      this,
    );
  }
}

abstract class _BankNamesResponseDto implements BankNamesResponseDto {
  const factory _BankNamesResponseDto(
          {final int? id,
          final String? name,
          @JsonKey(name: 'is_wallet') final bool? isWallet}) =
      _$_BankNamesResponseDto;

  factory _BankNamesResponseDto.fromJson(Map<String, dynamic> json) =
      _$_BankNamesResponseDto.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'is_wallet')
  bool? get isWallet;
  @override
  @JsonKey(ignore: true)
  _$$_BankNamesResponseDtoCopyWith<_$_BankNamesResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
