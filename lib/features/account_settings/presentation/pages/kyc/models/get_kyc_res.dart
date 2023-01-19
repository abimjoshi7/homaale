class GetKycRes {
  GetKycRes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.documentType,
    this.documentId,
    this.file,
    this.issuerOrganization,
    this.issuedDate,
    this.validThrough,
    this.isVerified,
    this.isCompany,
    this.comment,
    this.kyc,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? documentType;
  final String? documentId;
  final String? file;
  final String? issuerOrganization;
  final DateTime? issuedDate;
  final DateTime? validThrough;
  final bool? isVerified;
  final bool? isCompany;
  final dynamic comment;
  final int? kyc;

  factory GetKycRes.fromJson(Map<String, dynamic> json) => GetKycRes(
        id: json["id"] as int?,
        createdAt: DateTime.parse(json["created_at"] as String),
        updatedAt: DateTime.parse(json["updated_at"] as String),
        documentType: json["document_type"] as String?,
        documentId: json["document_id"] as String?,
        file: json["file"] as String?,
        issuerOrganization: json["issuer_organization"] as String?,
        issuedDate: DateTime.parse(json["issued_date"] as String),
        validThrough: DateTime.parse(json["valid_through"] as String),
        isVerified: json["is_verified"] as bool?,
        isCompany: json["is_company"] as bool?,
        comment: json["comment"],
        kyc: json["kyc"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "document_type": documentType,
        "document_id": documentId,
        "file": file,
        "issuer_organization": issuerOrganization,
        "issued_date":
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        "valid_through":
            "${validThrough!.year.toString().padLeft(4, '0')}-${validThrough!.month.toString().padLeft(2, '0')}-${validThrough!.day.toString().padLeft(2, '0')}",
        "is_verified": isVerified,
        "is_company": isCompany,
        "comment": comment,
        "kyc": kyc,
      };
}
