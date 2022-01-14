import 'package:json_annotation/json_annotation.dart';

part 'user_channel.g.dart';

@JsonSerializable(explicitToJson: true)
class UserChannel {
  String? _messageChannelName;

  String? _notifyChannelName;

  factory UserChannel.fromJson(Map<String, dynamic> json) =>
      _$UserChannelFromJson(json);

  Map<String, dynamic> toJson() => _$UserChannelToJson(this);

  String? get messageChannelName => _messageChannelName;

  set messageChannelName(String? value) {
    _messageChannelName = value;
  }

  String? get notifyChannelName => _notifyChannelName;

  set notifyChannelName(String? value) {
    _notifyChannelName = value;
  }

  UserChannel({
    String? messageChannelName,
    String? notifyChannelName,
  })  : _messageChannelName = messageChannelName,
        _notifyChannelName = notifyChannelName;
}
