// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RatingRequestDto _$$_RatingRequestDtoFromJson(Map<String, dynamic> json) =>
    _$_RatingRequestDto(
      rating: json['rating'] as int?,
      task: json['task'] as String?,
      review: json['review'] as String?,
    );

Map<String, dynamic> _$$_RatingRequestDtoToJson(_$_RatingRequestDto instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'task': instance.task,
      'review': instance.review,
    };
