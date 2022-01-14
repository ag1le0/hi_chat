import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:pea_chat/app/utils/extension.dart';

import 'media_data.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  int? _id;
  String? _username;
  String? _name;
  String? _chineseName;
  String? _nickName;
  String? _email;
  String? _callNumber;
  MediaResponse? _avatar;
  String? _bu;
  String? _cft;
  String? _factory;
  String? _department;
  String? _title;
  int? _level;
  bool? _friend;
  bool? _pwdExpired;
  DateTime? _pwdExpiredTime;
  String? _cardId;
  String? _ouCode;
  String? _ouName;
  String? _upperOuCode;
  String? _lowerOuCode;
  String? _allManagers;
  String? _siteAllManagers;
  String? _buALlManagers;
  DateTime? _hireDate;
  DateTime? _leaveDate;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  User({
    int? id,
    String? username,
    String? name,
    String? chineseName,
    String? nickName,
    String? email,
    String? callNumber,
    MediaResponse? avatar,
    String? bu,
    String? cft,
    String? factory,
    String? department,
    String? title,
    int? level,
    bool? friend,
    bool? pwdExpired,
    DateTime? pwdExpiredTime,
    String? cardId,
    String? ouCode,
    String? ouName,
    String? upperOuCode,
    String? lowerOuCode,
    String? allManagers,
    String? siteAllManagers,
    String? buALlManagers,
    DateTime? hireDate,
    DateTime? leaveDate,
  })  : _id = id,
        _username = username,
        _name = name,
        _chineseName = chineseName,
        _nickName = nickName,
        _email = email,
        _callNumber = callNumber,
        _avatar = avatar,
        _bu = bu,
        _cft = cft,
        _factory = factory,
        _department = department,
        _title = title,
        _level = level,
        _friend = friend,
        _pwdExpired = pwdExpired,
        _pwdExpiredTime = pwdExpiredTime,
        _cardId = cardId,
        _ouCode = ouCode,
        _ouName = ouName,
        _upperOuCode = upperOuCode,
        _lowerOuCode = lowerOuCode,
        _allManagers = allManagers,
        _siteAllManagers = siteAllManagers,
        _buALlManagers = buALlManagers,
        _hireDate = hireDate,
        _leaveDate = leaveDate;

  DateTime? get leaveDate => _leaveDate;

  set leaveDate(DateTime? value) {
    _leaveDate = value;
  }

  DateTime? get hireDate => _hireDate;

  set hireDate(DateTime? value) {
    _hireDate = value;
  }

  String? get buALlManagers => _buALlManagers;

  set buALlManagers(String? value) {
    _buALlManagers = value;
  }

  String? get siteAllManagers => _siteAllManagers;

  set siteAllManagers(String? value) {
    _siteAllManagers = value;
  }

  String? get allManagers => _allManagers;

  set allManagers(String? value) {
    _allManagers = value;
  }

  String? get lowerOuCode => _lowerOuCode;

  set lowerOuCode(String? value) {
    _lowerOuCode = value;
  }

  String? get upperOuCode => _upperOuCode;

  set upperOuCode(String? value) {
    _upperOuCode = value;
  }

  String? get ouName => _ouName;

  set ouName(String? value) {
    _ouName = value;
  }

  String? get ouCode => _ouCode;

  set ouCode(String? value) {
    _ouCode = value;
  }

  String? get cardId => _cardId;

  set cardId(String? value) {
    _cardId = value;
  }

  DateTime? get pwdExpiredTime => _pwdExpiredTime;

  set pwdExpiredTime(DateTime? value) {
    _pwdExpiredTime = value;
  }

  bool? get pwdExpired => _pwdExpired;

  set pwdExpired(bool? value) {
    _pwdExpired = value;
  }

  bool? get friend => _friend;

  set friend(bool? value) {
    _friend = value;
  }

  int? get level => _level;

  set level(int? value) {
    _level = value;
  }

  String? get title => _title;

  set title(String? value) {
    _title = value;
  }

  String? get department => _department;

  set department(String? value) {
    _department = value;
  }

  String? get factory => _factory;

  set factory(String? value) {
    _factory = value;
  }

  String? get cft => _cft;

  set cft(String? value) {
    _cft = value;
  }

  String? get bu => _bu;

  set bu(String? value) {
    _bu = value;
  }

  MediaResponse? get avatar => _avatar;

  set avatar(MediaResponse? value) {
    _avatar = value;
  }

  String? get callNumber => _callNumber;

  set callNumber(String? value) {
    _callNumber = value;
  }

  String? get email => _email;

  set email(String? value) {
    _email = value;
  }

  String? get nickName => _nickName;

  set nickName(String? value) {
    _nickName = value;
  }

  String? get chineseName => _chineseName;

  set chineseName(String? value) {
    _chineseName = value;
  }

  String? get name => _name;

  set name(String? value) {
    _name = value;
  }

  String? get username => _username;

  set username(String? value) {
    _username = value;
  }

  int? get id => _id;

  set id(int? value) {
    _id = value;
  }
}
