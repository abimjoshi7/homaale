class BookEntityServiceRes {
  BookEntityServiceRes({
    this.id,
    this.endDate,
    this.requirements,
    this.location,
    this.createdAt,
    this.updatedAt,
    this.description,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.startTime,
    this.endTime,
    this.extraData,
    this.bookingMerchant,
    this.entityService,
    this.city,
    this.images,
    this.videos,
  });

  final int? id;
  final DateTime? endDate;
  final Map<String, dynamic>? requirements;
  final String? location;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? description;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
  final String? startTime;
  final String? endTime;
  final Map<String, dynamic>? extraData;
  final String? bookingMerchant;
  final String? entityService;
  final int? city;
  final List<int>? images;
  final List<int>? videos;

  factory BookEntityServiceRes.fromJson(Map<String, dynamic> json) =>
      BookEntityServiceRes(
        id: json["id"] as int?,
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(json["end_date"] as String),
        requirements: json["requirements"] == null
            ? null
            : json["requirements"] as Map<String, dynamic>,
        location: json["location"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"] as String),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"] as String),
        description: json["description"] as String?,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(
                json["start_date"] as String,
              ),
        startTime: json["start_time"] as String?,
        endTime: json["end_time"] as String?,
        extraData: json["extra_data"] == null
            ? null
            : json["extra_data"] as Map<String, dynamic>,
        bookingMerchant: json["booking_merchant"] as String?,
        entityService: json["entity_service"] as String?,
        city: json["city"] as int?,
        images: json["images"] == null
            ? []
            : List<int>.from(
                json["images"].map((x) => x) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<int>.from(
                json["videos"].map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "requirements": requirements,
        "location": location,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "description": description,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "extra_data": extraData,
        "booking_merchant": bookingMerchant,
        "entity_service": entityService,
        "city": city,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}
