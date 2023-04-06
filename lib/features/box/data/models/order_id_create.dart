import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_id_create.freezed.dart';
part 'order_id_create.g.dart';

@freezed
class OrderIdCreate with _$OrderIdCreate {
  const factory OrderIdCreate({
    String? order,
  }) = _OrderIdCreate;

  factory OrderIdCreate.fromJson(Map<String, dynamic> json) =>
      _$OrderIdCreateFromJson(json);
}
