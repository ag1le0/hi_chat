// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      id: json['id'] as int?,
      udid: json['udid'] as String?,
      group: json['group'] == null
          ? null
          : GroupResponse.fromJson(json['group'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : User.fromJson(json['author'] as Map<String, dynamic>),
      type: json['type'] as String?,
      publishedTime: json['publishedTime'] == null
          ? null
          : DateTimeUtils.fromBaseString(json['publishedTime'] as String),
      textMessage: json['textMessage'] == null
          ? null
          : TextMessage.fromJson(json['textMessage'] as Map<String, dynamic>),
      mediaMessage: json['mediaMessage'] == null
          ? null
          : MediaMessage.fromJson(json['mediaMessage'] as Map<String, dynamic>),
      reportMessage: '',
      alarmMessage: '',
      highlightMessage: '',
      replyMessage: '',
    );

Map<String, dynamic> _$MessageResponseToJson(MessageResponse instance) =>
    <String, dynamic>{
      'replyMessage': instance.replyMessage,
      'highlightMessage': instance.highlightMessage,
      'alarmMessage': instance.alarmMessage,
      'reportMessage': instance.reportMessage,
      'mediaMessage': instance.mediaMessage?.toJson(),
      'textMessage': instance.textMessage?.toJson(),
      'publishedTime': instance.publishedTime?.toBaseString(),
      'type': instance.type,
      'author': instance.author?.toJson(),
      'group': instance.group?.toJson(),
      'udid': instance.udid,
      'id': instance.id,
    };
