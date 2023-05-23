// ignore_for_file: public_member_api_docs, sort_constructors_first
class ApplyTaskReq {
  String? description;
  double? price;
  double? budgetFrom;
  double? budgetTo;
  String? entityService;
  List<String>? requirements;

  ApplyTaskReq({
    this.description,
    this.price,
    this.budgetFrom,
    this.budgetTo,
    this.entityService,
    this.requirements,
  });

  ApplyTaskReq.fromJson(Map<String, dynamic> json) {
    description = json['description'] as String;
    price = json['price'] as double;
    budgetFrom = json['budget_from'] as double;
    budgetTo = json['budget_to'] as double;
    entityService = json['entity_service'] as String;
    requirements = json['requirements'] as List<String>;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['description'] = description;
    data['price'] = price;
    data['budget_from'] = budgetFrom;
    data['budget_to'] = budgetTo;
    data['entity_service'] = entityService;
    data['requirements'] = requirements;
    return data;
  }
}
