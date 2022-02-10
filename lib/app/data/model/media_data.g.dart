// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaResponse _$MediaResponseFromJson(Map<String, dynamic> json) =>
    MediaResponse(
      udid: json['udid'] as String?,
      type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
      url: json['url'] as String?,
      thumbUrl: json['thumbUrl'] as String?,
    );

Map<String, dynamic> _$MediaResponseToJson(MediaResponse instance) =>
    <String, dynamic>{
      // 'thumbUrl': instance.thumbUrl,
      'url': instance.url,
      'type': _$TypeEnumMap[instance.type],
      'udid': instance.udid,
    };

const _$TypeEnumMap = {
  Type.IMAGE: 'IMAGE',
  Type.FILE: 'FILE',
};
