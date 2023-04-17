// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'saved_model.freezed.dart';
part 'saved_model.g.dart';

@freezed
class SavedModel with _$SavedModel {
  const factory SavedModel({
    String? model,
    @JsonKey(name: "object_id") String? objectId,
  }) = _SavedModel;

  factory SavedModel.fromJson(Map<String, dynamic> json) =>
      _$SavedModelFromJson(json);
}
