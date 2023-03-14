// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'task_apply_count_model.freezed.dart';
part 'task_apply_count_model.g.dart';

@freezed
class TaskApplyCountModel with _$TaskApplyCountModel {
  const factory TaskApplyCountModel({
    List<Count>? count,
  }) = _TaskApplyCountModel;

  factory TaskApplyCountModel.fromJson(Map<String, dynamic> json) =>
      _$TaskApplyCountModelFromJson(json);
}

@freezed
class Count with _$Count {
  const factory Count({
    @JsonKey(name: 'tasker_count') int? taskerCount,
  }) = _Count;

  factory Count.fromJson(Map<String, dynamic> json) => _$CountFromJson(json);
}
