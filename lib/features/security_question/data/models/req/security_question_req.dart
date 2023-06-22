
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'security_question_req.freezed.dart';
part 'security_question_req.g.dart';


@freezed
class SecurityQuestionReq with _$SecurityQuestionReq {
  const factory SecurityQuestionReq({
    int? id,
    String? question,
  }) = _SecurityQuestionReq;

  factory SecurityQuestionReq.fromJson(Map<String, dynamic> json) => _$SecurityQuestionReqFromJson(json);
}
