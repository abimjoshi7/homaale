// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_cancel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingCancelModel _$$_BookingCancelModelFromJson(
        Map<String, dynamic> json) =>
    _$_BookingCancelModel(
      cancellationReason: json['cancellation_reason'] as String?,
      cancellationDescription: json['cancellation_description'] as String?,
    );

Map<String, dynamic> _$$_BookingCancelModelToJson(
        _$_BookingCancelModel instance) =>
    <String, dynamic>{
      'cancellation_reason': instance.cancellationReason,
      'cancellation_description': instance.cancellationDescription,
    };
