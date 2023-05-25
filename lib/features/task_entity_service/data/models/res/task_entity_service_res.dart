// To parse this JSON data, do
//
//     final taskEntityServiceRes = taskEntityServiceResFromJson(jsonString);

// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'task_entity_service_res.freezed.dart';
part 'task_entity_service_res.g.dart';

@freezed
class TaskEntityServiceRes with _$TaskEntityServiceRes {
  const factory TaskEntityServiceRes({
    String? id,
    String? owner,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    String? description,
    List<String?>? highlights,
    @JsonKey(name: "budget_type") String? budgetType,
    @JsonKey(name: "budget_from") String? budgetFrom,
    @JsonKey(name: "budget_to") String? budgetTo,
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
    @JsonKey(name: "no_of_reservation") int? noOfReservation,
    @JsonKey(name: "is_active") bool? isActive,
    @JsonKey(name: "needs_approval") bool? needsApproval,
    @JsonKey(name: "is_endorsed") bool? isEndorsed,
    @JsonKey(name: "payable_from") String? payableFrom,
    @JsonKey(name: "payable_to") String? payableTo,
    String? service,
    String? event,
    int? city,
    String? currency,
    int? avatar,
    List<int>? images,
    List<int>? videos,
  }) = _TaskEntityServiceRes;

  factory TaskEntityServiceRes.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityServiceResFromJson(json);
}
