import 'package:dependencies/dependencies.dart';

part 'create_event_res.freezed.dart';
part 'create_event_res.g.dart';

@freezed
class CreateEventRes with _$CreateEventRes {
  const factory CreateEventRes({
    String? id,
    String? duration,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    String? title,
    String? description,
    @JsonKey(name: "is_flexible") bool? isFlexible,
    DateTime? start,
    DateTime? end,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "is_active") bool? isActive,
    String? merchant,
  }) = _CreateEventRes;

  factory CreateEventRes.fromJson(Map<String, dynamic> json) =>
      _$CreateEventResFromJson(json);
}
