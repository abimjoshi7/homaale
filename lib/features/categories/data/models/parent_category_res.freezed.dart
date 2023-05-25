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
  $Res call({int? id, String? name, String? slug, String? icon});
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
    ) as $Val);
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
  $Res call({int? id, String? name, String? slug, String? icon});
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ParentCategoryRes implements _ParentCategoryRes {
  const _$_ParentCategoryRes({this.id, this.name, this.slug, this.icon});

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
  String toString() {
    return 'ParentCategoryRes(id: $id, name: $name, slug: $slug, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ParentCategoryRes &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, slug, icon);

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
      final String? icon}) = _$_ParentCategoryRes;

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
  @JsonKey(ignore: true)
  _$$_ParentCategoryResCopyWith<_$_ParentCategoryRes> get copyWith =>
      throw _privateConstructorUsedError;
}
