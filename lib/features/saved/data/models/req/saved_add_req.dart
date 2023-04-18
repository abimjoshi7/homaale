// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'saved_add_req.freezed.dart';
part 'saved_add_req.g.dart';

@freezed
class SavedAddReq with _$SavedAddReq {
  const factory SavedAddReq({
    String? model,
    @JsonKey(name: "object_id") String? objectId,
  }) = _SavedModel;

  factory SavedAddReq.fromJson(Map<String, dynamic> json) =>
      _$SavedAddReqFromJson(json);
}
