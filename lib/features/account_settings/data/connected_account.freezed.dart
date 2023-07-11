// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connected_account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectedAccount _$ConnectedAccountFromJson(Map<String, dynamic> json) {
  return _ConnectedAccount.fromJson(json);
}

/// @nodoc
mixin _$ConnectedAccount {
  int? get id => throw _privateConstructorUsedError;
  String? get provider => throw _privateConstructorUsedError;
  String? get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "extra_data")
  ExtraData? get extraData => throw _privateConstructorUsedError;
  DateTime? get created => throw _privateConstructorUsedError;
  DateTime? get modified => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectedAccountCopyWith<ConnectedAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectedAccountCopyWith<$Res> {
  factory $ConnectedAccountCopyWith(
          ConnectedAccount value, $Res Function(ConnectedAccount) then) =
      _$ConnectedAccountCopyWithImpl<$Res, ConnectedAccount>;
  @useResult
  $Res call(
      {int? id,
      String? provider,
      String? uid,
      @JsonKey(name: "extra_data") ExtraData? extraData,
      DateTime? created,
      DateTime? modified,
      String? user});

  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class _$ConnectedAccountCopyWithImpl<$Res, $Val extends ConnectedAccount>
    implements $ConnectedAccountCopyWith<$Res> {
  _$ConnectedAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provider = freezed,
    Object? uid = freezed,
    Object? extraData = freezed,
    Object? created = freezed,
    Object? modified = freezed,
    Object? user = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
abstract class _$$_ConnectedAccountCopyWith<$Res>
    implements $ConnectedAccountCopyWith<$Res> {
  factory _$$_ConnectedAccountCopyWith(
          _$_ConnectedAccount value, $Res Function(_$_ConnectedAccount) then) =
      __$$_ConnectedAccountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? provider,
      String? uid,
      @JsonKey(name: "extra_data") ExtraData? extraData,
      DateTime? created,
      DateTime? modified,
      String? user});

  @override
  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class __$$_ConnectedAccountCopyWithImpl<$Res>
    extends _$ConnectedAccountCopyWithImpl<$Res, _$_ConnectedAccount>
    implements _$$_ConnectedAccountCopyWith<$Res> {
  __$$_ConnectedAccountCopyWithImpl(
      _$_ConnectedAccount _value, $Res Function(_$_ConnectedAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? provider = freezed,
    Object? uid = freezed,
    Object? extraData = freezed,
    Object? created = freezed,
    Object? modified = freezed,
    Object? user = freezed,
  }) {
    return _then(_$_ConnectedAccount(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      provider: freezed == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: freezed == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ConnectedAccount implements _ConnectedAccount {
  const _$_ConnectedAccount(
      {this.id,
      this.provider,
      this.uid,
      @JsonKey(name: "extra_data") this.extraData,
      this.created,
      this.modified,
      this.user});

  factory _$_ConnectedAccount.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectedAccountFromJson(json);

  @override
  final int? id;
  @override
  final String? provider;
  @override
  final String? uid;
  @override
  @JsonKey(name: "extra_data")
  final ExtraData? extraData;
  @override
  final DateTime? created;
  @override
  final DateTime? modified;
  @override
  final String? user;

  @override
  String toString() {
    return 'ConnectedAccount(id: $id, provider: $provider, uid: $uid, extraData: $extraData, created: $created, modified: $modified, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectedAccount &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData) &&
            (identical(other.created, created) || other.created == created) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, provider, uid, extraData, created, modified, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectedAccountCopyWith<_$_ConnectedAccount> get copyWith =>
      __$$_ConnectedAccountCopyWithImpl<_$_ConnectedAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectedAccountToJson(
      this,
    );
  }
}

abstract class _ConnectedAccount implements ConnectedAccount {
  const factory _ConnectedAccount(
      {final int? id,
      final String? provider,
      final String? uid,
      @JsonKey(name: "extra_data") final ExtraData? extraData,
      final DateTime? created,
      final DateTime? modified,
      final String? user}) = _$_ConnectedAccount;

  factory _ConnectedAccount.fromJson(Map<String, dynamic> json) =
      _$_ConnectedAccount.fromJson;

  @override
  int? get id;
  @override
  String? get provider;
  @override
  String? get uid;
  @override
  @JsonKey(name: "extra_data")
  ExtraData? get extraData;
  @override
  DateTime? get created;
  @override
  DateTime? get modified;
  @override
  String? get user;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectedAccountCopyWith<_$_ConnectedAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) {
  return _ExtraData.fromJson(json);
}

/// @nodoc
mixin _$ExtraData {
  String? get hd => throw _privateConstructorUsedError;
  String? get aud => throw _privateConstructorUsedError;
  String? get azp => throw _privateConstructorUsedError;
  int? get exp => throw _privateConstructorUsedError;
  int? get iat => throw _privateConstructorUsedError;
  String? get iss => throw _privateConstructorUsedError;
  String? get sub => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  String? get picture => throw _privateConstructorUsedError;
  @JsonKey(name: "given_name")
  String? get givenName => throw _privateConstructorUsedError;
  @JsonKey(name: "family_name")
  String? get familyName => throw _privateConstructorUsedError;
  @JsonKey(name: "email_verifed")
  bool? get emailVerified => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtraDataCopyWith<ExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraDataCopyWith<$Res> {
  factory $ExtraDataCopyWith(ExtraData value, $Res Function(ExtraData) then) =
      _$ExtraDataCopyWithImpl<$Res, ExtraData>;
  @useResult
  $Res call(
      {String? hd,
      String? aud,
      String? azp,
      int? exp,
      int? iat,
      String? iss,
      String? sub,
      String? name,
      String? email,
      String? locale,
      String? picture,
      @JsonKey(name: "given_name") String? givenName,
      @JsonKey(name: "family_name") String? familyName,
      @JsonKey(name: "email_verifed") bool? emailVerified});
}

/// @nodoc
class _$ExtraDataCopyWithImpl<$Res, $Val extends ExtraData>
    implements $ExtraDataCopyWith<$Res> {
  _$ExtraDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hd = freezed,
    Object? aud = freezed,
    Object? azp = freezed,
    Object? exp = freezed,
    Object? iat = freezed,
    Object? iss = freezed,
    Object? sub = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? locale = freezed,
    Object? picture = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_value.copyWith(
      hd: freezed == hd
          ? _value.hd
          : hd // ignore: cast_nullable_to_non_nullable
              as String?,
      aud: freezed == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String?,
      azp: freezed == azp
          ? _value.azp
          : azp // ignore: cast_nullable_to_non_nullable
              as String?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int?,
      iat: freezed == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int?,
      iss: freezed == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String?,
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExtraDataCopyWith<$Res> implements $ExtraDataCopyWith<$Res> {
  factory _$$_ExtraDataCopyWith(
          _$_ExtraData value, $Res Function(_$_ExtraData) then) =
      __$$_ExtraDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? hd,
      String? aud,
      String? azp,
      int? exp,
      int? iat,
      String? iss,
      String? sub,
      String? name,
      String? email,
      String? locale,
      String? picture,
      @JsonKey(name: "given_name") String? givenName,
      @JsonKey(name: "family_name") String? familyName,
      @JsonKey(name: "email_verifed") bool? emailVerified});
}

/// @nodoc
class __$$_ExtraDataCopyWithImpl<$Res>
    extends _$ExtraDataCopyWithImpl<$Res, _$_ExtraData>
    implements _$$_ExtraDataCopyWith<$Res> {
  __$$_ExtraDataCopyWithImpl(
      _$_ExtraData _value, $Res Function(_$_ExtraData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hd = freezed,
    Object? aud = freezed,
    Object? azp = freezed,
    Object? exp = freezed,
    Object? iat = freezed,
    Object? iss = freezed,
    Object? sub = freezed,
    Object? name = freezed,
    Object? email = freezed,
    Object? locale = freezed,
    Object? picture = freezed,
    Object? givenName = freezed,
    Object? familyName = freezed,
    Object? emailVerified = freezed,
  }) {
    return _then(_$_ExtraData(
      hd: freezed == hd
          ? _value.hd
          : hd // ignore: cast_nullable_to_non_nullable
              as String?,
      aud: freezed == aud
          ? _value.aud
          : aud // ignore: cast_nullable_to_non_nullable
              as String?,
      azp: freezed == azp
          ? _value.azp
          : azp // ignore: cast_nullable_to_non_nullable
              as String?,
      exp: freezed == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int?,
      iat: freezed == iat
          ? _value.iat
          : iat // ignore: cast_nullable_to_non_nullable
              as int?,
      iss: freezed == iss
          ? _value.iss
          : iss // ignore: cast_nullable_to_non_nullable
              as String?,
      sub: freezed == sub
          ? _value.sub
          : sub // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      picture: freezed == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String?,
      givenName: freezed == givenName
          ? _value.givenName
          : givenName // ignore: cast_nullable_to_non_nullable
              as String?,
      familyName: freezed == familyName
          ? _value.familyName
          : familyName // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExtraData implements _ExtraData {
  const _$_ExtraData(
      {this.hd,
      this.aud,
      this.azp,
      this.exp,
      this.iat,
      this.iss,
      this.sub,
      this.name,
      this.email,
      this.locale,
      this.picture,
      @JsonKey(name: "given_name") this.givenName,
      @JsonKey(name: "family_name") this.familyName,
      @JsonKey(name: "email_verifed") this.emailVerified});

  factory _$_ExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraDataFromJson(json);

  @override
  final String? hd;
  @override
  final String? aud;
  @override
  final String? azp;
  @override
  final int? exp;
  @override
  final int? iat;
  @override
  final String? iss;
  @override
  final String? sub;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? locale;
  @override
  final String? picture;
  @override
  @JsonKey(name: "given_name")
  final String? givenName;
  @override
  @JsonKey(name: "family_name")
  final String? familyName;
  @override
  @JsonKey(name: "email_verifed")
  final bool? emailVerified;

  @override
  String toString() {
    return 'ExtraData(hd: $hd, aud: $aud, azp: $azp, exp: $exp, iat: $iat, iss: $iss, sub: $sub, name: $name, email: $email, locale: $locale, picture: $picture, givenName: $givenName, familyName: $familyName, emailVerified: $emailVerified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExtraData &&
            (identical(other.hd, hd) || other.hd == hd) &&
            (identical(other.aud, aud) || other.aud == aud) &&
            (identical(other.azp, azp) || other.azp == azp) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.iat, iat) || other.iat == iat) &&
            (identical(other.iss, iss) || other.iss == iss) &&
            (identical(other.sub, sub) || other.sub == sub) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            (identical(other.givenName, givenName) ||
                other.givenName == givenName) &&
            (identical(other.familyName, familyName) ||
                other.familyName == familyName) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, hd, aud, azp, exp, iat, iss, sub,
      name, email, locale, picture, givenName, familyName, emailVerified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExtraDataCopyWith<_$_ExtraData> get copyWith =>
      __$$_ExtraDataCopyWithImpl<_$_ExtraData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraDataToJson(
      this,
    );
  }
}

abstract class _ExtraData implements ExtraData {
  const factory _ExtraData(
          {final String? hd,
          final String? aud,
          final String? azp,
          final int? exp,
          final int? iat,
          final String? iss,
          final String? sub,
          final String? name,
          final String? email,
          final String? locale,
          final String? picture,
          @JsonKey(name: "given_name") final String? givenName,
          @JsonKey(name: "family_name") final String? familyName,
          @JsonKey(name: "email_verifed") final bool? emailVerified}) =
      _$_ExtraData;

  factory _ExtraData.fromJson(Map<String, dynamic> json) =
      _$_ExtraData.fromJson;

  @override
  String? get hd;
  @override
  String? get aud;
  @override
  String? get azp;
  @override
  int? get exp;
  @override
  int? get iat;
  @override
  String? get iss;
  @override
  String? get sub;
  @override
  String? get name;
  @override
  String? get email;
  @override
  String? get locale;
  @override
  String? get picture;
  @override
  @JsonKey(name: "given_name")
  String? get givenName;
  @override
  @JsonKey(name: "family_name")
  String? get familyName;
  @override
  @JsonKey(name: "email_verifed")
  bool? get emailVerified;
  @override
  @JsonKey(ignore: true)
  _$$_ExtraDataCopyWith<_$_ExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}
