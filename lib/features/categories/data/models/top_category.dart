import 'package:dependencies/dependencies.dart';

part 'top_category.freezed.dart';
part 'top_category.g.dart';

@freezed
class TopCategory with _$TopCategory {
  const factory TopCategory({
    int? id,
    String? category,
    String? slug,
    String? icon,
  }) = _TopCategory;

  factory TopCategory.fromJson(Map<String, dynamic> json) => _$TopCategoryFromJson(json);
}
