import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_kyc_req.freezed.dart';
part 'create_kyc_req.g.dart';

@freezed
class CreateKycReq with _$CreateKycReq {
  const factory CreateKycReq({
    @JsonKey(name: "full_name") String? fullName,
    String? logo,
    @JsonKey(name: "is_company") bool? isCompany,
    @JsonKey(name: "organization_name") String? organizationName,
    String? address,
    @JsonKey(name: "extra_data") ExtraData? extraData,
    int? company,
    String? country,
  }) = _CreateKycReq;

  factory CreateKycReq.fromJson(Map<String, dynamic> json) =>
      _$CreateKycReqFromJson(json);
}

@freezed
class ExtraData with _$ExtraData {
  const factory ExtraData({
    String? additionalProp1,
    String? additionalProp2,
    String? additionalProp3,
  }) = _ExtraData;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
}
