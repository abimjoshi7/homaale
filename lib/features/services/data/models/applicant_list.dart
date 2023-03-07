// // To parse this JSON data, do
// //
// //     final applicantList = applicantListFromJson(jsonString);

// import 'dart:convert';

// import 'package:freezed_annotation/freezed_annotation.dart';

// part 'applicant_list.freezed.dart';
// part 'applicant_list.g.dart';

// ApplicantList applicantListFromJson(String str) => ApplicantList.fromJson(json.decode(str));

// String applicantListToJson(ApplicantList data) => json.encode(data.toJson());

// @freezed
// class ApplicantList with _$ApplicantList {
//     const factory ApplicantList({
//         int?? count,
//         String?? next,
//         String?? previous,
//         List<Result>?? results,
//     }) = _ApplicantList;

//     factory ApplicantList.fromJson(Map<String, dynamic> json) => _$ApplicantListFromJson(json);
// }

// @freezed
// class Result with _$Result {
//     const factory Result({
//         int?? id,
//         DateTime?? createdAt,
//         String?? status,
//         String?? currency,
//         int?? budgetFrom,
//         int?? budgetTo,
//         String?? budgetType,
//         String?? createdBy,
//     }) = _Result;

//     factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
// }
