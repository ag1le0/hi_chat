import 'package:json_annotation/json_annotation.dart';

part 'notify_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NotifyResponse<T> {
  @JsonKey(name: 'title')
  String? title;

  T? body;

  factory NotifyResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$NotifyResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$NotifyResponseToJson(this, toJsonT);

  NotifyResponse({
    this.title,
    this.body,
  });
}
