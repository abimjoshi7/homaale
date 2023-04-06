import 'package:dependencies/dependencies.dart';

part 'professional_service_model.freezed.dart';
part 'professional_service_model.g.dart';

@freezed
class ProfessionalServiceModel with _$ProfessionalServiceModel {
  const factory ProfessionalServiceModel({
    int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    int? pageSize,
    List<Result>? result,
  }) = _ProfessionalServiceModel;

  factory ProfessionalServiceModel.fromJson(Map<String, dynamic> json) =>
      _$ProfessionalServiceModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    String? id,
    Category? category,
    List<Image>? images,
    List<Image>? videos,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    bool? isActive,
    String? title,
    String? description,
    bool? isVerified,
    int? viewsCount,
    String? slug,
    String? metaTitle,
    String? metaDescription,
    String? metaKeyword,
    String? createdBy,
    List<dynamic>? views,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class Category with _$Category {
  const factory Category({
    int? id,
    String? name,
    String? slug,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

@freezed
class Image with _$Image {
  const factory Image({
    int? id,
    String? name,
    String? size,
    String? mediaType,
    String? media,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
