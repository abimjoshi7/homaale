// To parse this JSON data, do
//
//     final taskEntityServiceReq = taskEntityServiceReqFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'task_entity_service_req.freezed.dart';
part 'task_entity_service_req.g.dart';

@freezed
class TaskEntityServiceReq with _$TaskEntityServiceReq {
  const factory TaskEntityServiceReq({
    String? owner,
    String? title,
    String? description,
    List<String?>? highlights,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "budget_from") double? budgetFrom,
    @JsonKey(name: "budget_to") double? budgetTo,
    @JsonKey(name: "start_date") String? startDate,
    @JsonKey(name: "end_date") String? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    @JsonKey(name: "share_location") bool? shareLocation,
    @JsonKey(name: "is_negotiable") bool? isNegotiable,
    int? revisions,
    @JsonKey(name: "recursion_type") String? recursionType,
    String? location,
    @JsonKey(name: "is_professional") bool? isProfessional,
    @JsonKey(name: "is_online") bool? isOnline,
    @JsonKey(name: "is_requested") bool? isRequested,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_value") String? discountValue,
    @JsonKey(name: "extra_data") List<String?>? extraData,
    @JsonKey(name: "no_of_reservation") int? noOfReservation,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "needs_approval") bool? needsApproval,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    String? service,
    String? event,
    int? city,
    String? currency,
    int? avatar,
    List<int>? images,
    List<int>? videos,
  }) = _TaskEntityServiceReq;

  factory TaskEntityServiceReq.fromJson(Map<String, dynamic> json) => _$TaskEntityServiceReqFromJson(json);
}
