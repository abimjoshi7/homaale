// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parent_category_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ParentCategoryRes _$ParentCategoryResFromJson(Map<String, dynamic> json) {
  return _ParentCategoryRes.fromJson(json);
}

/// @nodoc
mixin _$ParentCategoryRes {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;
  @JsonKey(name: "extra_data")
  ExtraData? get extraData => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ParentCategoryResCopyWith<ParentCategoryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParentCategoryResCopyWith<$Res> {
  factory $ParentCategoryResCopyWith(
          ParentCategoryRes value, $Res Function(ParentCategoryRes) then) =
      _$ParentCategoryResCopyWithImpl<$Res, ParentCategoryRes>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? icon,
      @JsonKey(name: "extra_data") ExtraData? extraData});

  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class _$ParentCategoryResCopyWithImpl<$Res, $Val extends ParentCategoryRes>
    implements $ParentCategoryResCopyWith<$Res> {
  _$ParentCategoryResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? icon = freezed,
    Object? extraData = freezed,
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
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
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
abstract class _$$_ParentCategoryResCopyWith<$Res>
    implements $ParentCategoryResCopyWith<$Res> {
  factory _$$_ParentCategoryResCopyWith(_$_ParentCategoryRes value,
          $Res Function(_$_ParentCategoryRes) then) =
      __$$_ParentCategoryResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? slug,
      String? icon,
      @JsonKey(name: "extra_data") ExtraData? extraData});

  @override
  $ExtraDataCopyWith<$Res>? get extraData;
}

/// @nodoc
class __$$_ParentCategoryResCopyWithImpl<$Res>
    extends _$ParentCategoryResCopyWithImpl<$Res, _$_ParentCategoryRes>
    implements _$$_ParentCategoryResCopyWith<$Res> {
  __$$_ParentCategoryResCopyWithImpl(
      _$_ParentCategoryRes _value, $Res Function(_$_ParentCategoryRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? slug = freezed,
    Object? icon = freezed,
    Object? extraData = freezed,
  }) {
    return _then(_$_ParentCategoryRes(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as ExtraData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParentCategoryRes implements _ParentCategoryRes {
  const _$_ParentCategoryRes(
      {this.id,
      this.name,
      this.slug,
      this.icon,
      @JsonKey(name: "extra_data") this.extraData});

  factory _$_ParentCategoryRes.fromJson(Map<String, dynamic> json) =>
      _$$_ParentCategoryResFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? slug;
  @override
  final String? icon;
  @override
  @JsonKey(name: "extra_data")
  final ExtraData? extraData;

  @override
  String toString() {
    return 'ParentCategoryRes(id: $id, name: $name, slug: $slug, icon: $icon, extraData: $extraData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParentCategoryRes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.extraData, extraData) ||
                other.extraData == extraData));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, icon, extraData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ParentCategoryResCopyWith<_$_ParentCategoryRes> get copyWith =>
      __$$_ParentCategoryResCopyWithImpl<_$_ParentCategoryRes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ParentCategoryResToJson(
      this,
    );
  }
}

abstract class _ParentCategoryRes implements ParentCategoryRes {
  const factory _ParentCategoryRes(
          {final int? id,
          final String? name,
          final String? slug,
          final String? icon,
          @JsonKey(name: "extra_data") final ExtraData? extraData}) =
      _$_ParentCategoryRes;

  factory _ParentCategoryRes.fromJson(Map<String, dynamic> json) =
      _$_ParentCategoryRes.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get slug;
  @override
  String? get icon;
  @override
  @JsonKey(name: "extra_data")
  ExtraData? get extraData;
  @override
  @JsonKey(ignore: true)
  _$$_ParentCategoryResCopyWith<_$_ParentCategoryRes> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtraData _$ExtraDataFromJson(Map<String, dynamic> json) {
  return _ExtraData.fromJson(json);
}

/// @nodoc
mixin _$ExtraData {
  @JsonKey(name: "book_button_name")
  String? get bookButtonName => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;

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
      {@JsonKey(name: "book_button_name") String? bookButtonName, String? key});
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
    Object? bookButtonName = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      bookButtonName: freezed == bookButtonName
          ? _value.bookButtonName
          : bookButtonName // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {@JsonKey(name: "book_button_name") String? bookButtonName, String? key});
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
    Object? bookButtonName = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_ExtraData(
      bookButtonName: freezed == bookButtonName
          ? _value.bookButtonName
          : bookButtonName // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExtraData implements _ExtraData {
  const _$_ExtraData(
      {@JsonKey(name: "book_button_name") this.bookButtonName, this.key});

  factory _$_ExtraData.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraDataFromJson(json);

  @override
  @JsonKey(name: "book_button_name")
  final String? bookButtonName;
  @override
  final String? key;

  @override
  String toString() {
    return 'ExtraData(bookButtonName: $bookButtonName, key: $key)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExtraData &&
            (identical(other.bookButtonName, bookButtonName) ||
                other.bookButtonName == bookButtonName) &&
            (identical(other.key, key) || other.key == key));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bookButtonName, key);

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
      {@JsonKey(name: "book_button_name") final String? bookButtonName,
      final String? key}) = _$_ExtraData;

  factory _ExtraData.fromJson(Map<String, dynamic> json) =
      _$_ExtraData.fromJson;

  @override
  @JsonKey(name: "book_button_name")
  String? get bookButtonName;
  @override
  String? get key;
  @override
  @JsonKey(ignore: true)
  _$$_ExtraDataCopyWith<_$_ExtraData> get copyWith =>
      throw _privateConstructorUsedError;
}
