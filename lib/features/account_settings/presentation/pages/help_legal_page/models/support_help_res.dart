class SupportHelpRes {
  SupportHelpRes({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.reason,
    this.details,
    this.topic,
  });

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? reason;
  final String? details;
  final int? topic;

  factory SupportHelpRes.fromJson(Map<String, dynamic> json) => SupportHelpRes(
        id: json["id"] as int?,
        createdAt: DateTime.parse(json["created_at"] as String),
        updatedAt: DateTime.parse(json["updated_at"] as String),
        reason: json["reason"] as String?,
        details: json["details"] as String?,
        topic: json["topic"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "reason": reason,
        "details": details,
        "topic": topic,
      };
}
