// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_payment_method_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavePaymentMethodDto _$SavePaymentMethodDtoFromJson(Map<String, dynamic> json) {
  return _SavePaymentMethodDto.fromJson(json);
}

/// @nodoc
mixin _$SavePaymentMethodDto {
  String? get bankAccountName => throw _privateConstructorUsedError;
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  bool? get isPrimary => throw _privateConstructorUsedError;
  int? get bankName => throw _privateConstructorUsedError;
  int? get branchName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavePaymentMethodDtoCopyWith<SavePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavePaymentMethodDtoCopyWith<$Res> {
  factory $SavePaymentMethodDtoCopyWith(SavePaymentMethodDto value,
          $Res Function(SavePaymentMethodDto) then) =
      _$SavePaymentMethodDtoCopyWithImpl<$Res, SavePaymentMethodDto>;
  @useResult
  $Res call(
      {String? bankAccountName,
      String? bankAccountNumber,
      bool? isPrimary,
      int? bankName,
      int? branchName});
}

/// @nodoc
class _$SavePaymentMethodDtoCopyWithImpl<$Res,
        $Val extends SavePaymentMethodDto>
    implements $SavePaymentMethodDtoCopyWith<$Res> {
  _$SavePaymentMethodDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? isPrimary = freezed,
    Object? bankName = freezed,
    Object? branchName = freezed,
  }) {
    return _then(_value.copyWith(
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavePaymentMethodDtoCopyWith<$Res>
    implements $SavePaymentMethodDtoCopyWith<$Res> {
  factory _$$_SavePaymentMethodDtoCopyWith(_$_SavePaymentMethodDto value,
          $Res Function(_$_SavePaymentMethodDto) then) =
      __$$_SavePaymentMethodDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? bankAccountName,
      String? bankAccountNumber,
      bool? isPrimary,
      int? bankName,
      int? branchName});
}

/// @nodoc
class __$$_SavePaymentMethodDtoCopyWithImpl<$Res>
    extends _$SavePaymentMethodDtoCopyWithImpl<$Res, _$_SavePaymentMethodDto>
    implements _$$_SavePaymentMethodDtoCopyWith<$Res> {
  __$$_SavePaymentMethodDtoCopyWithImpl(_$_SavePaymentMethodDto _value,
      $Res Function(_$_SavePaymentMethodDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? isPrimary = freezed,
    Object? bankName = freezed,
    Object? branchName = freezed,
  }) {
    return _then(_$_SavePaymentMethodDto(
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isPrimary: freezed == isPrimary
          ? _value.isPrimary
          : isPrimary // ignore: cast_nullable_to_non_nullable
              as bool?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as int?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavePaymentMethodDto implements _SavePaymentMethodDto {
  const _$_SavePaymentMethodDto(
      {this.bankAccountName,
      this.bankAccountNumber,
      this.isPrimary,
      this.bankName,
      this.branchName});

  factory _$_SavePaymentMethodDto.fromJson(Map<String, dynamic> json) =>
      _$$_SavePaymentMethodDtoFromJson(json);

  @override
  final String? bankAccountName;
  @override
  final String? bankAccountNumber;
  @override
  final bool? isPrimary;
  @override
  final int? bankName;
  @override
  final int? branchName;

  @override
  String toString() {
    return 'SavePaymentMethodDto(bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, isPrimary: $isPrimary, bankName: $bankName, branchName: $branchName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavePaymentMethodDto &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bankAccountName,
      bankAccountNumber, isPrimary, bankName, branchName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavePaymentMethodDtoCopyWith<_$_SavePaymentMethodDto> get copyWith =>
      __$$_SavePaymentMethodDtoCopyWithImpl<_$_SavePaymentMethodDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavePaymentMethodDtoToJson(
      this,
    );
  }
}

abstract class _SavePaymentMethodDto implements SavePaymentMethodDto {
  const factory _SavePaymentMethodDto(
      {final String? bankAccountName,
      final String? bankAccountNumber,
      final bool? isPrimary,
      final int? bankName,
      final int? branchName}) = _$_SavePaymentMethodDto;

  factory _SavePaymentMethodDto.fromJson(Map<String, dynamic> json) =
      _$_SavePaymentMethodDto.fromJson;

  @override
  String? get bankAccountName;
  @override
  String? get bankAccountNumber;
  @override
  bool? get isPrimary;
  @override
  int? get bankName;
  @override
  int? get branchName;
  @override
  @JsonKey(ignore: true)
  _$$_SavePaymentMethodDtoCopyWith<_$_SavePaymentMethodDto> get copyWith =>
      throw _privateConstructorUsedError;
}
