
import 'package:freezed_annotation/freezed_annotation.dart';

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
