// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopCategory _$TopCategoryFromJson(Map<String, dynamic> json) {
  return _TopCategory.fromJson(json);
}

/// @nodoc
mixin _$TopCategory {
  int? get id => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopCategoryCopyWith<TopCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopCategoryCopyWith<$Res> {
  factory $TopCategoryCopyWith(
          TopCategory value, $Res Function(TopCategory) then) =
      _$TopCategoryCopyWithImpl<$Res, TopCategory>;
  @useResult
  $Res call({int? id, String? category, String? slug, String? icon});
}

/// @nodoc
class _$TopCategoryCopyWithImpl<$Res, $Val extends TopCategory>
    implements $TopCategoryCopyWith<$Res> {
  _$TopCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? slug = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_TopCategoryCopyWith<$Res>
    implements $TopCategoryCopyWith<$Res> {
  factory _$$_TopCategoryCopyWith(
          _$_TopCategory value, $Res Function(_$_TopCategory) then) =
      __$$_TopCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? category, String? slug, String? icon});
}

/// @nodoc
class __$$_TopCategoryCopyWithImpl<$Res>
    extends _$TopCategoryCopyWithImpl<$Res, _$_TopCategory>
    implements _$$_TopCategoryCopyWith<$Res> {
  __$$_TopCategoryCopyWithImpl(
      _$_TopCategory _value, $Res Function(_$_TopCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? category = freezed,
    Object? slug = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$_TopCategory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
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
class _$_TopCategory implements _TopCategory {
  const _$_TopCategory({this.id, this.category, this.slug, this.icon});

  factory _$_TopCategory.fromJson(Map<String, dynamic> json) =>
      _$$_TopCategoryFromJson(json);

  @override
  final int? id;
  @override
  final String? category;
  @override
  final String? slug;
  @override
  final String? icon;

  @override
  String toString() {
    return 'TopCategory(id: $id, category: $category, slug: $slug, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, category, slug, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopCategoryCopyWith<_$_TopCategory> get copyWith =>
      __$$_TopCategoryCopyWithImpl<_$_TopCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopCategoryToJson(
      this,
    );
  }
}

abstract class _TopCategory implements TopCategory {
  const factory _TopCategory(
      {final int? id,
      final String? category,
      final String? slug,
      final String? icon}) = _$_TopCategory;

  factory _TopCategory.fromJson(Map<String, dynamic> json) =
      _$_TopCategory.fromJson;

  @override
  int? get id;
  @override
  String? get category;
  @override
  String? get slug;
  @override
  String? get icon;
  @override
  @JsonKey(ignore: true)
  _$$_TopCategoryCopyWith<_$_TopCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
