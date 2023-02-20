class TaxReq {
  TaxReq({
    this.maritalStatus,
    this.salary,
    this.incomeTime,
    this.festivalBonus,
    this.allowance,
    this.others,
    this.pf,
    this.cit,
    this.lifeInsurance,
    this.medicalInsurance,
  });

  final String? maritalStatus;
  final num? salary;
  final String? incomeTime;
  final num? festivalBonus;
  final num? allowance;
  final num? others;
  final num? pf;
  final num? cit;
  final num? lifeInsurance;
  final num? medicalInsurance;

  factory TaxReq.fromJson(Map<String, dynamic> json) => TaxReq(
        maritalStatus: json["marital_status"] as String?,
        salary: json["salary"] as num?,
        incomeTime: json["income_time"] as String?,
        festivalBonus: json["festival_bonus"] as num?,
        allowance: json["allowance"] as num?,
        others: json["others"] as num?,
        pf: json["pf"] as num?,
        cit: json["cit"] as num?,
        lifeInsurance: json["life_insurance"] as num?,
        medicalInsurance: json["medical_insurance"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "marital_status": maritalStatus,
        "salary": salary,
        "income_time": incomeTime,
        "festival_bonus": festivalBonus,
        "allowance": allowance,
        "others": others,
        "pf": pf,
        "cit": cit,
        "life_insurance": lifeInsurance,
        "medical_insurance": medicalInsurance,
      };
}
