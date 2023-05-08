// ignore_for_file: invalid_annotation_target

import 'package:cipher/features/account_settings/presentation/pages/kyc/models/kyc_doc_type.dart';
import 'package:dependencies/dependencies.dart';

part 'kyc_list_res.freezed.dart';
part 'kyc_list_res.g.dart';

@freezed
class KycListRes with _$KycListRes {
  const factory KycListRes({
    int? id,
    @JsonKey(name: "document_type") KycDocType? documentType,
    @JsonKey(name: "created_at") DateTime? createdAt,
    @JsonKey(name: "updated_at") DateTime? updatedAt,
    @JsonKey(name: "document_id") String? documentId,
    String? file,
    @JsonKey(name: "issuer_organization") String? issuerOrganization,
    @JsonKey(name: "issued_date") DateTime? issuedDate,
    @JsonKey(name: "valid_through") DateTime? validThrough,
    @JsonKey(name: "is_verified") bool? isVerified,
    @JsonKey(name: "is_company") bool? isCompany,
    String? comment,
    int? kyc,
  }) = _KycListRes;

  factory KycListRes.fromJson(Map<String, dynamic> json) =>
      _$KycListResFromJson(json);
}
