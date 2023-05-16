// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_branch_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BankBranchResponseDto _$BankBranchResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _BankBranchResponseDto.fromJson(json);
}

/// @nodoc
mixin _$BankBranchResponseDto {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankBranchResponseDtoCopyWith<BankBranchResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankBranchResponseDtoCopyWith<$Res> {
  factory $BankBranchResponseDtoCopyWith(BankBranchResponseDto value,
          $Res Function(BankBranchResponseDto) then) =
      _$BankBranchResponseDtoCopyWithImpl<$Res, BankBranchResponseDto>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$BankBranchResponseDtoCopyWithImpl<$Res,
        $Val extends BankBranchResponseDto>
    implements $BankBranchResponseDtoCopyWith<$Res> {
  _$BankBranchResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BankBranchResponseDtoCopyWith<$Res>
    implements $BankBranchResponseDtoCopyWith<$Res> {
  factory _$$_BankBranchResponseDtoCopyWith(_$_BankBranchResponseDto value,
          $Res Function(_$_BankBranchResponseDto) then) =
      __$$_BankBranchResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_BankBranchResponseDtoCopyWithImpl<$Res>
    extends _$BankBranchResponseDtoCopyWithImpl<$Res, _$_BankBranchResponseDto>
    implements _$$_BankBranchResponseDtoCopyWith<$Res> {
  __$$_BankBranchResponseDtoCopyWithImpl(_$_BankBranchResponseDto _value,
      $Res Function(_$_BankBranchResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_BankBranchResponseDto(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BankBranchResponseDto implements _BankBranchResponseDto {
  const _$_BankBranchResponseDto({this.id, this.name});

  factory _$_BankBranchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_BankBranchResponseDtoFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'BankBranchResponseDto(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BankBranchResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BankBranchResponseDtoCopyWith<_$_BankBranchResponseDto> get copyWith =>
      __$$_BankBranchResponseDtoCopyWithImpl<_$_BankBranchResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BankBranchResponseDtoToJson(
      this,
    );
  }
}

abstract class _BankBranchResponseDto implements BankBranchResponseDto {
  const factory _BankBranchResponseDto({final int? id, final String? name}) =
      _$_BankBranchResponseDto;

  factory _BankBranchResponseDto.fromJson(Map<String, dynamic> json) =
      _$_BankBranchResponseDto.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_BankBranchResponseDtoCopyWith<_$_BankBranchResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
