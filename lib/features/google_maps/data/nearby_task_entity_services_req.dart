import 'package:dependencies/dependencies.dart';

part 'nearby_task_entity_services_req.freezed.dart';
part 'nearby_task_entity_services_req.g.dart';

@immutable
@freezed
class NearbyTaskEntityServiceReq with _$NearbyTaskEntityServiceReq {
  const factory NearbyTaskEntityServiceReq({
    double? latitude,
    double? longitude,
    @Default(1) int? page,
    @Default(10) @JsonKey(name: 'page_size') int? pageSize,
    @Default(10000) double? radius,
  }) = _NearbyTaskEntityServiceReq;

  factory NearbyTaskEntityServiceReq.fromJson(Map<String, Object?> json) =>
      _$NearbyTaskEntityServiceReqFromJson(json);
}
