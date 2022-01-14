import 'package:json_annotation/json_annotation.dart';

part 'list_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ListResponse<T> {
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'code')
  String? code;
  @JsonKey(name: 'message')
  String? message;
  @JsonKey(name: 'size')
  int? size;
  @JsonKey(name: 'data')
  List<T>? result;

  ListResponse({
    this.status,
    this.code,
    this.message,
    this.size,
    this.result,
  });

  factory ListResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$ListResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ListResponseToJson(this, toJsonT);
}
