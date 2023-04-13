import 'package:dependencies/dependencies.dart';

part 'nearby_task_entity_services_req.freezed.dart';
part 'nearby_task_entity_services_req.g.dart';
@immutable
@freezed
class NearbyTaskEntityServiceReq with _$NearbyTaskEntityServiceReq {
  const factory NearbyTaskEntityServiceReq({
    double? latitude,
    double? longitude,
    int? page,
    @JsonKey(name: 'page_size') int? pageSize,
    double? radius,
  }) = _NearbyTaskEntityServiceReq;

	 factory NearbyTaskEntityServiceReq.fromJson(Map<String, Object?> json)
      => _$NearbyTaskEntityServiceReqFromJson(json);

}
