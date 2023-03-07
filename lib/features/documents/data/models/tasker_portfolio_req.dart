class TaskerPortfolioReq {
  TaskerPortfolioReq({
    this.title,
    this.description,
    this.issuedDate,
    this.credentialUrl,
    this.images,
    this.files,
  });

  final String? title;
  final String? description;
  final DateTime? issuedDate;
  final String? credentialUrl;
  final List<int>? images;
  final List<int>? files;

  factory TaskerPortfolioReq.fromJson(Map<String, dynamic> json) => TaskerPortfolioReq(
    title: json["title"] as String?,
    description: json["description"] as String?,
    issuedDate: json["issued_date"] == null ? null : DateTime.parse(json["issued_date"] as String),
    credentialUrl: json["credential_url"] as String?,
    images: json["images"] == null ? [] : List<int>.from(json["images"].map((x) => x) as Iterable),
    files: json["files"] == null ? [] : List<int>.from(json["files"].map((x) => x) as Iterable),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "issued_date": "${issuedDate!.year.toString().padLeft(4, '0')}-${issuedDate!.month.toString().padLeft(2, '0')}-${issuedDate!.day.toString().padLeft(2, '0')}",
    "credential_url": credentialUrl,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "files": files == null ? [] : List<dynamic>.from(files!.map((x) => x)),
  };
}
