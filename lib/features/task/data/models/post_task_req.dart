class PostTaskReq {
  PostTaskReq({
    this.title,
    this.description,
    this.highlights,
    this.budgetType,
    this.budgetFrom,
    this.budgetTo,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.shareLocation,
    this.isNegotiable,
    this.revisions,
    this.recursionType,
    this.location,
    this.isProfessional,
    this.isOnline,
    this.isRequested,
    this.discountType,
    this.discountValue,
    this.extraData,
    this.noOfReservation,
    this.isActive,
    this.needsApproval,
    this.isEndorsed,
    this.service,
    this.event,
    this.city,
    this.currency,
    this.avatar,
    this.images,
    this.videos,
  });

  final String? title;
  final String? description;
  final List<String?>? highlights;
  final String? budgetType;
  final num? budgetFrom;
  final num? budgetTo;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? startTime;
  final String? endTime;
  final bool? shareLocation;
  final bool? isNegotiable;
  final num? revisions;
  final String? recursionType;
  final String? location;
  final bool? isProfessional;
  final bool? isOnline;
  final bool? isRequested;
  final String? discountType;
  final num? discountValue;
  final List<String?>? extraData;
  final num? noOfReservation;
  final bool? isActive;
  final bool? needsApproval;
  final bool? isEndorsed;
  final String? service;
  final String? event;
  final num? city;
  final String? currency;
  final num? avatar;
  final List<num>? images;
  final List<num>? videos;

  factory PostTaskReq.fromJson(Map<String, dynamic> json) => PostTaskReq(
        title: json["title"] as String?,
        description: json["description"] as String?,
        highlights: json["highlights"] == null
            ? null
            : json["highlights"] as List<String?>?,
        budgetType: json["budget_type"] as String?,
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
        shareLocation: json["share_location"] as bool?,
        isNegotiable: json["is_negotiable"] as bool?,
        revisions: json["revisions"] as num?,
        recursionType: json["recursion_type"] as String?,
        location: json["location"] as String?,
        isProfessional: json["is_professional"] as bool?,
        isOnline: json["is_online"] as bool?,
        isRequested: json["is_requested"] as bool?,
        discountType: json["discount_type"] as String?,
        discountValue: json["discount_value"] as num?,
        extraData: json["extra_data"] == null
            ? null
            : json["extra_data"] as List<String?>?,
        noOfReservation: json["no_of_reservation"] as num?,
        isActive: json["is_active"] as bool?,
        needsApproval: json["needs_approval"] as bool?,
        isEndorsed: json["is_endorsed"] as bool?,
        service: json["service"] as String?,
        event: json["event"] as String?,
        city: json["city"] as num?,
        currency: json["currency"] as String?,
        avatar: json["avatar"] as num?,
        images: json["images"] == null
            ? []
            : List<num>.from(
                json["images"].map((x) => x) as Iterable,
              ),
        videos: json["videos"] == null
            ? []
            : List<num>.from(
                json["videos"].map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "highlights": highlights,
        "budget_type": budgetType,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "start_date":
            "${startDate?.year.toString().padLeft(4, '0')}-${startDate?.month.toString().padLeft(2, '0')}-${startDate?.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
        "start_time": startTime,
        "end_time": endTime,
        "share_location": shareLocation,
        "is_negotiable": isNegotiable,
        "revisions": revisions,
        "recursion_type": recursionType,
        "location": location,
        "is_professional": isProfessional,
        "is_online": isOnline,
        "is_requested": isRequested,
        "discount_type": discountType,
        "discount_value": discountValue,
        "extra_data": extraData,
        "no_of_reservation": noOfReservation,
        "is_active": isActive,
        "needs_approval": needsApproval,
        "is_endorsed": isEndorsed,
        "service": service,
        "event": event,
        "city": city,
        "currency": currency,
        "avatar": avatar,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}
