class SupportTicketTypeOptions {
  SupportTicketTypeOptions({this.id, this.name, this.slug});

  final int? id;
  final String? name;
  final String? slug;

  factory SupportTicketTypeOptions.fromJson(Map<String, dynamic> json) =>
      SupportTicketTypeOptions(
        id: json['id'] as int?,
        name: json["name"] as String?,
        slug: json["slug"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}
