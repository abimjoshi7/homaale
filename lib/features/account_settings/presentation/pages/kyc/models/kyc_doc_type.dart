// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'kyc_doc_type.freezed.dart';
part 'kyc_doc_type.g.dart';

@freezed
class KycDocType with _$KycDocType {
  const factory KycDocType({
    int? id,
    String? name,
    @JsonKey(name: "required_for_user") bool? requiredForUser,
    @JsonKey(name: "required_for_merchant") bool? requiredForMerchant,
  }) = _KycDocType;

  factory KycDocType.fromJson(Map<String, dynamic> json) => _$KycDocTypeFromJson(json);
}
