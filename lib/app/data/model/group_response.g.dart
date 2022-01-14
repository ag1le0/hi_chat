// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GroupResponse _$GroupResponseFromJson(Map<String, dynamic> json) =>
    GroupResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      uuid: json['uuid'] as String?,
      avatar: json['avatar'] == null
          ? null
          : MediaResponse.fromJson(json['avatar'] as Map<String, dynamic>),
      unreadMessageNumber: json['unreadMessageNumber'] as int?,
      latestMessage: json['latestMessage'] == null
          ? null
          : MessageResponse.fromJson(
              json['latestMessage'] as Map<String, dynamic>),
      messageNumber: json['messageNumber'] as int?,
      followed: json['followed'] as bool?,
    );

Map<String, dynamic> _$GroupResponseToJson(GroupResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'uuid': instance.uuid,
      'avatar': instance.avatar?.toJson(),
      'unreadMessageNumber': instance.unreadMessageNumber,
      'latestMessage': instance.latestMessage?.toJson(),
      'messageNumber': instance.messageNumber,
      'followed': instance.followed,
    };
