// ignore_for_file: public_member_api_docs, sort_constructors_first
class BookEntityServiceReq {
  BookEntityServiceReq({
    this.endDate,
    this.requirements,
    this.location,
    this.offer,
    this.description,
    this.price,
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

  final DateTime? endDate;
  final List<String>? requirements;
  final String? location;
  final List<int>? offer;
  final String? description;
  final double? price;
  final double? budgetFrom;
  final double? budgetTo;
  final DateTime? startDate;
  final String? startTime;
  final String? endTime;
  final List<String>? extraData;
  final String? bookingMerchant;
  final String? entityService;
  final int? city;
  final List<int>? images;
  final List<int>? videos;

  factory BookEntityServiceReq.fromJson(Map<String, dynamic> json) =>
      BookEntityServiceReq(
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(
                json["end_date"] as String,
              ),
        requirements: json["requirements"] as List<String>?,
        location: json["location"] as String?,
        offer: json["offer"] == null
            ? []
            : List<int>.from(json["offer"].map((x) => x) as Iterable),
        description: json["description"] as String?,
        price: json["price"] as double?,
        budgetFrom: json["budget_from"] as double?,
        budgetTo: json["budget_to"] as double?,
        startDate: json["start_date"] == null
            ? null
            : DateTime.parse(json["start_date"] as String),
        startTime: json["start_time"] as String?,
        endTime: json["end_time"] as String?,
        extraData: json["extra_data"] as List<String>?,
        bookingMerchant: json["booking_merchant"] as String?,
        entityService: json["entity_service"] as String?,
        city: json["city"] as int?,
        images: json["images"] == null
            ? []
            : List<int>.from(json["images"].map((x) => x) as Iterable),
        videos: json["videos"] == null
            ? []
            : List<int>.from(json["videos"].map((x) => x) as Iterable),
      );

  Map<String, dynamic> toJson() => {
        "end_date":
            "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
        "requirements": requirements,
        "location": location,
        "offer": offer == null
            ? []
            : List<dynamic>.from(
                offer!.map((x) => x),
              ),
        "description": description,
        "price": price,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
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
