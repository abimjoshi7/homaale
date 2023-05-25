// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

KycModel _$KycModelFromJson(Map<String, dynamic> json) {
  return _KycModel.fromJson(json);
}

/// @nodoc
mixin _$KycModel {
  int? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;
  @JsonKey(name: "is_company")
  bool? get isCompany => throw _privateConstructorUsedError;
  @JsonKey(name: "organization_name")
  String? get organizationName => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: "is_kyc_verified")
  bool? get isKycVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_address_verified")
  bool? get isAddressVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_company_kyc_verified")
  bool? get isCompanyKycVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_company_address_verified")
  bool? get isCompanyAddressVerified => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KycModelCopyWith<KycModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycModelCopyWith<$Res> {
  factory $KycModelCopyWith(KycModel value, $Res Function(KycModel) then) =
      _$KycModelCopyWithImpl<$Res, KycModel>;
  @useResult
  $Res call(
      {int? id,
      User? user,
      Country? country,
      @JsonKey(name: "created_at")
          DateTime? createdAt,
      @JsonKey(name: "updated_at")
          DateTime? updatedAt,
      @JsonKey(name: "full_name")
          String? fullName,
      String? logo,
      @JsonKey(name: "is_company")
          bool? isCompany,
      @JsonKey(name: "organization_name")
          String? organizationName,
      String? address,
      @JsonKey(name: "is_kyc_verified")
          bool? isKycVerified,
      @JsonKey(name: "is_address_verified")
          bool? isAddressVerified,
      @JsonKey(name: "is_company_kyc_verified")
          bool? isCompanyKycVerified,
      @JsonKey(name: "is_company_address_verified")
          bool? isCompanyAddressVerified,
      String? comment});

  $UserCopyWith<$Res>? get user;
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class _$KycModelCopyWithImpl<$Res, $Val extends KycModel>
    implements $KycModelCopyWith<$Res> {
  _$KycModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? country = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fullName = freezed,
    Object? logo = freezed,
    Object? isCompany = freezed,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? isKycVerified = freezed,
    Object? isAddressVerified = freezed,
    Object? isCompanyKycVerified = freezed,
    Object? isCompanyAddressVerified = freezed,
    Object? comment = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isKycVerified: freezed == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAddressVerified: freezed == isAddressVerified
          ? _value.isAddressVerified
          : isAddressVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompanyKycVerified: freezed == isCompanyKycVerified
          ? _value.isCompanyKycVerified
          : isCompanyKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompanyAddressVerified: freezed == isCompanyAddressVerified
          ? _value.isCompanyAddressVerified
          : isCompanyAddressVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_KycModelCopyWith<$Res> implements $KycModelCopyWith<$Res> {
  factory _$$_KycModelCopyWith(
          _$_KycModel value, $Res Function(_$_KycModel) then) =
      __$$_KycModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      User? user,
      Country? country,
      @JsonKey(name: "created_at")
          DateTime? createdAt,
      @JsonKey(name: "updated_at")
          DateTime? updatedAt,
      @JsonKey(name: "full_name")
          String? fullName,
      String? logo,
      @JsonKey(name: "is_company")
          bool? isCompany,
      @JsonKey(name: "organization_name")
          String? organizationName,
      String? address,
      @JsonKey(name: "is_kyc_verified")
          bool? isKycVerified,
      @JsonKey(name: "is_address_verified")
          bool? isAddressVerified,
      @JsonKey(name: "is_company_kyc_verified")
          bool? isCompanyKycVerified,
      @JsonKey(name: "is_company_address_verified")
          bool? isCompanyAddressVerified,
      String? comment});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $CountryCopyWith<$Res>? get country;
}

