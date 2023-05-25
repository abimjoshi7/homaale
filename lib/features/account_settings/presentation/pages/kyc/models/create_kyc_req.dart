// ignore_for_file: invalid_annotation_target

import 'package:dependencies/dependencies.dart';

part 'create_kyc_req.freezed.dart';
part 'create_kyc_req.g.dart';

@freezed
class CreateKycReq with _$CreateKycReq {
  const factory CreateKycReq({
    @JsonKey(name: "full_name") String? fullName,
    @JsonKey(name: "logo") @MultipartFileConverter() MultipartFile? logo,
    @JsonKey(name: "is_company") bool? isCompany,
    @JsonKey(name: "organization_name") String? organizationName,
    String? address,
    int? company,
    String? country,
  }) = _CreateKycReq;

  factory CreateKycReq.fromJson(Map<String, dynamic> json) => _$CreateKycReqFromJson(json);
}

class MultipartFileConverter implements JsonConverter<MultipartFile?, MultipartFile?> {
  const MultipartFileConverter();

  @override
  MultipartFile? fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  MultipartFile? toJson(MultipartFile? object) => object;
}
