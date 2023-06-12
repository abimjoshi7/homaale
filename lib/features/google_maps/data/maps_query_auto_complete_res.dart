import 'package:freezed_annotation/freezed_annotation.dart';
part 'maps_query_auto_complete_res.freezed.dart';
part 'maps_query_auto_complete_res.g.dart';

@freezed
class MapsQueryAutoCompleteRes with _$MapsQueryAutoCompleteRes {
  const factory MapsQueryAutoCompleteRes({
    String? description,
    List<MatchedSubstring>? matchedSubstrings,
    String? placeId,
    String? reference,
    StructuredFormatting? structuredFormatting,
    List<Term>? terms,
    List<String>? types,
  }) = _MapsQueryAutoCompleteRes;

  factory MapsQueryAutoCompleteRes.fromJson(Map<String, dynamic> json) =>
      _$MapsQueryAutoCompleteResFromJson(json);
}

@freezed
class MatchedSubstring with _$MatchedSubstring {
  const factory MatchedSubstring({
    int? length,
    int? offset,
  }) = _MatchedSubstring;

  factory MatchedSubstring.fromJson(Map<String, dynamic> json) =>
      _$MatchedSubstringFromJson(json);
}

@freezed
class StructuredFormatting with _$StructuredFormatting {
  const factory StructuredFormatting({
    String? mainText,
    List<MatchedSubstring>? mainTextMatchedSubstrings,
    String? secondaryText,
  }) = _StructuredFormatting;

  factory StructuredFormatting.fromJson(Map<String, dynamic> json) =>
      _$StructuredFormattingFromJson(json);
}

@freezed
class Term with _$Term {
  const factory Term({
    int? offset,
    String? value,
  }) = _Term;

  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}
