class TaskerEducationReq {
  TaskerEducationReq({
    required this.school,
    required this.description,
    required this.degree,
    required this.fieldOfStudy,
    required this.location,
    required this.startDate,
    this.endDate,
  });

  final String school;
  final String description;
  final String degree;
  final String fieldOfStudy;
  final String location;
  final DateTime startDate;
  final DateTime? endDate;

  factory TaskerEducationReq.fromJson(Map<String, dynamic> json) =>
      TaskerEducationReq(
        school: json["school"] as String,
        description: json["description"] as String,
        degree: json["degree"] as String,
        fieldOfStudy: json["field_of_study"] as String,
        location: json["location"] as String,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: json['end_date'] == null
            ? null
            : DateTime.parse(json['end_date'] as String),
      );

  Map<String, dynamic> toJson() => {
        "school": school,
        "description": description,
        "degree": degree,
        "field_of_study": fieldOfStudy,
        "location": location,
        'start_date':
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
