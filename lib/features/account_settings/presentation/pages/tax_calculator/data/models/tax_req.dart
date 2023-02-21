class TaxReq {
  TaxReq({
    this.maritalStatus,
    this.salary,
    this.incomeType,
    this.festivalBonus,
    this.allowance,
    this.others,
    this.pf,
    this.cit,
    this.lifeInsurance,
    this.medicalInsurance,
  });

  final String? maritalStatus;
  final double? salary;
  final String? incomeType;
  final double? festivalBonus;
  final double? allowance;
  final double? others;
  final double? pf;
  final double? cit;
  final double? lifeInsurance;
  final double? medicalInsurance;

  factory TaxReq.fromJson(Map<String, dynamic> json) => TaxReq(
        maritalStatus: json["marital_status"] as String?,
        salary: json["salary"] as double?,
        incomeType: json["income_time"] as String?,
        festivalBonus: json["festival_bonus"] as double?,
        allowance: json["allowance"] as double?,
        others: json["others"] as double?,
        pf: json["pf"] as double?,
        cit: json["cit"] as double?,
        lifeInsurance: json["life_insurance"] as double?,
        medicalInsurance: json["medical_insurance"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "marital_status": maritalStatus,
        "salary": salary,
        "income_time": incomeType,
        "festival_bonus": festivalBonus ?? 0,
        "allowance": allowance ?? 0,
        "others": others ?? 0,
        "pf": pf ?? 0,
        "cit": cit ?? 0,
        "life_insurance": lifeInsurance ?? 0,
        "medical_insurance": medicalInsurance ?? 0,
      };
}
