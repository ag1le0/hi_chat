import 'package:json_annotation/json_annotation.dart';

part 'media_data.g.dart';

@JsonSerializable(explicitToJson: true)
class MediaResponse {
  @JsonKey(name: 'udid')
  String? _udid;
  @JsonKey(name: 'type')
  Type? _type;
  @JsonKey(name: 'url')
  String? _url;
  // @JsonKey(name: 'thumbUrl')
  // String? _thumbUrl;

  MediaResponse({
    String? udid,
    Type? type,
    String? url,
    String? thumbUrl,
  })  : _udid = udid,
        _type = type,
        _url = url;
  // _thumbUrl = thumbUrl;

  //String? get thumbUrl => _thumbUrl;

  // set thumbUrl(String? value) {
  //   _thumbUrl = value;
  // }

  String? get url => _url;

  set url(String? value) {
    _url = value;
  }

  Type? get type => _type;

  set type(Type? value) {
    _type = value;
  }

  String? get udid => _udid;

  set udid(String? value) {
    _udid = value;
  }

  factory MediaResponse.fromJson(Map<String, dynamic> json) =>
      _$MediaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MediaResponseToJson(this);
}

enum Type { IMAGE, FILE }
