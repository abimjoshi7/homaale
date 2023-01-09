class TaskerEducationRes {
  TaskerEducationRes({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  factory TaskerEducationRes.fromJson(Map<String, dynamic> json) =>
      TaskerEducationRes(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'],
        previous: json['previous'],
        pageSize: json['page_size'] as int?,
        result: json['result'] == null
            ? []
            : List<TaskerEducation?>.from(json['result']!.map(
                    (x) => TaskerEducation.fromJson(x as Map<String, dynamic>))
                as Iterable),
      );

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<TaskerEducation?>? result;

  Map<String, dynamic> toJson() => {
        'total_pages': totalPages,
        'count': count,
        'current': current,
        'next': next,
        'previous': previous,
        'page_size': pageSize,
        'result': result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x!.toJson())),
      };
}

class TaskerEducation {
  TaskerEducation({
    this.id,
    this.school,
    this.description,
    this.degree,
    this.fieldOfStudy,
    this.location,
    this.startDate,
    this.endDate,
  });

  factory TaskerEducation.fromJson(Map<String, dynamic> json) =>
      TaskerEducation(
        id: json['id'] as int?,
        school: json['school'] as String?,
        description: json['description'] as String?,
        degree: json['degree'] as String?,
        fieldOfStudy: json['field_of_study'] as String?,
        location: json['location'] as String?,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: DateTime.parse(json['end_date'] as String),
      );

  final int? id;
  final String? school;
  final String? description;
  final String? degree;
  final String? fieldOfStudy;
  final String? location;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'school': school,
        'description': description,
        'degree': degree,
        'field_of_study': fieldOfStudy,
        'location': location,
        'start_date':
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
