// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaMessage _$MediaMessageFromJson(Map<String, dynamic> json) => MediaMessage(
      id: json['id'] as int?,
      media: json['media'] == null
          ? null
          : MediaResponse.fromJson(json['media'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MediaMessageToJson(MediaMessage instance) =>
    <String, dynamic>{
      'media': instance.media?.toJson(),
      'id': instance.id,
    };
