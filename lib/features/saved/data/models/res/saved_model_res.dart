// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'saved_model_res.freezed.dart';
part 'saved_model_res.g.dart';

@freezed
class SavedModelRes with _$SavedModelRes {
  const factory SavedModelRes({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    dynamic next,
    dynamic previous,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "result") List<Result>? result,
  }) = _SavedModelRes;

  factory SavedModelRes.fromJson(Map<String, dynamic> json) =>
      _$SavedModelResFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    String? user,
    String? type,
    @JsonKey(name: "data") dynamic data,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "object_id") String? objectId,
    @JsonKey(name: "content_type") int? contentType,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
