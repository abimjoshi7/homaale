class EditBookingReq {
  EditBookingReq({
    this.status,
    this.description,
    this.requirements,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.location,
    this.isActive,
    this.extraData,
    this.createdBy,
    this.bookingMerchant,
    this.entityService,
    this.city,
    this.images,
    this.videos,
  });

  final String? status;
  final String? description;
  final Map<String, dynamic>? requirements;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;
  final String? location;
  final bool? isActive;
  final Map<String, dynamic>? extraData;
  final String? createdBy;
  final String? bookingMerchant;
  final String? entityService;
  final int? city;
  final List<dynamic>? images;
  final List<dynamic>? videos;

  factory EditBookingReq.fromJson(Map<String, dynamic> json) => EditBookingReq(
        status: json["status"] as String?,
        description: json["description"] as String?,
        requirements: json["requirements"] == null
            ? null
            : json["requirements"] as Map<String, dynamic>,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(
                json["start_date"] as String,
              ),
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(
                json["end_date"] as String,
              ),
        startTime: json["start_time"] as String?,
        endTime: json["end_time"] as String?,
        location: json["location"] as String?,
        isActive: json["is_active"] as bool?,
        extraData: json["extra_data"] == null
            ? null
            : json["extra_data"] as Map<String, dynamic>,
        createdBy: json["created_by"] as String?,
        bookingMerchant: json["booking_merchant"] as String?,
        entityService: json["entity_service"] as String?,
        city: json["city"] as int?,
        images: json["images"] == null
            ? []
            : List<int>.from(
                json["images"]!.map((x) => x) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<int>.from(
                json["videos"]!.map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "description": description,
        "requirements": requirements,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "location": location,
        "is_active": isActive,
        "extra_data": extraData,
        "created_by": createdBy,
        "booking_merchant": bookingMerchant,
        "entity_service": entityService,
        "city": city,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}
