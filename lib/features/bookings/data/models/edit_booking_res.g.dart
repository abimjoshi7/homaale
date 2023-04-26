// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_booking_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditBookingRes _$$_EditBookingResFromJson(Map<String, dynamic> json) =>
    _$_EditBookingRes(
      status: json['status'] as String?,
      description: json['description'] as String?,
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      budgetFrom: json['budgetFrom'] as String?,
      budgetTo: json['budgetTo'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      location: json['location'] as String?,
      isActive: json['isActive'] as bool?,
      extraData: json['extraData'],
      createdBy: json['createdBy'] as String?,
      bookingMerchant: json['bookingMerchant'],
      entityService: json['entityService'] as String?,
      city: json['city'] as int?,
      images: (json['images'] as List<dynamic>?)?.map((e) => e as int).toList(),
      videos: (json['videos'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

Map<String, dynamic> _$$_EditBookingResToJson(_$_EditBookingRes instance) =>
    <String, dynamic>{
      'status': instance.status,
      'description': instance.description,
      'requirements': instance.requirements,
      'budgetFrom': instance.budgetFrom,
      'budgetTo': instance.budgetTo,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'location': instance.location,
      'isActive': instance.isActive,
      'extraData': instance.extraData,
      'createdBy': instance.createdBy,
      'bookingMerchant': instance.bookingMerchant,
      'entityService': instance.entityService,
      'city': instance.city,
      'images': instance.images,
      'videos': instance.videos,
    };
