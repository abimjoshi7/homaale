class TaskerPortfolioRes {
  TaskerPortfolioRes({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });
  factory TaskerPortfolioRes.fromJson(Map<String, dynamic> json) =>
      TaskerPortfolioRes(
        totalPages: json['total_pages'] as int?,
        count: json['count'] as int?,
        current: json['current'] as int?,
        next: json['next'] as String?,
        previous: json['previous'] as String?,
        pageSize: json['page_size'] as int?,
        result: json['result'] == null
            ? []
            : List<TaskerPortfolio?>.from(
                json['result']!.map(
                  (x) => TaskerPortfolio.fromJson(x as Map<String, dynamic>),
                ) as Iterable,
              ),
      );

  final int? totalPages;
  final int? count;
  final int? current;
  final String? next;
  final String? previous;
  final int? pageSize;
  final List<TaskerPortfolio?>? result;

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

class TaskerPortfolio {
  TaskerPortfolio({
    this.id,
    this.images,
    this.files,
    this.title,
    this.description,
    this.issuedDate,
    this.credentialUrl,
  });
  factory TaskerPortfolio.fromJson(Map<String, dynamic> json) =>
      TaskerPortfolio(
        id: json['id'] as int?,
        images: json['images'] == null
            ? []
            : List<dynamic>.from(json['images']!.map((x) => x) as Iterable),
        files: json['files'] == null
            ? []
            : List<dynamic>.from(json['files']!.map((x) => x) as Iterable),
        title: json['title'] as String?,
        description: json['description'] as String?,
        issuedDate: DateTime.parse(json['issued_date'] as String),
        credentialUrl: json['credential_url'] as String?,
      );

  final int? id;
  final List<dynamic>? images;
  final List<dynamic>? files;
  final String? title;
  final String? description;
  final DateTime? issuedDate;
  final String? credentialUrl;

  Map<String, dynamic> toJson() => {
        'id': id,
        'images':
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        'files': files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
        'title': title,
        'description': description,
        'issued_date':
            "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
        'credential_url': credentialUrl,
      };
}
