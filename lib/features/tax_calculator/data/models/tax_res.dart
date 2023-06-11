// ignore_for_file: public_member_api_docs, sort_constructors_first
class TaxRes {
  TaxRes({
    this.status,
    this.details,
    this.data,
  });

  final String? status;
  final Details? details;
  final List<Datum>? data;

  factory TaxRes.fromJson(Map<String, dynamic> json) => TaxRes(
        status: json["status"] as String?,
        details: json["details"] == null
            ? null
            : Details.fromJson(
                json["details"] as Map<String, dynamic>,
              ),
        data: json["data"] == null
            ? []
            : List<Datum>.from(
                json["data"]!.map(
                  (x) => Datum.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "details": details?.toJson(),
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.name,
    this.taxableAmount,
    this.taxLiability,
    this.taxRate,
  });

  final String? name;
  final num? taxableAmount;
  final num? taxLiability;
  final String? taxRate;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"] as String?,
        taxableAmount: json["taxable_amount"] as num?,
        taxLiability: json["tax_liability"] as num?,
        taxRate: json["tax_rate"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "taxable_amount": taxableAmount,
        "tax_liability": taxLiability,
        "tax_rate": taxRate,
      };
}

class Details {
  Details({
    this.annualGrossSalary,
    this.netTaxableIncome,
    this.netPayableTaxYearly,
    this.netPayableTaxMonthly,
    this.taxRate,
    this.netTaxLiabilityYearly,
    this.netTaxLiabilityMonthly,
    this.rebateFemaleTax,
  });

  final num? annualGrossSalary;
  final num? netTaxableIncome;
  final num? netPayableTaxYearly;
  final num? netPayableTaxMonthly;
  final String? taxRate;
  final num? netTaxLiabilityYearly;
  final num? netTaxLiabilityMonthly;
  final num? rebateFemaleTax;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
        annualGrossSalary: json["annual gross salary"] as num?,
        netTaxableIncome: json["net taxable income"] as num?,
        netPayableTaxMonthly: json["net payable tax monthly"] as num?,
        netPayableTaxYearly: json["net payable tax yearly"] as num?,
        taxRate: json["tax rate"] as String?,
        netTaxLiabilityYearly: json["net tax liability yearly"] as num?,
        netTaxLiabilityMonthly: json["net tax liability monthly"] as num?,
        rebateFemaleTax: json["rebate for female tax payers (10%)"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "annual gross salary": annualGrossSalary,
        "net taxable income": netTaxableIncome,
        "net payable tax yearly": netPayableTaxMonthly,
        "net payable tax monthly": netPayableTaxMonthly,
        "tax rate": taxRate,
        "net tax liability yearly": netTaxLiabilityYearly,
        "net tax liability monthly": netTaxLiabilityMonthly,
        "rebate for female tax payers (10%)": rebateFemaleTax,
      };
}
