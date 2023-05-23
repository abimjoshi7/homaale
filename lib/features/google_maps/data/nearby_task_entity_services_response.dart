import 'package:cipher/features/task_entity_service/data/models/task_entity_service.dart';
import 'package:dependencies/dependencies.dart';

part 'nearby_task_entity_services_response.freezed.dart';
part 'nearby_task_entity_services_response.g.dart';

@freezed
class NearbyTaskEntityServiceResponseDTO
    with _$NearbyTaskEntityServiceResponseDTO {
  const factory NearbyTaskEntityServiceResponseDTO({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<TaskEntityService>? result,
  }) = _NearbyTaskEntityServiceResponseDTO;

  factory NearbyTaskEntityServiceResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$NearbyTaskEntityServiceResponseDTOFromJson(json);
}
