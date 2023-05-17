// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'withdraw_req_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WithdrawReqResDto _$WithdrawReqResDtoFromJson(Map<String, dynamic> json) {
  return _WithdrawReqResDto.fromJson(json);
}

/// @nodoc
mixin _$WithdrawReqResDto {
  String? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account')
  int? get bankAccount => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WithdrawReqResDtoCopyWith<WithdrawReqResDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WithdrawReqResDtoCopyWith<$Res> {
  factory $WithdrawReqResDtoCopyWith(
          WithdrawReqResDto value, $Res Function(WithdrawReqResDto) then) =
      _$WithdrawReqResDtoCopyWithImpl<$Res, WithdrawReqResDto>;
  @useResult
  $Res call(
      {String? amount,
      @JsonKey(name: 'bank_account') int? bankAccount,
      String? description});
}

/// @nodoc
class _$WithdrawReqResDtoCopyWithImpl<$Res, $Val extends WithdrawReqResDto>
    implements $WithdrawReqResDtoCopyWith<$Res> {
  _$WithdrawReqResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? bankAccount = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WithdrawReqResDtoCopyWith<$Res>
    implements $WithdrawReqResDtoCopyWith<$Res> {
  factory _$$_WithdrawReqResDtoCopyWith(_$_WithdrawReqResDto value,
          $Res Function(_$_WithdrawReqResDto) then) =
      __$$_WithdrawReqResDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? amount,
      @JsonKey(name: 'bank_account') int? bankAccount,
      String? description});
}

/// @nodoc
class __$$_WithdrawReqResDtoCopyWithImpl<$Res>
    extends _$WithdrawReqResDtoCopyWithImpl<$Res, _$_WithdrawReqResDto>
    implements _$$_WithdrawReqResDtoCopyWith<$Res> {
  __$$_WithdrawReqResDtoCopyWithImpl(
      _$_WithdrawReqResDto _value, $Res Function(_$_WithdrawReqResDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? bankAccount = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_WithdrawReqResDto(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccount: freezed == bankAccount
          ? _value.bankAccount
          : bankAccount // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WithdrawReqResDto implements _WithdrawReqResDto {
  const _$_WithdrawReqResDto(
      {this.amount,
      @JsonKey(name: 'bank_account') this.bankAccount,
      this.description});

  factory _$_WithdrawReqResDto.fromJson(Map<String, dynamic> json) =>
      _$$_WithdrawReqResDtoFromJson(json);

  @override
  final String? amount;
  @override
  @JsonKey(name: 'bank_account')
  final int? bankAccount;
  @override
  final String? description;

  @override
  String toString() {
    return 'WithdrawReqResDto(amount: $amount, bankAccount: $bankAccount, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WithdrawReqResDto &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.bankAccount, bankAccount) ||
                other.bankAccount == bankAccount) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, bankAccount, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WithdrawReqResDtoCopyWith<_$_WithdrawReqResDto> get copyWith =>
      __$$_WithdrawReqResDtoCopyWithImpl<_$_WithdrawReqResDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WithdrawReqResDtoToJson(
      this,
    );
  }
}

abstract class _WithdrawReqResDto implements WithdrawReqResDto {
  const factory _WithdrawReqResDto(
      {final String? amount,
      @JsonKey(name: 'bank_account') final int? bankAccount,
      final String? description}) = _$_WithdrawReqResDto;

  factory _WithdrawReqResDto.fromJson(Map<String, dynamic> json) =
      _$_WithdrawReqResDto.fromJson;

  @override
  String? get amount;
  @override
  @JsonKey(name: 'bank_account')
  int? get bankAccount;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_WithdrawReqResDtoCopyWith<_$_WithdrawReqResDto> get copyWith =>
      throw _privateConstructorUsedError;
}
