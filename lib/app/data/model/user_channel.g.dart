// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChannel _$UserChannelFromJson(Map<String, dynamic> json) => UserChannel(
      messageChannelName: json['messageChannelName'] as String?,
      notifyChannelName: json['notifyChannelName'] as String?,
    );

Map<String, dynamic> _$UserChannelToJson(UserChannel instance) =>
    <String, dynamic>{
      'messageChannelName': instance.messageChannelName,
      'notifyChannelName': instance.notifyChannelName,
    };
