import 'package:json_annotation/json_annotation.dart';

part 'map_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class MapResponse<T> {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'size')
  int? size;

  Map<String, T>? result;

  MapResponse({
    this.status,
    this.code,
    this.message,
    this.size,
    this.result,
  });

  factory MapResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$MapResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$MapResponseToJson(this, toJsonT);
}
