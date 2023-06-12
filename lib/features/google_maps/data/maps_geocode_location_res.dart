import 'package:freezed_annotation/freezed_annotation.dart';

part 'maps_geocode_location_res.freezed.dart';
part 'maps_geocode_location_res.g.dart';

@freezed
class MapsGeocodeLocationRes with _$MapsGeocodeLocationRes {
  const factory MapsGeocodeLocationRes({
    List<AddressComponent>? addressComponents,
    String? formattedAddress,
    Geometry? geometry,
    String? placeId,
    List<String>? types,
  }) = _MapsGeocodeLocationRes;

  factory MapsGeocodeLocationRes.fromJson(Map<String, dynamic> json) =>
      _$MapsGeocodeLocationResFromJson(json);
}

@freezed
class AddressComponent with _$AddressComponent {
  const factory AddressComponent({
    String? longName,
    String? shortName,
    List<String>? types,
  }) = _AddressComponent;

  factory AddressComponent.fromJson(Map<String, dynamic> json) =>
      _$AddressComponentFromJson(json);
}

@freezed
class Geometry with _$Geometry {
  const factory Geometry({
    Bounds? bounds,
    Location? location,
    String? locationType,
    Bounds? viewport,
  }) = _Geometry;

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
}

@freezed
class Bounds with _$Bounds {
  const factory Bounds({
    Location? northeast,
    Location? southwest,
  }) = _Bounds;

  factory Bounds.fromJson(Map<String, dynamic> json) => _$BoundsFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    double? lat,
    double? lng,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
