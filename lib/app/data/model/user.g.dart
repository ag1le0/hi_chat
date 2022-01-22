// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int?,
      username: json['username'] as String?,
      name: json['name'] as String?,
      chineseName: json['chineseName'] as String?,
      nickName: json['nickName'] as String?,
      email: json['email'] as String?,
      callNumber: json['callNumber'] as String?,
      avatar: json['avatar'] == null
          ? null
          : MediaResponse.fromJson(json['avatar'] as Map<String, dynamic>),
      bu: json['bu'] as String?,
      cft: json['cft'] as String?,
      factory: json['factory'] as String?,
      department: json['department'] as String?,
      title: json['title'] as String?,
      level: json['level'],
      friend: json['friend'] as bool?,
      pwdExpired: json['pwdExpired'] as bool?,
      pwdExpiredTime: json['pwdExpiredTime'] == null
          ? null
          : DateTimeUtils.fromBaseString(json['pwdExpiredTime'] as String),
      cardId: json['cardId'] as String?,
      ouCode: json['ouCode'] as String?,
      ouName: json['ouName'] as String?,
      upperOuCode: json['upperOuCode'] as String?,
      lowerOuCode: json['lowerOuCode'] as String?,
      allManagers: json['allManagers'] as String?,
      siteAllManagers: json['siteAllManagers'] as String?,
      buALlManagers: json['buALlManagers'] as String?,
      hireDate: json['hireDate'] == null
          ? null
          : DateTimeUtils.fromBaseString(json['hireDate'] as String),
      leaveDate: json['leaveDate'] == null
          ? null
          : DateTimeUtils.fromBaseString(json['leaveDate'] as String),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'leaveDate': instance.leaveDate?.toBaseString(),
      'hireDate': instance.hireDate?.toBaseString(),
      'buALlManagers': instance.buALlManagers,
      'siteAllManagers': instance.siteAllManagers,
      'allManagers': instance.allManagers,
      'lowerOuCode': instance.lowerOuCode,
      'upperOuCode': instance.upperOuCode,
      'ouName': instance.ouName,
      'ouCode': instance.ouCode,
      'cardId': instance.cardId,
      'pwdExpiredTime': instance.pwdExpiredTime?.toBaseString(),
      'pwdExpired': instance.pwdExpired,
      'friend': instance.friend,
      'level': instance.level,
      'title': instance.title,
      'department': instance.department,
      'factory': instance.factory,
      'cft': instance.cft,
      'bu': instance.bu,
      'avatar': instance.avatar?.toJson(),
      'callNumber': instance.callNumber,
      'email': instance.email,
      'nickName': instance.nickName,
      'chineseName': instance.chineseName,
      'name': instance.name,
      'username': instance.username,
      'id': instance.id,
    };
