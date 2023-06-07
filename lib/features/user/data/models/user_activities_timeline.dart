import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_activities_timeline.freezed.dart';
part 'user_activities_timeline.g.dart';

@freezed
class UserActivitiesTimeline with _$UserActivitiesTimeline {
  const factory UserActivitiesTimeline({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    dynamic previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Result>? result,
  }) = _UserActivitiesTimeline;

  factory UserActivitiesTimeline.fromJson(Map<String, dynamic> json) =>
      _$UserActivitiesTimelineFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    @JsonKey(name: 'content_type') String? contentType,
    @JsonKey(name: 'action_time') DateTime? actionTime,
    @JsonKey(name: 'object_id') String? objectId,
    @JsonKey(name: 'object_repr') String? objectRepr,
    String? action,
    @JsonKey(name: 'change_message') String? changeMessage,
    String? user,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}
