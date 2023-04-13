// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_task_entity_services_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NearbyTaskEntityServiceReq _$$_NearbyTaskEntityServiceReqFromJson(
        Map<String, dynamic> json) =>
    _$_NearbyTaskEntityServiceReq(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      page: json['page'] as int?,
      pageSize: json['page_size'] as int?,
      radius: (json['radius'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_NearbyTaskEntityServiceReqToJson(
        _$_NearbyTaskEntityServiceReq instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'page': instance.page,
      'page_size': instance.pageSize,
      'radius': instance.radius,
    };
