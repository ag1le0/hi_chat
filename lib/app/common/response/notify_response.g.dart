// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notify_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifyResponse<T> _$NotifyResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NotifyResponse<T>(
      title: json['title'] as String?,
      body: _$nullableGenericFromJson(json['body'], fromJsonT),
    );

Map<String, dynamic> _$NotifyResponseToJson<T>(
  NotifyResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'title': instance.title,
      'body': _$nullableGenericToJson(instance.body, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
