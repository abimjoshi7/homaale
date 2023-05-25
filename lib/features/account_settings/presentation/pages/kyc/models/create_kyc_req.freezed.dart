// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_kyc_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateKycReq _$CreateKycReqFromJson(Map<String, dynamic> json) {
  return _CreateKycReq.fromJson(json);
}

/// @nodoc
mixin _$CreateKycReq {
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "logo")
  @MultipartFileConverter()
  MultipartFile? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "is_company")
  bool? get isCompany => throw _privateConstructorUsedError;
  @JsonKey(name: "organization_name")
  String? get organizationName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  int? get company => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateKycReqCopyWith<CreateKycReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateKycReqCopyWith<$Res> {
  factory $CreateKycReqCopyWith(
          CreateKycReq value, $Res Function(CreateKycReq) then) =
      _$CreateKycReqCopyWithImpl<$Res, CreateKycReq>;
  @useResult
  $Res call(
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "logo") @MultipartFileConverter() MultipartFile? logo,
      @JsonKey(name: "is_company") bool? isCompany,
      @JsonKey(name: "organization_name") String? organizationName,
      String? address,
      int? company,
      String? country});
}

/// @nodoc
class _$CreateKycReqCopyWithImpl<$Res, $Val extends CreateKycReq>
    implements $CreateKycReqCopyWith<$Res> {
  _$CreateKycReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? logo = freezed,
    Object? isCompany = freezed,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? company = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
      isCompany: freezed == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateKycReqCopyWith<$Res>
    implements $CreateKycReqCopyWith<$Res> {
  factory _$$_CreateKycReqCopyWith(
          _$_CreateKycReq value, $Res Function(_$_CreateKycReq) then) =
      __$$_CreateKycReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "logo") @MultipartFileConverter() MultipartFile? logo,
      @JsonKey(name: "is_company") bool? isCompany,
      @JsonKey(name: "organization_name") String? organizationName,
      String? address,
      int? company,
      String? country});
}

/// @nodoc
class __$$_CreateKycReqCopyWithImpl<$Res>
    extends _$CreateKycReqCopyWithImpl<$Res, _$_CreateKycReq>
    implements _$$_CreateKycReqCopyWith<$Res> {
  __$$_CreateKycReqCopyWithImpl(
      _$_CreateKycReq _value, $Res Function(_$_CreateKycReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = freezed,
    Object? logo = freezed,
    Object? isCompany = freezed,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? company = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_CreateKycReq(
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as MultipartFile?,
      isCompany: freezed == isCompany
          ? _value.isCompany
          : isCompany // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizationName: freezed == organizationName
          ? _value.organizationName
          : organizationName // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as int?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateKycReq implements _CreateKycReq {
  const _$_CreateKycReq(
      {@JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "logo") @MultipartFileConverter() this.logo,
      @JsonKey(name: "is_company") this.isCompany,
      @JsonKey(name: "organization_name") this.organizationName,
      this.address,
      this.company,
      this.country});

  factory _$_CreateKycReq.fromJson(Map<String, dynamic> json) =>
      _$$_CreateKycReqFromJson(json);

  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "logo")
  @MultipartFileConverter()
  final MultipartFile? logo;
  @override
  @JsonKey(name: "is_company")
  final bool? isCompany;
  @override
  @JsonKey(name: "organization_name")
  final String? organizationName;
  @override
  final String? address;
  @override
  final int? company;
  @override
  final String? country;

  @override
  String toString() {
    return 'CreateKycReq(fullName: $fullName, logo: $logo, isCompany: $isCompany, organizationName: $organizationName, address: $address, company: $company, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateKycReq &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.isCompany, isCompany) ||
                other.isCompany == isCompany) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, logo, isCompany,
      organizationName, address, company, country);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateKycReqCopyWith<_$_CreateKycReq> get copyWith =>
      __$$_CreateKycReqCopyWithImpl<_$_CreateKycReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateKycReqToJson(
      this,
    );
  }
}

abstract class _CreateKycReq implements CreateKycReq {
  const factory _CreateKycReq(
      {@JsonKey(name: "full_name")
          final String? fullName,
      @JsonKey(name: "logo")
      @MultipartFileConverter()
          final MultipartFile? logo,
      @JsonKey(name: "is_company")
          final bool? isCompany,
      @JsonKey(name: "organization_name")
          final String? organizationName,
      final String? address,
      final int? company,
      final String? country}) = _$_CreateKycReq;

  factory _CreateKycReq.fromJson(Map<String, dynamic> json) =
      _$_CreateKycReq.fromJson;

  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "logo")
  @MultipartFileConverter()
  MultipartFile? get logo;
  @override
  @JsonKey(name: "is_company")
  bool? get isCompany;
  @override
  @JsonKey(name: "organization_name")
  String? get organizationName;
  @override
  String? get address;
  @override
  int? get company;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  _$$_CreateKycReqCopyWith<_$_CreateKycReq> get copyWith =>
      throw _privateConstructorUsedError;
}
