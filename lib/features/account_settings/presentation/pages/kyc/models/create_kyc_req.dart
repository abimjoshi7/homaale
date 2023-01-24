class CreateKycReq {
  CreateKycReq({
    required this.fullName,
    this.isCompany,
    this.organizationName,
    required this.address,
    this.extraData,
    this.company,
    required this.country,
  });

  final String? fullName;
  final bool? isCompany;
  final String? organizationName;
  final String? address;
  final Map<String, dynamic>? extraData;
  final int? company;
  final String? country;

  factory CreateKycReq.fromJson(Map<String, dynamic> json) => CreateKycReq(
        fullName: json["full_name"] as String?,
        isCompany: json["is_company"] as bool?,
        organizationName: json["organization_name"] as String?,
        address: json["address"] as String?,
        extraData: json["extra_data"] as Map<String, dynamic>,
        company: json["company"] as int?,
        country: json["country"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "is_company": isCompany,
        "organization_name": organizationName,
        "address": address,
        "extra_data": extraData,
        "company": company,
        "country": country,
      };
}
