class SupportHelpReq {
  SupportHelpReq({
    this.reason,
    this.details,
    this.topic,
  });

  final String? reason;
  final String? details;
  final int? topic;

  factory SupportHelpReq.fromJson(Map<String, dynamic> json) => SupportHelpReq(
        reason: json["reason"] as String?,
        details: json["details"] as String?,
        topic: json["topic"] as int?,
      );

  Map<String, dynamic> toJson() => {
        "reason": reason,
        "details": details,
        "topic": topic,
      };
}
