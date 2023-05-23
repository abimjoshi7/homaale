// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_task_entity_services_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NearbyTaskEntityServiceResponseDTO
    _$$_NearbyTaskEntityServiceResponseDTOFromJson(Map<String, dynamic> json) =>
        _$_NearbyTaskEntityServiceResponseDTO(
          totalPages: json['total_pages'] as int?,
          count: json['count'] as int?,
          current: json['current'] as int?,
          next: json['next'] as String?,
          previous: json['previous'] as String?,
          pageSize: json['page_size'] as int?,
          result: (json['result'] as List<dynamic>?)
              ?.map(
                  (e) => TaskEntityService.fromJson(e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_NearbyTaskEntityServiceResponseDTOToJson(
        _$_NearbyTaskEntityServiceResponseDTO instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };
