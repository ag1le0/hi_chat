import 'package:json_annotation/json_annotation.dart';
import 'package:pea_chat/app/data/model/user.dart';

part 'friend_request_response.g.dart';

@JsonSerializable(explicitToJson: true)
class FriendRequestResponse {
  @JsonKey(name: 'id')
  int? _id;

  @JsonKey(name: 'user')
  User? _user;
  @JsonKey(name: 'friend')
  User? _friend;
  @JsonKey(name: 'friendNickName')
  String? _friendNickName;
  @JsonKey(name: 'content')
  String? _content;

  factory FriendRequestResponse.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FriendRequestResponseToJson(this);

  User? get user => _user;

  set user(User? value) {
    _user = value;
  }

  User? get friend => _friend;

  set friend(User? value) {
    _friend = value;
  }

  String? get friendNickName => _friendNickName;

  set friendNickName(String? value) {
    _friendNickName = value;
  }

  String? get content => _content;

  set content(String? value) {
    _content = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }

  FriendRequestResponse({
    int? id,
    User? user,
    User? friend,
    String? friendNickName,
    String? content,
  })  : _id = id,
        _user = user,
        _friend = friend,
        _friendNickName = friendNickName,
        _content = content;
}
