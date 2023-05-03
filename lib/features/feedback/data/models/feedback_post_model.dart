// class FeedbackPostModel {
//   FeedbackPostModel({
//      this.status,
//      this.message,
//   });
//
//   final String? status;
//   final String? message;
//
//   factory FeedbackPostModel.fromJson(Map<String, dynamic> json) => FeedbackPostModel(
//     status: json["status"] as String,
//     message: json["message"] as String,
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "message": message,
//   };
// }


import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'feedback_post_model.freezed.dart';
part 'feedback_post_model.g.dart';



@freezed
class FeedbackPostModel with _$FeedbackPostModel {
  const factory FeedbackPostModel({
    String? status,
    String? message,
  }) = _FeedbackPostModel;

  factory FeedbackPostModel.fromJson(Map<String, dynamic> json) => _$FeedbackPostModelFromJson(json);
}
