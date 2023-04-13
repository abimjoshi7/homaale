import 'package:dependencies/dependencies.dart';

part 'task_sub_category_model.freezed.dart';
part 'task_sub_category_model.g.dart';

@freezed
class TaskSubCategoryModel with _$TaskSubCategoryModel {
  const factory TaskSubCategoryModel({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: "page_size") int? pageSize,
    List<Result>? result,
  }) = _TaskSubCategoryModel;

  factory TaskSubCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TaskSubCategoryModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    String? name,
    int? level,
    dynamic icon,
    String? slug,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "media_limit") int? mediaLimit,
    int? parent,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
