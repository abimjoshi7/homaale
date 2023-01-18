class SupportHelpTopics {
  SupportHelpTopics({
    this.id,
    this.topic,
    this.isActive,
  });

  final int? id;
  final String? topic;
  final bool? isActive;

  factory SupportHelpTopics.fromJson(Map<String, dynamic> json) =>
      SupportHelpTopics(
        id: json["id"] as int?,
        topic: json["topic"] as String?,
        isActive: json["is_active"] as bool?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "topic": topic,
        "is_active": isActive,
      };
}
