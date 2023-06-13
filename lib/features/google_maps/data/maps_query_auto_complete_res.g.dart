// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'maps_query_auto_complete_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MapsQueryAutoCompleteRes _$$_MapsQueryAutoCompleteResFromJson(
        Map<String, dynamic> json) =>
    _$_MapsQueryAutoCompleteRes(
      description: json['description'] as String?,
      matchedSubstrings: (json['matchedSubstrings'] as List<dynamic>?)
          ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
          .toList(),
      placeId: json['placeId'] as String?,
      reference: json['reference'] as String?,
      structuredFormatting: json['structuredFormatting'] == null
          ? null
          : StructuredFormatting.fromJson(
              json['structuredFormatting'] as Map<String, dynamic>),
      terms: (json['terms'] as List<dynamic>?)
          ?.map((e) => Term.fromJson(e as Map<String, dynamic>))
          .toList(),
      types:
          (json['types'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_MapsQueryAutoCompleteResToJson(
        _$_MapsQueryAutoCompleteRes instance) =>
    <String, dynamic>{
      'description': instance.description,
      'matchedSubstrings': instance.matchedSubstrings,
      'placeId': instance.placeId,
      'reference': instance.reference,
      'structuredFormatting': instance.structuredFormatting,
      'terms': instance.terms,
      'types': instance.types,
    };

_$_MatchedSubstring _$$_MatchedSubstringFromJson(Map<String, dynamic> json) =>
    _$_MatchedSubstring(
      length: json['length'] as int?,
      offset: json['offset'] as int?,
    );

Map<String, dynamic> _$$_MatchedSubstringToJson(_$_MatchedSubstring instance) =>
    <String, dynamic>{
      'length': instance.length,
      'offset': instance.offset,
    };

_$_StructuredFormatting _$$_StructuredFormattingFromJson(
        Map<String, dynamic> json) =>
    _$_StructuredFormatting(
      mainText: json['mainText'] as String?,
      mainTextMatchedSubstrings:
          (json['mainTextMatchedSubstrings'] as List<dynamic>?)
              ?.map((e) => MatchedSubstring.fromJson(e as Map<String, dynamic>))
              .toList(),
      secondaryText: json['secondaryText'] as String?,
    );

Map<String, dynamic> _$$_StructuredFormattingToJson(
        _$_StructuredFormatting instance) =>
    <String, dynamic>{
      'mainText': instance.mainText,
      'mainTextMatchedSubstrings': instance.mainTextMatchedSubstrings,
      'secondaryText': instance.secondaryText,
    };

_$_Term _$$_TermFromJson(Map<String, dynamic> json) => _$_Term(
      offset: json['offset'] as int?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$_TermToJson(_$_Term instance) => <String, dynamic>{
      'offset': instance.offset,
      'value': instance.value,
    };
