class TaskerPortfolioReq {
  TaskerPortfolioReq({
    required this.title,
    required this.description,
    required this.issuedDate,
    required this.credentialUrl,
    this.images,
    this.files,
  });

  final String title;
  final String description;
  final DateTime issuedDate;
  final String credentialUrl;
  final List<int?>? images;
  final List<int?>? files;

  factory TaskerPortfolioReq.fromJson(Map<String, dynamic> json) =>
      TaskerPortfolioReq(
        title: json["title"] as String,
        description: json["description"] as String,
        issuedDate: json["issued_date"] as DateTime,
        credentialUrl: json["credential_url"] as String,
        images: json["images"] == null
            ? []
            : json["images"] == null
                ? []
                : List<int?>.from(json["images"]!.map((x) => x) as Iterable),
        files: json["files"] == null
            ? []
            : json["files"] == null
                ? []
                : List<int?>.from(json["files"]!.map((x) => x) as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "issued_date": issuedDate,
        "credential_url": credentialUrl,
        "images": images == null
            ? []
            : images == null
                ? []
                : List<dynamic>.from(images!.map((x) => x)),
        "files": files == null
            ? []
            : files == null
                ? []
                : List<dynamic>.from(files!.map((x) => x)),
      };
}
