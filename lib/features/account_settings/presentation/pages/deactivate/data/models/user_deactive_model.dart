
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_deactive_model.freezed.dart';
part 'user_deactive_model.g.dart';


@freezed
class UserDeactiveModel with _$UserDeactiveModel {
  const factory UserDeactiveModel({
    String? reason,
   @JsonKey(name:'reactivate_date') String? reactivateDate,
  }) = _UserDeactiveModel;

  factory UserDeactiveModel.fromJson(Map<String, dynamic> json) => _$UserDeactiveModelFromJson(json);
}
