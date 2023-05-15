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
    @JsonKey(name: "extra_data") ExtraData? extraData,
  }) = _ParentCategoryRes;

  factory ParentCategoryRes.fromJson(Map<String, dynamic> json) =>
      _$ParentCategoryResFromJson(json);
}

@freezed
class ExtraData with _$ExtraData {
  const factory ExtraData({
    @JsonKey(name: "book_button_name") String? bookButtonName,
    String? key,
  }) = _ExtraData;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
}
