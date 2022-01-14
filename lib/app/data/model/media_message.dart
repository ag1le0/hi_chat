import 'package:json_annotation/json_annotation.dart';

import 'media_data.dart';

part 'media_message.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaMessage {
  @JsonKey(name: 'id')
  int? _id;

  @JsonKey(name: 'media')
  MediaResponse? _media;

  factory MediaMessage.fromJson(Map<String, dynamic> json) =>
      _$MediaMessageFromJson(json);

  Map<String, dynamic> toJson() => _$MediaMessageToJson(this);

  MediaMessage({
    int? id,
    MediaResponse? media,
  })  : _id = id,
        _media = media;

  MediaResponse? get media => _media;

  set media(MediaResponse? value) {
    _media = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }
}
