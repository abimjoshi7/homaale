class TaskerCertificationReq {
  TaskerCertificationReq({
    this.name,
    this.issuingOrganization,
    this.description,
    this.doesExpire,
    this.credentialId,
    this.certificateUrl,
    this.issuedDate,
    this.expireDate,
  });

  factory TaskerCertificationReq.fromJson(Map<String, dynamic> json) =>
      TaskerCertificationReq(
        name: json['name'] as String?,
        issuingOrganization: json['issuing_organization'] as String?,
        description: json['description'] as String?,
        doesExpire: json['does_expire'] as bool?,
        credentialId: json['credential_id'] as String?,
        certificateUrl: json['certificate_url'] as String?,
        issuedDate: DateTime.parse(json['issued_date'] as String),
        expireDate: DateTime.parse(json['expire_date'] as String),
      );

  final String? name;
  final String? issuingOrganization;
  final String? description;
  final bool? doesExpire;
  final String? credentialId;
  final String? certificateUrl;
  final DateTime? issuedDate;
  final DateTime? expireDate;

  Map<String, dynamic> toJson() => {
        'name': name,
        'issuing_organization': issuingOrganization,
        'description': description,
        'does_expire': doesExpire,
        'credential_id': credentialId,
        'certificate_url': certificateUrl,
        'issued_date':
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        'expire_date':
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
      };
}
