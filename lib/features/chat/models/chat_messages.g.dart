// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_messages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatMessages _$$_ChatMessagesFromJson(Map<String, dynamic> json) =>
    _$_ChatMessages(
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ChatMessagesToJson(_$_ChatMessages instance) =>
    <String, dynamic>{
      'messages': instance.messages,
    };

_$_Message _$$_MessageFromJson(Map<String, dynamic> json) => _$_Message(
      date: json['date'] as String?,
      senderId: json['senderId'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'date': instance.date,
      'senderId': instance.senderId,
      'text': instance.text,
    };
