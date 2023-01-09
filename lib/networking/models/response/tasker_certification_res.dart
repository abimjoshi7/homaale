class TaskerCertificationRes {
  TaskerCertificationRes({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });
  factory TaskerCertificationRes.fromJson(Map<String, dynamic> json) =>
      TaskerCertificationRes(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'],
        previous: json['previous'],
        pageSize: json['page_size'] as int?,
        result: json['result'] == null
            ? []
            : List<TaskCertification?>.from(
                json['result']!.map((x) =>
                        TaskCertification.fromJson(x as Map<String, dynamic>))
                    as Iterable,
              ),
      );

  final int? totalPages;
  final int? count;
  final int? current;
  final dynamic next;
  final dynamic previous;
  final int? pageSize;
  final List<TaskCertification?>? result;

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

class TaskCertification {
  TaskCertification({
    this.id,
    this.name,
    this.issuingOrganization,
    this.description,
    this.doesExpire,
    this.credentialId,
    this.certificateUrl,
    this.issuedDate,
    this.expireDate,
  });
  factory TaskCertification.fromJson(Map<String, dynamic> json) =>
      TaskCertification(
        id: json['id'] as int?,
        name: json['name'] as String?,
        issuingOrganization: json['issuing_organization'] as String?,
        description: json['description'] as String?,
        doesExpire: json['does_expire'] as bool?,
        credentialId: json['credential_id'] as String?,
        certificateUrl: json['certificate_url'] as String?,
        issuedDate: DateTime.parse(json['issued_date'] as String),
        expireDate: DateTime.parse(json['expire_date'] as String),
      );

  final int? id;
  final String? name;
  final String? issuingOrganization;
  final String? description;
  final bool? doesExpire;
  final String? credentialId;
  final String? certificateUrl;
  final DateTime? issuedDate;
  final DateTime? expireDate;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'issuing_organization': issuingOrganization,
        'description': description,
        'does_expire': doesExpire,
        'credential_id': credentialId,
        'certificate_url': certificateUrl,
        'issued_date':
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        'expire_date':
            "${expireDate!.year.toString().padLeft(4, '0')}-${expireDate!.month.toString().padLeft(2, '0')}-${expireDate!.day.toString().padLeft(2, '0')}",
      };
}
