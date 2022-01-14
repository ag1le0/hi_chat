import 'package:json_annotation/json_annotation.dart';

part 'text_message.g.dart';

@JsonSerializable(explicitToJson: true)
class TextMessage {
  @JsonKey(name: 'id')
  int? _id;

  @JsonKey(name: 'text')
  String? _text;

  factory TextMessage.fromJson(Map<String, dynamic> json) =>
      _$TextMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TextMessageToJson(this);

  TextMessage({
    int? id,
    String? text,
  })  : _id = id,
        _text = text;

  String? get text => _text;

  set text(String? value) {
    _text = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }
}
