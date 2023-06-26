// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaskEntityServiceReq {
  String? title;
  String? description;
  List<String?>? highlights;
  String? budgetType;
  double? budgetFrom;
  double? budgetTo;
  String? startDate;
  String? endDate;
  String? startTime;
  String? endTime;
  bool? shareLocation;
  bool? isNegotiable;
  int? revisions;
  String? recursionType;
  String? location;
  bool? isProfessional;
  bool? isOnline;
  bool? isRequested;
  String? discountType;
  String? discountValue;
  int? noOfReservation;
  bool? isActive;
  bool? needsApproval;
  bool? isEndorsed;
  String? service;
  String? event;
  int? city;
  String? currency;
  int? avatar;
  List<int>? images;
  List<int>? videos;

  TaskEntityServiceReq({
    this.title,
    this.description,
    this.highlights,
    this.budgetType,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.shareLocation,
    this.isNegotiable,
    this.revisions,
    this.recursionType,
    this.location,
    this.isProfessional,
    this.isOnline,
    this.isRequested,
    this.discountType,
    this.discountValue,
    this.noOfReservation,
    this.isActive,
    this.needsApproval,
    this.isEndorsed,
    this.service,
    this.event,
    this.city,
    this.currency,
    this.avatar,
    this.images,
    this.videos,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'title': title,
      'description': description,
      'highlights': highlights,
      'budget_type': budgetType,
      'budget_from': budgetFrom,
      'budget_to': budgetTo,
      'start_date': startDate,
      'end_date': endDate,
      'start_time': startTime,
      'end_time': endTime,
      'share_location': shareLocation,
      'is_negotiable': isNegotiable,
      'revisions': revisions,
      'recursion_type': recursionType,
      'location': location,
      'is_professional': isProfessional,
      'is_online': isOnline,
      'is_requested': isRequested,
      'discount_type': discountType,
      'discount_value': discountValue,
      'no_of_reservation': noOfReservation,
      'is_active': isActive,
      'needs_approval': needsApproval,
      'is_endorsed': isEndorsed,
      'service': service,
      'event': event,
      'city': city,
      'currency': currency,
      'avatar': avatar,
      'images': images,
      'videos': videos,
    };

    map.removeWhere((key, value) => value == null || value == '' || (value is List && value.isEmpty));
    if (map.containsKey('budget_from')) {
      map.update('budget_from', (value) => null);
    }

    return map;
  }
}


// // To parse this JSON data, do
// //
// //     final taskEntityServiceReq = taskEntityServiceReqFromJson(jsonString);

// // ignore_for_file: invalid_annotation_target

// import 'package:dependencies/dependencies.dart';

// part 'task_entity_service_req.freezed.dart';
// part 'task_entity_service_req.g.dart';

// @freezed
// class TaskEntityServiceReq with _$TaskEntityServiceReq {
//   const factory TaskEntityServiceReq({
//     // String? owner,
//     String? title,
//     String? description,
//     List<String?>? highlights,
//     @JsonKey(name: "budget_type") String? budgetType,
//     @JsonKey(name: "budget_from") double? budgetFrom,
//     @JsonKey(name: "budget_to") double? budgetTo,
//     @JsonKey(name: "start_date") String? startDate,
//     @JsonKey(name: "end_date") String? endDate,
//     @JsonKey(name: "start_time") String? startTime,
//     @JsonKey(name: "end_time") String? endTime,
//     @JsonKey(name: "share_location") bool? shareLocation,
//     @JsonKey(name: "is_negotiable") bool? isNegotiable,
//     int? revisions,
//     @JsonKey(name: "recursion_type") String? recursionType,
//     String? location,
//     @JsonKey(name: "is_professional") bool? isProfessional,
//     @JsonKey(name: "is_online") bool? isOnline,
//     @JsonKey(name: "is_requested") bool? isRequested,
//     @JsonKey(name: "discount_type") String? discountType,
//     @JsonKey(name: "discount_value") String? discountValue,
//     @JsonKey(name: "no_of_reservation") int? noOfReservation,
//     @JsonKey(name: "is_active") bool? isActive,
//     @JsonKey(name: "needs_approval") bool? needsApproval,
//     @JsonKey(name: "is_endorsed") bool? isEndorsed,
//     String? service,
//     String? event,
//     int? city,
//     String? currency,
//     int? avatar,
//     List<int>? images,
//     List<int>? videos,
//   }) = _TaskEntityServiceReq;

//   factory TaskEntityServiceReq.fromJson(Map<String, dynamic> json) => _$TaskEntityServiceReqFromJson(json);
// }
