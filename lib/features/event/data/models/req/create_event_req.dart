// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'create_event_req.freezed.dart';
part 'create_event_req.g.dart';

@freezed
class CreateEventReq with _$CreateEventReq {
  const factory CreateEventReq({
    String? duration,
    @JsonKey(name: "entity_service") String? entityService,
    String? title,
    String? description,
    @JsonKey(name: "is_flexible") bool? isFlexible,
    DateTime? start,
    DateTime? end,
    @JsonKey(name: "guest_limit") int? guestLimit,
    @JsonKey(name: "is_active") bool? isActive,
    String? merchant,
  }) = _CreateEventReq;

  factory CreateEventReq.fromJson(Map<String, dynamic> json) =>
      _$CreateEventReqFromJson(json);
}
