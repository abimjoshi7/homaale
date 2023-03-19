// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_client.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ContentClient _$ContentClientFromJson(Map<String, dynamic> json) {
  return _ContentClient.fromJson(json);
}

/// @nodoc
mixin _$ContentClient {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  bool? get hasdata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ContentClientCopyWith<ContentClient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentClientCopyWith<$Res> {
  factory $ContentClientCopyWith(
          ContentClient value, $Res Function(ContentClient) then) =
      _$ContentClientCopyWithImpl<$Res, ContentClient>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String? content,
      String? slug,
      bool? hasdata});
}

/// @nodoc
class _$ContentClientCopyWithImpl<$Res, $Val extends ContentClient>
    implements $ContentClientCopyWith<$Res> {
  _$ContentClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? content = freezed,
    Object? slug = freezed,
    Object? hasdata = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      hasdata: freezed == hasdata
          ? _value.hasdata
          : hasdata // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ContentClientCopyWith<$Res>
    implements $ContentClientCopyWith<$Res> {
  factory _$$_ContentClientCopyWith(
          _$_ContentClient value, $Res Function(_$_ContentClient) then) =
      __$$_ContentClientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String? content,
      String? slug,
      bool? hasdata});
}

/// @nodoc
class __$$_ContentClientCopyWithImpl<$Res>
    extends _$ContentClientCopyWithImpl<$Res, _$_ContentClient>
    implements _$$_ContentClientCopyWith<$Res> {
  __$$_ContentClientCopyWithImpl(
      _$_ContentClient _value, $Res Function(_$_ContentClient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? content = freezed,
    Object? slug = freezed,
    Object? hasdata = freezed,
  }) {
    return _then(_$_ContentClient(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      hasdata: freezed == hasdata
          ? _value.hasdata
          : hasdata // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ContentClient implements _ContentClient {
  const _$_ContentClient(
      {this.id,
      this.title,
      @JsonKey(name: 'created_at') this.createdAt,
      this.content,
      this.slug,
      this.hasdata});

  factory _$_ContentClient.fromJson(Map<String, dynamic> json) =>
      _$$_ContentClientFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  final String? content;
  @override
  final String? slug;
  @override
  final bool? hasdata;

  @override
  String toString() {
    return 'ContentClient(id: $id, title: $title, createdAt: $createdAt, content: $content, slug: $slug, hasdata: $hasdata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ContentClient &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.hasdata, hasdata) || other.hasdata == hasdata));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, title, createdAt, content, slug, hasdata);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ContentClientCopyWith<_$_ContentClient> get copyWith =>
      __$$_ContentClientCopyWithImpl<_$_ContentClient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ContentClientToJson(
      this,
    );
  }
}

abstract class _ContentClient implements ContentClient {
  const factory _ContentClient(
      {final int? id,
      final String? title,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      final String? content,
      final String? slug,
      final bool? hasdata}) = _$_ContentClient;

  factory _ContentClient.fromJson(Map<String, dynamic> json) =
      _$_ContentClient.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  String? get content;
  @override
  String? get slug;
  @override
  bool? get hasdata;
  @override
  @JsonKey(ignore: true)
  _$$_ContentClientCopyWith<_$_ContentClient> get copyWith =>
      throw _privateConstructorUsedError;
}
