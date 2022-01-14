import 'package:json_annotation/json_annotation.dart';
import 'package:pea_chat/app/data/model/media_message.dart';
import 'package:pea_chat/app/data/model/text_message.dart';
import 'package:pea_chat/app/data/model/user.dart';
import 'package:pea_chat/app/utils/extension.dart';

import 'group_response.dart';

part 'message_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageResponse {
  @JsonKey(name: 'id')
  int? _id;

  @JsonKey(name: 'udid')
  String? _udid;

  @JsonKey(name: 'group')
  GroupResponse? _group;

  @JsonKey(name: 'author')
  User? _author;

  @JsonKey(name: 'type')
  String? _type;

  @JsonKey(name: 'publishedTime')
  DateTime? _publishedTime;

  @JsonKey(name: 'textMessage')
  TextMessage? _textMessage;

  @JsonKey(name: 'mediaMessage')
  MediaMessage? _mediaMessage;

  @JsonKey(name: 'reportMessage')
  String? _reportMessage;

  @JsonKey(name: 'alarmMessage')
  String? _alarmMessage;

  @JsonKey(name: 'highlightMessage')
  String? _highlightMessage;

  @JsonKey(name: 'replyMessage')
  String? _replyMessage;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageResponseToJson(this);

  String? get replyMessage => _replyMessage;

  set replyMessage(String? value) {
    _replyMessage = value;
  }

  String? get highlightMessage => _highlightMessage;

  set highlightMessage(String? value) {
    _highlightMessage = value;
  }

  String? get alarmMessage => _alarmMessage;

  set alarmMessage(String? value) {
    _alarmMessage = value;
  }

  String? get reportMessage => _reportMessage;

  set reportMessage(String? value) {
    _reportMessage = value;
  }

  MediaMessage? get mediaMessage => _mediaMessage;

  set mediaMessage(MediaMessage? value) {
    _mediaMessage = value;
  }

  TextMessage? get textMessage => _textMessage;

  set textMessage(TextMessage? value) {
    _textMessage = value;
  }

  DateTime? get publishedTime => _publishedTime;

  set publishedTime(DateTime? value) {
    _publishedTime = value;
  }

  String? get type => _type;

  set type(String? value) {
    _type = value;
  }

  User? get author => _author;

  set author(User? value) {
    _author = value;
  }

  GroupResponse? get group => _group;

  set group(GroupResponse? value) {
    _group = value;
  }

  String? get udid => _udid;

  set udid(String? value) {
    _udid = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  MessageResponse({
    int? id,
    String? udid,
    GroupResponse? group,
    User? author,
    String? type,
    DateTime? publishedTime,
    TextMessage? textMessage,
    MediaMessage? mediaMessage,
    String? reportMessage,
    String? alarmMessage,
    String? highlightMessage,
    String? replyMessage,
  })  : _id = id,
        _udid = udid,
        _group = group,
        _author = author,
        _type = type,
        _publishedTime = publishedTime,
        _textMessage = textMessage,
        _mediaMessage = mediaMessage,
        _reportMessage = reportMessage,
        _alarmMessage = alarmMessage,
        _highlightMessage = highlightMessage,
        _replyMessage = replyMessage;

  @override
  String toString() {
    return 'MessageResponse{_id: $_id, _udid: $_udid, _group: $_group, _author: $_author, _type: $_type, _publishedTime: $_publishedTime, _textMessage: $_textMessage, _mediaMessage: ${_mediaMessage.toString()}, _reportMessage: $_reportMessage, _alarmMessage: $_alarmMessage, _highlightMessage: $_highlightMessage, _replyMessage: $_replyMessage}';
  }
}
