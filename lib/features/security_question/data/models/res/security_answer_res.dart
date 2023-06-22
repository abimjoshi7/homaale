

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'security_answer_res.freezed.dart';
part 'security_answer_res.g.dart';


@freezed
class SecurityAnswerRes with _$SecurityAnswerRes {
  const factory SecurityAnswerRes({
    int? id,
    String? answer,
    int? question,
  }) = _SecurityAnswerRes;

  factory SecurityAnswerRes.fromJson(Map<String, dynamic> json) => _$SecurityAnswerResFromJson(json);
}
