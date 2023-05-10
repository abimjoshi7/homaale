import 'package:dependencies/dependencies.dart';

class AddKycReq {
  AddKycReq({
    this.kyc,
    this.documentType,
    this.documentId,
    this.file,
    this.issuerOrganization,
    this.issuedDate,
    this.validThrough,
    this.isCompany,
  });

  final int? kyc;
  final int? documentType;
  final String? documentId;
  final MultipartFile? file;
  final String? issuerOrganization;
  final DateTime? issuedDate;
  final DateTime? validThrough;
  final bool? isCompany;

  factory AddKycReq.fromJson(Map<String, dynamic> json) => AddKycReq(
        kyc: json["kyc"] as int?,
        documentType: json["document_type"] as int?,
        documentId: json["document_id"] as String?,
        file: json["file"] as MultipartFile,
        issuerOrganization: json["issuer_organization"] as String?,
        issuedDate: DateTime.parse(json["issued_date"] as String),
        validThrough: DateTime.parse(json["valid_through"] as String),
        isCompany: json["is_company"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "kyc": kyc,
        "document_type": documentType,
        "document_id": documentId,
        "file": file,
        "issuer_organization": issuerOrganization,
        "issued_date":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "valid_through": (validThrough != null)
            ? "${validThrough!.year.toString().padLeft(4, '0')}-${validThrough!.month.toString().padLeft(2, '0')}-${validThrough!.day.toString().padLeft(2, '0')}"
            : null,
        "is_company": isCompany,
      };
}
