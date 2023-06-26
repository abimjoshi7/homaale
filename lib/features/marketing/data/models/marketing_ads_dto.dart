// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'marketing_ads_dto.freezed.dart';
part 'marketing_ads_dto.g.dart';

@freezed
class MarketingAdsDto with _$MarketingAdsDto {
  const factory MarketingAdsDto({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    @JsonKey(name: 'result') List<Ads>? result,
  }) = _MarketingAdsDto;

  factory MarketingAdsDto.fromJson(Map<String, dynamic> json) => _$MarketingAdsDtoFromJson(json);
}

@freezed
class Ads with _$Ads {
  const factory Ads({
    int? id,
    String? title,
    String? content,
    int? source,
    String? type,
    @JsonKey(name: 'is_closable') bool? isClosable,
    @JsonKey(name: 'mobile_shape') String? mobileShape,
    @JsonKey(name: 'web_shape') String? webShape,
    String? behaviour,
    String? image,
    @JsonKey(name: 'page_url') String? pageUrl,
    @JsonKey(name: 'redirect_url') String? redirectUrl,
    int? priority,
    @JsonKey(name: 'is_active') bool? isActive,
  }) = _Ads;

  factory Ads.fromJson(Map<String, dynamic> json) => _$AdsFromJson(json);
}
