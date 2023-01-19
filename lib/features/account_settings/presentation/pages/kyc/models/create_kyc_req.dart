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
  final ExtraData? extraData;
  final int? company;
  final String? country;

  factory CreateKycReq.fromJson(Map<String, dynamic> json) => CreateKycReq(
        fullName: json["full_name"] as String?,
        isCompany: json["is_company"] as bool?,
        organizationName: json["organization_name"] as String?,
        address: json["address"] as String?,
        extraData:
            ExtraData.fromJson(json["extra_data"] as Map<String, dynamic>),
        company: json["company"] as int?,
        country: json["country"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullName,
        "is_company": isCompany,
        "organization_name": organizationName,
        "address": address,
        "extra_data": extraData!.toJson(),
        "company": company,
        "country": country,
      };
}

class ExtraData {
  ExtraData({
    this.additionalProp1,
    this.additionalProp2,
    this.additionalProp3,
  });

  final String? additionalProp1;
  final String? additionalProp2;
  final String? additionalProp3;

  factory ExtraData.fromJson(Map<String, dynamic> json) => ExtraData(
        additionalProp1: json["additionalProp1"] as String?,
        additionalProp2: json["additionalProp2"] as String?,
        additionalProp3: json["additionalProp3"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "additionalProp1": additionalProp1,
        "additionalProp2": additionalProp2,
        "additionalProp3": additionalProp3,
      };
}
