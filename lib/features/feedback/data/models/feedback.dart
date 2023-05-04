
class Feedback {
  Feedback({
     this.id,
     this.name,
  });

  final int? id;
  final String? name;

  factory Feedback.fromJson(Map<String, dynamic> json) => Feedback(
        id: json['id'] as int?,
        name: json["name"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
