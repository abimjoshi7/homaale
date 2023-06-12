// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'maps_geocode_location_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MapsGeocodeLocationRes _$MapsGeocodeLocationResFromJson(
    Map<String, dynamic> json) {
  return _MapsGeocodeLocationRes.fromJson(json);
}

/// @nodoc
mixin _$MapsGeocodeLocationRes {
  List<AddressComponent>? get addressComponents =>
      throw _privateConstructorUsedError;
  String? get formattedAddress => throw _privateConstructorUsedError;
  Geometry? get geometry => throw _privateConstructorUsedError;
  String? get placeId => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MapsGeocodeLocationResCopyWith<MapsGeocodeLocationRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapsGeocodeLocationResCopyWith<$Res> {
  factory $MapsGeocodeLocationResCopyWith(MapsGeocodeLocationRes value,
          $Res Function(MapsGeocodeLocationRes) then) =
      _$MapsGeocodeLocationResCopyWithImpl<$Res, MapsGeocodeLocationRes>;
  @useResult
  $Res call(
      {List<AddressComponent>? addressComponents,
      String? formattedAddress,
      Geometry? geometry,
      String? placeId,
      List<String>? types});

  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class _$MapsGeocodeLocationResCopyWithImpl<$Res,
        $Val extends MapsGeocodeLocationRes>
    implements $MapsGeocodeLocationResCopyWith<$Res> {
  _$MapsGeocodeLocationResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponents = freezed,
    Object? formattedAddress = freezed,
    Object? geometry = freezed,
    Object? placeId = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      addressComponents: freezed == addressComponents
          ? _value.addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GeometryCopyWith<$Res>? get geometry {
    if (_value.geometry == null) {
      return null;
    }

    return $GeometryCopyWith<$Res>(_value.geometry!, (value) {
      return _then(_value.copyWith(geometry: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MapsGeocodeLocationResCopyWith<$Res>
    implements $MapsGeocodeLocationResCopyWith<$Res> {
  factory _$$_MapsGeocodeLocationResCopyWith(_$_MapsGeocodeLocationRes value,
          $Res Function(_$_MapsGeocodeLocationRes) then) =
      __$$_MapsGeocodeLocationResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AddressComponent>? addressComponents,
      String? formattedAddress,
      Geometry? geometry,
      String? placeId,
      List<String>? types});

  @override
  $GeometryCopyWith<$Res>? get geometry;
}

/// @nodoc
class __$$_MapsGeocodeLocationResCopyWithImpl<$Res>
    extends _$MapsGeocodeLocationResCopyWithImpl<$Res,
        _$_MapsGeocodeLocationRes>
    implements _$$_MapsGeocodeLocationResCopyWith<$Res> {
  __$$_MapsGeocodeLocationResCopyWithImpl(_$_MapsGeocodeLocationRes _value,
      $Res Function(_$_MapsGeocodeLocationRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressComponents = freezed,
    Object? formattedAddress = freezed,
    Object? geometry = freezed,
    Object? placeId = freezed,
    Object? types = freezed,
  }) {
    return _then(_$_MapsGeocodeLocationRes(
      addressComponents: freezed == addressComponents
          ? _value._addressComponents
          : addressComponents // ignore: cast_nullable_to_non_nullable
              as List<AddressComponent>?,
      formattedAddress: freezed == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      geometry: freezed == geometry
          ? _value.geometry
          : geometry // ignore: cast_nullable_to_non_nullable
              as Geometry?,
      placeId: freezed == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MapsGeocodeLocationRes implements _MapsGeocodeLocationRes {
  const _$_MapsGeocodeLocationRes(
      {final List<AddressComponent>? addressComponents,
      this.formattedAddress,
      this.geometry,
      this.placeId,
      final List<String>? types})
      : _addressComponents = addressComponents,
        _types = types;

  factory _$_MapsGeocodeLocationRes.fromJson(Map<String, dynamic> json) =>
      _$$_MapsGeocodeLocationResFromJson(json);

  final List<AddressComponent>? _addressComponents;
  @override
  List<AddressComponent>? get addressComponents {
    final value = _addressComponents;
    if (value == null) return null;
    if (_addressComponents is EqualUnmodifiableListView)
      return _addressComponents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? formattedAddress;
  @override
  final Geometry? geometry;
  @override
  final String? placeId;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MapsGeocodeLocationRes(addressComponents: $addressComponents, formattedAddress: $formattedAddress, geometry: $geometry, placeId: $placeId, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MapsGeocodeLocationRes &&
            const DeepCollectionEquality()
                .equals(other._addressComponents, _addressComponents) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress) &&
            (identical(other.geometry, geometry) ||
                other.geometry == geometry) &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_addressComponents),
      formattedAddress,
      geometry,
      placeId,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MapsGeocodeLocationResCopyWith<_$_MapsGeocodeLocationRes> get copyWith =>
      __$$_MapsGeocodeLocationResCopyWithImpl<_$_MapsGeocodeLocationRes>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MapsGeocodeLocationResToJson(
      this,
    );
  }
}

abstract class _MapsGeocodeLocationRes implements MapsGeocodeLocationRes {
  const factory _MapsGeocodeLocationRes(
      {final List<AddressComponent>? addressComponents,
      final String? formattedAddress,
      final Geometry? geometry,
      final String? placeId,
      final List<String>? types}) = _$_MapsGeocodeLocationRes;

  factory _MapsGeocodeLocationRes.fromJson(Map<String, dynamic> json) =
      _$_MapsGeocodeLocationRes.fromJson;

  @override
  List<AddressComponent>? get addressComponents;
  @override
  String? get formattedAddress;
  @override
  Geometry? get geometry;
  @override
  String? get placeId;
  @override
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$_MapsGeocodeLocationResCopyWith<_$_MapsGeocodeLocationRes> get copyWith =>
      throw _privateConstructorUsedError;
}

AddressComponent _$AddressComponentFromJson(Map<String, dynamic> json) {
  return _AddressComponent.fromJson(json);
}

/// @nodoc
mixin _$AddressComponent {
  String? get longName => throw _privateConstructorUsedError;
  String? get shortName => throw _privateConstructorUsedError;
  List<String>? get types => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressComponentCopyWith<AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressComponentCopyWith<$Res> {
  factory $AddressComponentCopyWith(
          AddressComponent value, $Res Function(AddressComponent) then) =
      _$AddressComponentCopyWithImpl<$Res, AddressComponent>;
  @useResult
  $Res call({String? longName, String? shortName, List<String>? types});
}

/// @nodoc
class _$AddressComponentCopyWithImpl<$Res, $Val extends AddressComponent>
    implements $AddressComponentCopyWith<$Res> {
  _$AddressComponentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = freezed,
    Object? shortName = freezed,
    Object? types = freezed,
  }) {
    return _then(_value.copyWith(
      longName: freezed == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressComponentCopyWith<$Res>
    implements $AddressComponentCopyWith<$Res> {
  factory _$$_AddressComponentCopyWith(
          _$_AddressComponent value, $Res Function(_$_AddressComponent) then) =
      __$$_AddressComponentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? longName, String? shortName, List<String>? types});
}

/// @nodoc
class __$$_AddressComponentCopyWithImpl<$Res>
    extends _$AddressComponentCopyWithImpl<$Res, _$_AddressComponent>
    implements _$$_AddressComponentCopyWith<$Res> {
  __$$_AddressComponentCopyWithImpl(
      _$_AddressComponent _value, $Res Function(_$_AddressComponent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? longName = freezed,
    Object? shortName = freezed,
    Object? types = freezed,
  }) {
    return _then(_$_AddressComponent(
      longName: freezed == longName
          ? _value.longName
          : longName // ignore: cast_nullable_to_non_nullable
              as String?,
      shortName: freezed == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String?,
      types: freezed == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddressComponent implements _AddressComponent {
  const _$_AddressComponent(
      {this.longName, this.shortName, final List<String>? types})
      : _types = types;

  factory _$_AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$$_AddressComponentFromJson(json);

  @override
  final String? longName;
  @override
  final String? shortName;
  final List<String>? _types;
  @override
  List<String>? get types {
    final value = _types;
    if (value == null) return null;
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AddressComponent(longName: $longName, shortName: $shortName, types: $types)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressComponent &&
            (identical(other.longName, longName) ||
                other.longName == longName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            const DeepCollectionEquality().equals(other._types, _types));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, longName, shortName,
      const DeepCollectionEquality().hash(_types));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressComponentCopyWith<_$_AddressComponent> get copyWith =>
      __$$_AddressComponentCopyWithImpl<_$_AddressComponent>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressComponentToJson(
      this,
    );
  }
}

abstract class _AddressComponent implements AddressComponent {
  const factory _AddressComponent(
      {final String? longName,
      final String? shortName,
      final List<String>? types}) = _$_AddressComponent;

  factory _AddressComponent.fromJson(Map<String, dynamic> json) =
      _$_AddressComponent.fromJson;

  @override
  String? get longName;
  @override
  String? get shortName;
  @override
  List<String>? get types;
  @override
  @JsonKey(ignore: true)
  _$$_AddressComponentCopyWith<_$_AddressComponent> get copyWith =>
      throw _privateConstructorUsedError;
}

Geometry _$GeometryFromJson(Map<String, dynamic> json) {
  return _Geometry.fromJson(json);
}

/// @nodoc
mixin _$Geometry {
  Bounds? get bounds => throw _privateConstructorUsedError;
  Location? get location => throw _privateConstructorUsedError;
  String? get locationType => throw _privateConstructorUsedError;
  Bounds? get viewport => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GeometryCopyWith<Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeometryCopyWith<$Res> {
  factory $GeometryCopyWith(Geometry value, $Res Function(Geometry) then) =
      _$GeometryCopyWithImpl<$Res, Geometry>;
  @useResult
  $Res call(
      {Bounds? bounds,
      Location? location,
      String? locationType,
      Bounds? viewport});

  $BoundsCopyWith<$Res>? get bounds;
  $LocationCopyWith<$Res>? get location;
  $BoundsCopyWith<$Res>? get viewport;
}

/// @nodoc
class _$GeometryCopyWithImpl<$Res, $Val extends Geometry>
    implements $GeometryCopyWith<$Res> {
  _$GeometryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = freezed,
    Object? location = freezed,
    Object? locationType = freezed,
    Object? viewport = freezed,
  }) {
    return _then(_value.copyWith(
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Bounds?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res>? get bounds {
    if (_value.bounds == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.bounds!, (value) {
      return _then(_value.copyWith(bounds: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoundsCopyWith<$Res>? get viewport {
    if (_value.viewport == null) {
      return null;
    }

    return $BoundsCopyWith<$Res>(_value.viewport!, (value) {
      return _then(_value.copyWith(viewport: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GeometryCopyWith<$Res> implements $GeometryCopyWith<$Res> {
  factory _$$_GeometryCopyWith(
          _$_Geometry value, $Res Function(_$_Geometry) then) =
      __$$_GeometryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Bounds? bounds,
      Location? location,
      String? locationType,
      Bounds? viewport});

  @override
  $BoundsCopyWith<$Res>? get bounds;
  @override
  $LocationCopyWith<$Res>? get location;
  @override
  $BoundsCopyWith<$Res>? get viewport;
}

/// @nodoc
class __$$_GeometryCopyWithImpl<$Res>
    extends _$GeometryCopyWithImpl<$Res, _$_Geometry>
    implements _$$_GeometryCopyWith<$Res> {
  __$$_GeometryCopyWithImpl(
      _$_Geometry _value, $Res Function(_$_Geometry) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = freezed,
    Object? location = freezed,
    Object? locationType = freezed,
    Object? viewport = freezed,
  }) {
    return _then(_$_Geometry(
      bounds: freezed == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as Bounds?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location?,
      locationType: freezed == locationType
          ? _value.locationType
          : locationType // ignore: cast_nullable_to_non_nullable
              as String?,
      viewport: freezed == viewport
          ? _value.viewport
          : viewport // ignore: cast_nullable_to_non_nullable
              as Bounds?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Geometry implements _Geometry {
  const _$_Geometry(
      {this.bounds, this.location, this.locationType, this.viewport});

  factory _$_Geometry.fromJson(Map<String, dynamic> json) =>
      _$$_GeometryFromJson(json);

  @override
  final Bounds? bounds;
  @override
  final Location? location;
  @override
  final String? locationType;
  @override
  final Bounds? viewport;

  @override
  String toString() {
    return 'Geometry(bounds: $bounds, location: $location, locationType: $locationType, viewport: $viewport)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Geometry &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locationType, locationType) ||
                other.locationType == locationType) &&
            (identical(other.viewport, viewport) ||
                other.viewport == viewport));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, bounds, location, locationType, viewport);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      __$$_GeometryCopyWithImpl<_$_Geometry>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GeometryToJson(
      this,
    );
  }
}

abstract class _Geometry implements Geometry {
  const factory _Geometry(
      {final Bounds? bounds,
      final Location? location,
      final String? locationType,
      final Bounds? viewport}) = _$_Geometry;

  factory _Geometry.fromJson(Map<String, dynamic> json) = _$_Geometry.fromJson;

  @override
  Bounds? get bounds;
  @override
  Location? get location;
  @override
  String? get locationType;
  @override
  Bounds? get viewport;
  @override
  @JsonKey(ignore: true)
  _$$_GeometryCopyWith<_$_Geometry> get copyWith =>
      throw _privateConstructorUsedError;
}

Bounds _$BoundsFromJson(Map<String, dynamic> json) {
  return _Bounds.fromJson(json);
}

/// @nodoc
mixin _$Bounds {
  Location? get northeast => throw _privateConstructorUsedError;
  Location? get southwest => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoundsCopyWith<Bounds> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoundsCopyWith<$Res> {
  factory $BoundsCopyWith(Bounds value, $Res Function(Bounds) then) =
      _$BoundsCopyWithImpl<$Res, Bounds>;
  @useResult
  $Res call({Location? northeast, Location? southwest});

  $LocationCopyWith<$Res>? get northeast;
  $LocationCopyWith<$Res>? get southwest;
}

/// @nodoc
class _$BoundsCopyWithImpl<$Res, $Val extends Bounds>
    implements $BoundsCopyWith<$Res> {
  _$BoundsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_value.copyWith(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Location?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Location?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get northeast {
    if (_value.northeast == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.northeast!, (value) {
      return _then(_value.copyWith(northeast: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get southwest {
    if (_value.southwest == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.southwest!, (value) {
      return _then(_value.copyWith(southwest: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BoundsCopyWith<$Res> implements $BoundsCopyWith<$Res> {
  factory _$$_BoundsCopyWith(_$_Bounds value, $Res Function(_$_Bounds) then) =
      __$$_BoundsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Location? northeast, Location? southwest});

  @override
  $LocationCopyWith<$Res>? get northeast;
  @override
  $LocationCopyWith<$Res>? get southwest;
}

/// @nodoc
class __$$_BoundsCopyWithImpl<$Res>
    extends _$BoundsCopyWithImpl<$Res, _$_Bounds>
    implements _$$_BoundsCopyWith<$Res> {
  __$$_BoundsCopyWithImpl(_$_Bounds _value, $Res Function(_$_Bounds) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? northeast = freezed,
    Object? southwest = freezed,
  }) {
    return _then(_$_Bounds(
      northeast: freezed == northeast
          ? _value.northeast
          : northeast // ignore: cast_nullable_to_non_nullable
              as Location?,
      southwest: freezed == southwest
          ? _value.southwest
          : southwest // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Bounds implements _Bounds {
  const _$_Bounds({this.northeast, this.southwest});

  factory _$_Bounds.fromJson(Map<String, dynamic> json) =>
      _$$_BoundsFromJson(json);

  @override
  final Location? northeast;
  @override
  final Location? southwest;

  @override
  String toString() {
    return 'Bounds(northeast: $northeast, southwest: $southwest)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Bounds &&
            (identical(other.northeast, northeast) ||
                other.northeast == northeast) &&
            (identical(other.southwest, southwest) ||
                other.southwest == southwest));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, northeast, southwest);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      __$$_BoundsCopyWithImpl<_$_Bounds>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoundsToJson(
      this,
    );
  }
}

abstract class _Bounds implements Bounds {
  const factory _Bounds(
      {final Location? northeast, final Location? southwest}) = _$_Bounds;

  factory _Bounds.fromJson(Map<String, dynamic> json) = _$_Bounds.fromJson;

  @override
  Location? get northeast;
  @override
  Location? get southwest;
  @override
  @JsonKey(ignore: true)
  _$$_BoundsCopyWith<_$_Bounds> get copyWith =>
      throw _privateConstructorUsedError;
}

Location _$LocationFromJson(Map<String, dynamic> json) {
  return _Location.fromJson(json);
}

/// @nodoc
mixin _$Location {
  double? get lat => throw _privateConstructorUsedError;
  double? get lng => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationCopyWith<Location> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationCopyWith<$Res> {
  factory $LocationCopyWith(Location value, $Res Function(Location) then) =
      _$LocationCopyWithImpl<$Res, Location>;
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class _$LocationCopyWithImpl<$Res, $Val extends Location>
    implements $LocationCopyWith<$Res> {
  _$LocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_value.copyWith(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocationCopyWith<$Res> implements $LocationCopyWith<$Res> {
  factory _$$_LocationCopyWith(
          _$_Location value, $Res Function(_$_Location) then) =
      __$$_LocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double? lat, double? lng});
}

/// @nodoc
class __$$_LocationCopyWithImpl<$Res>
    extends _$LocationCopyWithImpl<$Res, _$_Location>
    implements _$$_LocationCopyWith<$Res> {
  __$$_LocationCopyWithImpl(
      _$_Location _value, $Res Function(_$_Location) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lat = freezed,
    Object? lng = freezed,
  }) {
    return _then(_$_Location(
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as double?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Location implements _Location {
  const _$_Location({this.lat, this.lng});

  factory _$_Location.fromJson(Map<String, dynamic> json) =>
      _$$_LocationFromJson(json);

  @override
  final double? lat;
  @override
  final double? lng;

  @override
  String toString() {
    return 'Location(lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Location &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lat, lng);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      __$$_LocationCopyWithImpl<_$_Location>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocationToJson(
      this,
    );
  }
}

abstract class _Location implements Location {
  const factory _Location({final double? lat, final double? lng}) = _$_Location;

  factory _Location.fromJson(Map<String, dynamic> json) = _$_Location.fromJson;

  @override
  double? get lat;
  @override
  double? get lng;
  @override
  @JsonKey(ignore: true)
  _$$_LocationCopyWith<_$_Location> get copyWith =>
      throw _privateConstructorUsedError;
}
