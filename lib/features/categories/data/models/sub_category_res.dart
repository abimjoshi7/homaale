
import 'package:dependencies/dependencies.dart';

part 'sub_category_res.freezed.dart';
part 'sub_category_res.g.dart';

@freezed
class SubCategoryRes with _$SubCategoryRes {
    const factory SubCategoryRes({
        String? id,
        String? title,
        bool? isActive,
        bool? isVerified,
        Category? category,
        List<dynamic>? images,
        List<dynamic>? requiredDocuments,
    }) = _SubCategoryRes;

    factory SubCategoryRes.fromJson(Map<String, dynamic> json) => _$SubCategoryResFromJson(json);
}

@freezed
class Category with _$Category {
    const factory Category({
        int? id,
        String? name,
        int? level,
        String? slug,
    }) = _Category;

    factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