/// @nodoc
class __$$_KycModelCopyWithImpl<$Res>
    extends _$KycModelCopyWithImpl<$Res, _$_KycModel>
    implements _$$_KycModelCopyWith<$Res> {
  __$$_KycModelCopyWithImpl(
      _$_KycModel _value, $Res Function(_$_KycModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? country = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? fullName = freezed,
    Object? logo = freezed,
    Object? isCompany = freezed,
    Object? organizationName = freezed,
    Object? address = freezed,
    Object? isKycVerified = freezed,
    Object? isAddressVerified = freezed,
    Object? isCompanyKycVerified = freezed,
    Object? isCompanyAddressVerified = freezed,
    Object? comment = freezed,
  }) {
    return _then(_$_KycModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: freezed == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      isKycVerified: freezed == isKycVerified
          ? _value.isKycVerified
          : isKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAddressVerified: freezed == isAddressVerified
          ? _value.isAddressVerified
          : isAddressVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompanyKycVerified: freezed == isCompanyKycVerified
          ? _value.isCompanyKycVerified
          : isCompanyKycVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isCompanyAddressVerified: freezed == isCompanyAddressVerified
          ? _value.isCompanyAddressVerified
          : isCompanyAddressVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_KycModel implements _KycModel {
  const _$_KycModel(
      {this.id,
      this.user,
      this.country,
      @JsonKey(name: "created_at")
          this.createdAt,
      @JsonKey(name: "updated_at")
          this.updatedAt,
      @JsonKey(name: "full_name")
          this.fullName,
      this.logo,
      @JsonKey(name: "is_company")
          this.isCompany,
      @JsonKey(name: "organization_name")
          this.organizationName,
      this.address,
      @JsonKey(name: "is_kyc_verified")
          this.isKycVerified,
      @JsonKey(name: "is_address_verified")
          this.isAddressVerified,
      @JsonKey(name: "is_company_kyc_verified")
          this.isCompanyKycVerified,
      @JsonKey(name: "is_company_address_verified")
          this.isCompanyAddressVerified,
      this.comment});

  factory _$_KycModel.fromJson(Map<String, dynamic> json) =>
      _$$_KycModelFromJson(json);

  @override
  final int? id;
  @override
  final User? user;
  @override
  final Country? country;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  final String? logo;
  @override
  @JsonKey(name: "is_company")
  final bool? isCompany;
  @override
  @JsonKey(name: "organization_name")
  final String? organizationName;
  @override
  final String? address;
  @override
  @JsonKey(name: "is_kyc_verified")
  final bool? isKycVerified;
  @override
  @JsonKey(name: "is_address_verified")
  final bool? isAddressVerified;
  @override
  @JsonKey(name: "is_company_kyc_verified")
  final bool? isCompanyKycVerified;
  @override
  @JsonKey(name: "is_company_address_verified")
  final bool? isCompanyAddressVerified;
  @override
  final String? comment;

  @override
  String toString() {
    return 'KycModel(id: $id, user: $user, country: $country, createdAt: $createdAt, updatedAt: $updatedAt, fullName: $fullName, logo: $logo, isCompany: $isCompany, organizationName: $organizationName, address: $address, isKycVerified: $isKycVerified, isAddressVerified: $isAddressVerified, isCompanyKycVerified: $isCompanyKycVerified, isCompanyAddressVerified: $isCompanyAddressVerified, comment: $comment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_KycModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.isCompany, isCompany) ||
                other.isCompany == isCompany) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.isKycVerified, isKycVerified) ||
                other.isKycVerified == isKycVerified) &&
            (identical(other.isAddressVerified, isAddressVerified) ||
                other.isAddressVerified == isAddressVerified) &&
            (identical(other.isCompanyKycVerified, isCompanyKycVerified) ||
                other.isCompanyKycVerified == isCompanyKycVerified) &&
            (identical(
                    other.isCompanyAddressVerified, isCompanyAddressVerified) ||
                other.isCompanyAddressVerified == isCompanyAddressVerified) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user,
      country,
      createdAt,
      updatedAt,
      fullName,
      logo,
      isCompany,
      organizationName,
      address,
      isKycVerified,
      isAddressVerified,
      isCompanyKycVerified,
      isCompanyAddressVerified,
      comment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_KycModelCopyWith<_$_KycModel> get copyWith =>
      __$$_KycModelCopyWithImpl<_$_KycModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_KycModelToJson(
      this,
    );
  }
}

