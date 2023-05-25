import 'package:dependencies/dependencies.dart';

part 'parent_category_res.freezed.dart';
part 'parent_category_res.g.dart';

@freezed
class ParentCategoryRes with _$ParentCategoryRes {
  const factory ParentCategoryRes({
    int? id,
    String? name,
    String? slug,
    String? icon,
  }) = _ParentCategoryRes;

  factory ParentCategoryRes.fromJson(Map<String, dynamic> json) =>
      _$ParentCategoryResFromJson(json);
}

