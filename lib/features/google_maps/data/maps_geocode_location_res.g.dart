// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_geocode_location_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapsGeocodeLocationRes _$$_MapsGeocodeLocationResFromJson(
        Map<String, dynamic> json) =>
    _$_MapsGeocodeLocationRes(
      addressComponents: (json['addressComponents'] as List<dynamic>?)
          ?.map((e) => AddressComponent.fromJson(e as Map<String, dynamic>))
          .toList(),
      formattedAddress: json['formattedAddress'] as String?,
      geometry: json['geometry'] == null
          ? null
          : Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      placeId: json['placeId'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MapsGeocodeLocationResToJson(
        _$_MapsGeocodeLocationRes instance) =>
    <String, dynamic>{
      'addressComponents': instance.addressComponents,
      'formattedAddress': instance.formattedAddress,
      'geometry': instance.geometry,
      'placeId': instance.placeId,
      'types': instance.types,
    };

_$_AddressComponent _$$_AddressComponentFromJson(Map<String, dynamic> json) =>
    _$_AddressComponent(
      longName: json['longName'] as String?,
      shortName: json['shortName'] as String?,
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_AddressComponentToJson(_$_AddressComponent instance) =>
    <String, dynamic>{
      'longName': instance.longName,
      'shortName': instance.shortName,
      'types': instance.types,
    };

_$_Geometry _$$_GeometryFromJson(Map<String, dynamic> json) => _$_Geometry(
      bounds: json['bounds'] == null
          ? null
          : Bounds.fromJson(json['bounds'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : Location.fromJson(json['location'] as Map<String, dynamic>),
      locationType: json['locationType'] as String?,
      viewport: json['viewport'] == null
          ? null
          : Bounds.fromJson(json['viewport'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_GeometryToJson(_$_Geometry instance) =>
    <String, dynamic>{
      'bounds': instance.bounds,
      'location': instance.location,
      'locationType': instance.locationType,
      'viewport': instance.viewport,
    };

_$_Bounds _$$_BoundsFromJson(Map<String, dynamic> json) => _$_Bounds(
      northeast: json['northeast'] == null
          ? null
          : Location.fromJson(json['northeast'] as Map<String, dynamic>),
      southwest: json['southwest'] == null
          ? null
          : Location.fromJson(json['southwest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BoundsToJson(_$_Bounds instance) => <String, dynamic>{
      'northeast': instance.northeast,
      'southwest': instance.southwest,
    };

_$_Location _$$_LocationFromJson(Map<String, dynamic> json) => _$_Location(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_LocationToJson(_$_Location instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
