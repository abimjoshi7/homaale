// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_person_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatPersonDetails _$$_ChatPersonDetailsFromJson(Map<String, dynamic> json) =>
    _$_ChatPersonDetails(
      id: json['id'] as String?,
      fullName: json['full_name'] as String?,
      profileImage: json['profile_image'] as String?,
      lastMessage: json['lastMessage'] as String?,
      groupName: json['groupName'] as String?,
      date: json['date'] as String?,
      isRead: json['isRead'] as bool?,
    );

Map<String, dynamic> _$$_ChatPersonDetailsToJson(
        _$_ChatPersonDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'profile_image': instance.profileImage,
      'lastMessage': instance.lastMessage,
      'groupName': instance.groupName,
      'date': instance.date,
      'isRead': instance.isRead,
    };
