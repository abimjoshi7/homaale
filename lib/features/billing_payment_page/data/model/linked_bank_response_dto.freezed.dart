// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'linked_bank_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LinkedBankResponseDto _$LinkedBankResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _LinkedBankResponseDto.fromJson(json);
}

/// @nodoc
mixin _$LinkedBankResponseDto {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  List<LinkedBankDto>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkedBankResponseDtoCopyWith<LinkedBankResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkedBankResponseDtoCopyWith<$Res> {
  factory $LinkedBankResponseDtoCopyWith(LinkedBankResponseDto value,
          $Res Function(LinkedBankResponseDto) then) =
      _$LinkedBankResponseDtoCopyWithImpl<$Res, LinkedBankResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'result') List<LinkedBankDto>? result});
}

/// @nodoc
class _$LinkedBankResponseDtoCopyWithImpl<$Res,
        $Val extends LinkedBankResponseDto>
    implements $LinkedBankResponseDtoCopyWith<$Res> {
  _$LinkedBankResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<LinkedBankDto>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinkedBankResponseDtoCopyWith<$Res>
    implements $LinkedBankResponseDtoCopyWith<$Res> {
  factory _$$_LinkedBankResponseDtoCopyWith(_$_LinkedBankResponseDto value,
          $Res Function(_$_LinkedBankResponseDto) then) =
      __$$_LinkedBankResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'result') List<LinkedBankDto>? result});
}

/// @nodoc
class __$$_LinkedBankResponseDtoCopyWithImpl<$Res>
    extends _$LinkedBankResponseDtoCopyWithImpl<$Res, _$_LinkedBankResponseDto>
    implements _$$_LinkedBankResponseDtoCopyWith<$Res> {
  __$$_LinkedBankResponseDtoCopyWithImpl(_$_LinkedBankResponseDto _value,
      $Res Function(_$_LinkedBankResponseDto) _then)
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
    return _then(_$_LinkedBankResponseDto(
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
              as List<LinkedBankDto>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinkedBankResponseDto implements _LinkedBankResponseDto {
  const _$_LinkedBankResponseDto(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      @JsonKey(name: 'result') final List<LinkedBankDto>? result})
      : _result = result;

  factory _$_LinkedBankResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_LinkedBankResponseDtoFromJson(json);

  @override
  @JsonKey(name: 'total_pages')
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
  @JsonKey(name: 'page_size')
  final int? pageSize;
  final List<LinkedBankDto>? _result;
  @override
  @JsonKey(name: 'result')
  List<LinkedBankDto>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'LinkedBankResponseDto(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkedBankResponseDto &&
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
  _$$_LinkedBankResponseDtoCopyWith<_$_LinkedBankResponseDto> get copyWith =>
      __$$_LinkedBankResponseDtoCopyWithImpl<_$_LinkedBankResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkedBankResponseDtoToJson(
      this,
    );
  }
}

abstract class _LinkedBankResponseDto implements LinkedBankResponseDto {
  const factory _LinkedBankResponseDto(
          {@JsonKey(name: 'total_pages') final int? totalPages,
          final int? count,
          final int? current,
          final String? next,
          final String? previous,
          @JsonKey(name: 'page_size') final int? pageSize,
          @JsonKey(name: 'result') final List<LinkedBankDto>? result}) =
      _$_LinkedBankResponseDto;

  factory _LinkedBankResponseDto.fromJson(Map<String, dynamic> json) =
      _$_LinkedBankResponseDto.fromJson;

  @override
  @JsonKey(name: 'total_pages')
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
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @override
  @JsonKey(name: 'result')
  List<LinkedBankDto>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_LinkedBankResponseDtoCopyWith<_$_LinkedBankResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

LinkedBankDto _$LinkedBankDtoFromJson(Map<String, dynamic> json) {
  return _LinkedBankDto.fromJson(json);
}

/// @nodoc
mixin _$LinkedBankDto {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'branch_name')
  String? get branchName => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_wallet')
  bool? get isWallet => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_name')
  String? get bankAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_number')
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_primary')
  bool? get isPrimary => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LinkedBankDtoCopyWith<LinkedBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkedBankDtoCopyWith<$Res> {
  factory $LinkedBankDtoCopyWith(
          LinkedBankDto value, $Res Function(LinkedBankDto) then) =
      _$LinkedBankDtoCopyWithImpl<$Res, LinkedBankDto>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'is_wallet') bool? isWallet,
      String? logo,
      @JsonKey(name: 'bank_account_name') String? bankAccountName,
      @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
      @JsonKey(name: 'is_primary') bool? isPrimary,
      @JsonKey(name: 'is_verified') bool? isVerified});
}

