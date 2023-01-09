class TaskerExperienceRes {
  TaskerExperienceRes({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  factory TaskerExperienceRes.fromJson(Map<String, dynamic> json) =>
      TaskerExperienceRes(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'],
        previous: json['previous'],
        pageSize: json['page_size'] as int?,
        result: json['result'] == null
            ? []
            : List<TaskerExperience?>.from(
                json['result']!.map(
                  (x) => TaskerExperience.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<TaskerExperience?>? result;

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

class TaskerExperience {
  TaskerExperience({
    this.id,
    this.title,
    this.description,
    this.employmentType,
    this.companyName,
    this.location,
    this.currentlyWorking,
    this.startDate,
    this.endDate,
  });

  factory TaskerExperience.fromJson(Map<String, dynamic> json) =>
      TaskerExperience(
        id: json['id'] as int?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        employmentType: json['employment_type'] as String?,
        companyName: json['company_name'] as String?,
        location: json['location'] as String?,
        currentlyWorking: json['currently_working'] as bool?,
        startDate: DateTime.parse(json['start_date'] as String),
        endDate: DateTime.parse(json['end_date'] as String),
      );

  final int? id;
  final String? title;
  final String? description;
  final String? employmentType;
  final String? companyName;
  final String? location;
  final bool? currentlyWorking;
  final DateTime? startDate;
  final DateTime? endDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'employment_type': employmentType,
        'company_name': companyName,
        'location': location,
        'currently_working': currentlyWorking,
        'start_date':
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        'end_date':
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
      };
}
