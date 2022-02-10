import 'package:json_annotation/json_annotation.dart';
import 'package:pea_chat/app/data/model/media_data.dart';
import 'package:pea_chat/app/utils/utils.dart';

import 'message_response.dart';

part 'group_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GroupResponse {
  @JsonKey(name: 'id')
  int? _id;

  @JsonKey(name: 'name')
  String? _name;

  @JsonKey(name: 'uuid')
  String? _uuid;

  @JsonKey(name: 'avatar')
  MediaResponse? _avatar;

  @JsonKey(name: 'unreadMessageNumber')
  int? _unreadMessageNumber;

  @JsonKey(name: 'latestMessage')
  MessageResponse? _latestMessage;

  @JsonKey(name: 'messageNumber')
  int? _messageNumber;

  @JsonKey(name: 'followed')
  bool? _followed;

  @JsonKey(name: 'type')
  GroupType? _type;

  GroupResponse(
      {int? id,
      String? name,
      String? uuid,
      MediaResponse? avatar,
      int? unreadMessageNumber,
      MessageResponse? latestMessage,
      int? messageNumber,
      bool? followed,
      GroupType? type})
      : _id = id,
        _name = name,
        _uuid = uuid,
        _avatar = avatar,
        _unreadMessageNumber = unreadMessageNumber,
        _latestMessage = latestMessage,
        _messageNumber = messageNumber,
        _followed = followed,
        _type = type;

  factory GroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GroupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GroupResponseToJson(this);

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get uuid => _uuid;

  set udid(String? value) {
    _uuid = value;
  }

  MediaResponse? get avatar => _avatar;

  set avatar(MediaResponse? value) {
    _avatar = value;
  }

  int? get unreadMessageNumber => _unreadMessageNumber;

  set unreadMessageNumber(int? value) {
    _unreadMessageNumber = value;
  }

  MessageResponse? get latestMessage => _latestMessage;

  set latestMessage(MessageResponse? value) {
    _latestMessage = value;
  }

  int? get messageNumber => _messageNumber;

  set messageNumber(int? value) {
    _messageNumber = value;
  }

  bool? get followed => _followed;

  set followed(bool? value) {
    _followed = value;
  }

  GroupType? get type => _type;

  set type(GroupType? value) {
    _type = value;
  }
}

enum GroupType { FRIEND, NORMAL }
