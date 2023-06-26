// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketing_ads_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MarketingAdsDto _$$_MarketingAdsDtoFromJson(Map<String, dynamic> json) =>
    _$_MarketingAdsDto(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Ads.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MarketingAdsDtoToJson(_$_MarketingAdsDto instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Ads _$$_AdsFromJson(Map<String, dynamic> json) => _$_Ads(
      id: json['id'] as int?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      source: json['source'] as int?,
      type: json['type'] as String?,
      isClosable: json['is_closable'] as bool?,
      mobileShape: json['mobile_shape'] as String?,
      webShape: json['web_shape'] as String?,
      behaviour: json['behaviour'] as String?,
      image: json['image'] as String?,
      pageUrl: json['page_url'] as String?,
      redirectUrl: json['redirect_url'] as String?,
      priority: json['priority'] as int?,
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$$_AdsToJson(_$_Ads instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'source': instance.source,
      'type': instance.type,
      'is_closable': instance.isClosable,
      'mobile_shape': instance.mobileShape,
      'web_shape': instance.webShape,
      'behaviour': instance.behaviour,
      'image': instance.image,
      'page_url': instance.pageUrl,
      'redirect_url': instance.redirectUrl,
      'priority': instance.priority,
      'is_active': instance.isActive,
    };
