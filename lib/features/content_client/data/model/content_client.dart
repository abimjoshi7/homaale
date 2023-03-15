import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'content_client.freezed.dart';
part 'content_client.g.dart';

@freezed
class ContentClient with _$ContentClient {
  const factory ContentClient({
    int? id,
    String? title,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    String? content,
    String? slug,
  }) = _ContentClient;

  factory ContentClient.fromJson(Map<String, dynamic> json) =>
      _$ContentClientFromJson(json);
}
