class TaskerExperienceReq {
  TaskerExperienceReq({
    required this.title,
    required this.description,
    required this.employmentType,
    required this.companyName,
    required this.location,
    this.currentlyWorking,
    required this.startDate,
    this.endDate,
  });

  final String title;
  final String description;
  final String employmentType;
  final String companyName;
  final String location;
  final bool? currentlyWorking;
  final DateTime startDate;
  final DateTime? endDate;

  factory TaskerExperienceReq.fromJson(Map<String, dynamic> json) =>
      TaskerExperienceReq(
        title: json["title"] as String,
        description: json["description"] as String,
        employmentType: json["employment_type"] as String,
        companyName: json["company_name"] as String,
        location: json["location"] as String,
        currentlyWorking: json["currently_working"] as bool?,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: json['end_date'] == null
            ? null
            : DateTime.parse(json['end_date'] as String),
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'employment_type': employmentType,
        'company_name': companyName,
        'location': location,
        'currently_working': currentlyWorking,
        'start_date':
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
