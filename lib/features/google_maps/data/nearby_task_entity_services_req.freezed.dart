// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_task_entity_services_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NearbyTaskEntityServiceReq _$NearbyTaskEntityServiceReqFromJson(
    Map<String, dynamic> json) {
  return _NearbyTaskEntityServiceReq.fromJson(json);
}

/// @nodoc
mixin _$NearbyTaskEntityServiceReq {
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  double? get radius => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyTaskEntityServiceReqCopyWith<NearbyTaskEntityServiceReq>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyTaskEntityServiceReqCopyWith<$Res> {
  factory $NearbyTaskEntityServiceReqCopyWith(NearbyTaskEntityServiceReq value,
          $Res Function(NearbyTaskEntityServiceReq) then) =
      _$NearbyTaskEntityServiceReqCopyWithImpl<$Res,
          NearbyTaskEntityServiceReq>;
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      int? page,
      @JsonKey(name: 'page_size') int? pageSize,
      double? radius});
}

/// @nodoc
class _$NearbyTaskEntityServiceReqCopyWithImpl<$Res,
        $Val extends NearbyTaskEntityServiceReq>
    implements $NearbyTaskEntityServiceReqCopyWith<$Res> {
  _$NearbyTaskEntityServiceReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? radius = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NearbyTaskEntityServiceReqCopyWith<$Res>
    implements $NearbyTaskEntityServiceReqCopyWith<$Res> {
  factory _$$_NearbyTaskEntityServiceReqCopyWith(
          _$_NearbyTaskEntityServiceReq value,
          $Res Function(_$_NearbyTaskEntityServiceReq) then) =
      __$$_NearbyTaskEntityServiceReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? latitude,
      double? longitude,
      int? page,
      @JsonKey(name: 'page_size') int? pageSize,
      double? radius});
}

/// @nodoc
class __$$_NearbyTaskEntityServiceReqCopyWithImpl<$Res>
    extends _$NearbyTaskEntityServiceReqCopyWithImpl<$Res,
        _$_NearbyTaskEntityServiceReq>
    implements _$$_NearbyTaskEntityServiceReqCopyWith<$Res> {
  __$$_NearbyTaskEntityServiceReqCopyWithImpl(
      _$_NearbyTaskEntityServiceReq _value,
      $Res Function(_$_NearbyTaskEntityServiceReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? radius = freezed,
  }) {
    return _then(_$_NearbyTaskEntityServiceReq(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      radius: freezed == radius
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NearbyTaskEntityServiceReq implements _NearbyTaskEntityServiceReq {
  const _$_NearbyTaskEntityServiceReq(
      {this.latitude,
      this.longitude,
      this.page = 1,
      @JsonKey(name: 'page_size') this.pageSize = 10,
      this.radius = 10000});

  factory _$_NearbyTaskEntityServiceReq.fromJson(Map<String, dynamic> json) =>
      _$$_NearbyTaskEntityServiceReqFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  @JsonKey()
  final int? page;
  @override
  @JsonKey(name: 'page_size')
  final int? pageSize;
  @override
  @JsonKey()
  final double? radius;

  @override
  String toString() {
    return 'NearbyTaskEntityServiceReq(latitude: $latitude, longitude: $longitude, page: $page, pageSize: $pageSize, radius: $radius)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NearbyTaskEntityServiceReq &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.radius, radius) || other.radius == radius));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, latitude, longitude, page, pageSize, radius);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NearbyTaskEntityServiceReqCopyWith<_$_NearbyTaskEntityServiceReq>
      get copyWith => __$$_NearbyTaskEntityServiceReqCopyWithImpl<
          _$_NearbyTaskEntityServiceReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NearbyTaskEntityServiceReqToJson(
      this,
    );
  }
}

abstract class _NearbyTaskEntityServiceReq
    implements NearbyTaskEntityServiceReq {
  const factory _NearbyTaskEntityServiceReq(
      {final double? latitude,
      final double? longitude,
      final int? page,
      @JsonKey(name: 'page_size') final int? pageSize,
      final double? radius}) = _$_NearbyTaskEntityServiceReq;

  factory _NearbyTaskEntityServiceReq.fromJson(Map<String, dynamic> json) =
      _$_NearbyTaskEntityServiceReq.fromJson;

  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get page;
  @override
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @override
  double? get radius;
  @override
  @JsonKey(ignore: true)
  _$$_NearbyTaskEntityServiceReqCopyWith<_$_NearbyTaskEntityServiceReq>
      get copyWith => throw _privateConstructorUsedError;
}