/// @nodoc
class _$LinkedBankDtoCopyWithImpl<$Res, $Val extends LinkedBankDto>
    implements $LinkedBankDtoCopyWith<$Res> {
  _$LinkedBankDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bankName = freezed,
    Object? branchName = freezed,
    Object? isWallet = freezed,
    Object? logo = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? isPrimary = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      isWallet: freezed == isWallet
          ? _value.isWallet
          : isWallet // ignore: cast_nullable_to_non_nullable
              as bool?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LinkedBankDtoCopyWith<$Res>
    implements $LinkedBankDtoCopyWith<$Res> {
  factory _$$_LinkedBankDtoCopyWith(
          _$_LinkedBankDto value, $Res Function(_$_LinkedBankDto) then) =
      __$$_LinkedBankDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'branch_name') String? branchName,
      @JsonKey(name: 'is_wallet') bool? isWallet,
      String? logo,
      @JsonKey(name: 'bank_account_name') String? bankAccountName,
      @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
      @JsonKey(name: 'is_primary') bool? isPrimary,
      @JsonKey(name: 'is_verified') bool? isVerified});
}

/// @nodoc
class __$$_LinkedBankDtoCopyWithImpl<$Res>
    extends _$LinkedBankDtoCopyWithImpl<$Res, _$_LinkedBankDto>
    implements _$$_LinkedBankDtoCopyWith<$Res> {
  __$$_LinkedBankDtoCopyWithImpl(
      _$_LinkedBankDto _value, $Res Function(_$_LinkedBankDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? bankName = freezed,
    Object? branchName = freezed,
    Object? isWallet = freezed,
    Object? logo = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? isPrimary = freezed,
    Object? isVerified = freezed,
  }) {
    return _then(_$_LinkedBankDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      branchName: freezed == branchName
          ? _value.branchName
          : branchName // ignore: cast_nullable_to_non_nullable
              as String?,
      isWallet: freezed == isWallet
          ? _value.isWallet
          : isWallet // ignore: cast_nullable_to_non_nullable
              as bool?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LinkedBankDto implements _LinkedBankDto {
  const _$_LinkedBankDto(
      {this.id,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'branch_name') this.branchName,
      @JsonKey(name: 'is_wallet') this.isWallet,
      this.logo,
      @JsonKey(name: 'bank_account_name') this.bankAccountName,
      @JsonKey(name: 'bank_account_number') this.bankAccountNumber,
      @JsonKey(name: 'is_primary') this.isPrimary,
      @JsonKey(name: 'is_verified') this.isVerified});

  factory _$_LinkedBankDto.fromJson(Map<String, dynamic> json) =>
      _$$_LinkedBankDtoFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'branch_name')
  final String? branchName;
  @override
  @JsonKey(name: 'is_wallet')
  final bool? isWallet;
  @override
  final String? logo;
  @override
  @JsonKey(name: 'bank_account_name')
  final String? bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  final String? bankAccountNumber;
  @override
  @JsonKey(name: 'is_primary')
  final bool? isPrimary;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;

  @override
  String toString() {
    return 'LinkedBankDto(id: $id, bankName: $bankName, branchName: $branchName, isWallet: $isWallet, logo: $logo, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, isPrimary: $isPrimary, isVerified: $isVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LinkedBankDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.branchName, branchName) ||
                other.branchName == branchName) &&
            (identical(other.isWallet, isWallet) ||
                other.isWallet == isWallet) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.isPrimary, isPrimary) ||
                other.isPrimary == isPrimary) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      bankName,
      branchName,
      isWallet,
      logo,
      bankAccountName,
      bankAccountNumber,
      isPrimary,
      isVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LinkedBankDtoCopyWith<_$_LinkedBankDto> get copyWith =>
      __$$_LinkedBankDtoCopyWithImpl<_$_LinkedBankDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LinkedBankDtoToJson(
      this,
    );
  }
}

abstract class _LinkedBankDto implements LinkedBankDto {
  const factory _LinkedBankDto(
      {final int? id,
      @JsonKey(name: 'bank_name') final String? bankName,
      @JsonKey(name: 'branch_name') final String? branchName,
      @JsonKey(name: 'is_wallet') final bool? isWallet,
      final String? logo,
      @JsonKey(name: 'bank_account_name') final String? bankAccountName,
      @JsonKey(name: 'bank_account_number') final String? bankAccountNumber,
      @JsonKey(name: 'is_primary') final bool? isPrimary,
      @JsonKey(name: 'is_verified') final bool? isVerified}) = _$_LinkedBankDto;

  factory _LinkedBankDto.fromJson(Map<String, dynamic> json) =
      _$_LinkedBankDto.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  @JsonKey(name: 'branch_name')
  String? get branchName;
  @override
  @JsonKey(name: 'is_wallet')
  bool? get isWallet;
  @override
  String? get logo;
  @override
  @JsonKey(name: 'bank_account_name')
  String? get bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  String? get bankAccountNumber;
  @override
  @JsonKey(name: 'is_primary')
  bool? get isPrimary;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  @JsonKey(ignore: true)
  _$$_LinkedBankDtoCopyWith<_$_LinkedBankDto> get copyWith =>
      throw _privateConstructorUsedError;
}
