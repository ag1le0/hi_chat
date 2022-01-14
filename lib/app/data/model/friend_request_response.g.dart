// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friend_request_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendRequestResponse _$FriendRequestResponseFromJson(
        Map<String, dynamic> json) =>
    FriendRequestResponse(
      id: json['id'] as int?,
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      friend: json['friend'] != null ? User.fromJson(json['friend']) : null,
      friendNickName: json['friendNickName'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$FriendRequestResponseToJson(
        FriendRequestResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user?.toJson(),
      'friend': instance.friend?.toJson(),
      'friendNickName': instance.friendNickName,
      'content': instance.content,
    };