abstract class _KycModel implements KycModel {
  const factory _KycModel(
      {final int? id,
      final User? user,
      final Country? country,
      @JsonKey(name: "created_at")
          final DateTime? createdAt,
      @JsonKey(name: "updated_at")
          final DateTime? updatedAt,
      @JsonKey(name: "full_name")
          final String? fullName,
      final String? logo,
      @JsonKey(name: "is_company")
          final bool? isCompany,
      @JsonKey(name: "organization_name")
          final String? organizationName,
      final String? address,
      @JsonKey(name: "is_kyc_verified")
          final bool? isKycVerified,
      @JsonKey(name: "is_address_verified")
          final bool? isAddressVerified,
      @JsonKey(name: "is_company_kyc_verified")
          final bool? isCompanyKycVerified,
      @JsonKey(name: "is_company_address_verified")
          final bool? isCompanyAddressVerified,
      final String? comment}) = _$_KycModel;

  factory _KycModel.fromJson(Map<String, dynamic> json) = _$_KycModel.fromJson;

  @override
  int? get id;
  @override
  User? get user;
  @override
  Country? get country;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  String? get logo;
  @override
  @JsonKey(name: "is_company")
  bool? get isCompany;
  @override
  @JsonKey(name: "organization_name")
  String? get organizationName;
  @override
  String? get address;
  @override
  @JsonKey(name: "is_kyc_verified")
  bool? get isKycVerified;
  @override
  @JsonKey(name: "is_address_verified")
  bool? get isAddressVerified;
  @override
  @JsonKey(name: "is_company_kyc_verified")
  bool? get isCompanyKycVerified;
  @override
  @JsonKey(name: "is_company_address_verified")
  bool? get isCompanyAddressVerified;
  @override
  String? get comment;
  @override
  @JsonKey(ignore: true)
  _$$_KycModelCopyWith<_$_KycModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Country(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Country implements _Country {
  const _$_Country({this.name, this.code});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'Country(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country({final String? name, final String? code}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "middle_name")
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_followed")
  bool? get isFollowed => throw _privateConstructorUsedError;
  @JsonKey(name: "is_following")
  bool? get isFollowing => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      String? bio,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? designation,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      @JsonKey(name: "is_followed") bool? isFollowed,
      @JsonKey(name: "is_following") bool? isFollowing,
      Badge? badge});

  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
              as DateTime?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      String? bio,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? designation,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      @JsonKey(name: "is_followed") bool? isFollowed,
      @JsonKey(name: "is_following") bool? isFollowing,
      Badge? badge});

  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
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
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? badge = freezed,
  }) {
    return _then(_$_User(
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
              as DateTime?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
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
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.username,
      this.email,
      this.phone,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "middle_name") this.middleName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "profile_image") this.profileImage,
      this.bio,
      @JsonKey(name: "created_at") this.createdAt,
      this.designation,
      @JsonKey(name: "is_profile_verified") this.isProfileVerified,
      @JsonKey(name: "is_followed") this.isFollowed,
      @JsonKey(name: "is_following") this.isFollowing,
      this.badge});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "middle_name")
  final String? middleName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  final String? bio;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  final String? designation;
  @override
  @JsonKey(name: "is_profile_verified")
  final bool? isProfileVerified;
  @override
  @JsonKey(name: "is_followed")
  final bool? isFollowed;
  @override
  @JsonKey(name: "is_following")
  final bool? isFollowing;
  @override
  final Badge? badge;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
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
      isProfileVerified,
      isFollowed,
      isFollowing,
      badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      final String? username,
      final String? email,
      final String? phone,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "middle_name") final String? middleName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "profile_image") final String? profileImage,
      final String? bio,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      final String? designation,
      @JsonKey(name: "is_profile_verified") final bool? isProfileVerified,
      @JsonKey(name: "is_followed") final bool? isFollowed,
      @JsonKey(name: "is_following") final bool? isFollowing,
      final Badge? badge}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "middle_name")
  String? get middleName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  String? get bio;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  String? get designation;
  @override
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified;
  @override
  @JsonKey(name: "is_followed")
  bool? get isFollowed;
  @override
  @JsonKey(name: "is_following")
  bool? get isFollowing;
  @override
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
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
