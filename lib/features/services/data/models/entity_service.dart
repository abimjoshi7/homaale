import 'package:cipher/features/services/data/models/services_list.dart';

class EntityServiceModel {
  EntityServiceModel({
    this.totalPages,
    this.count,
    this.current,
    this.next,
    this.previous,
    this.pageSize,
    this.result,
  });

  final num? totalPages;
  final num? count;
  final num? current;
  final String? next;
  final dynamic previous;
  final num? pageSize;
  final List<EntityService>? result;

  factory EntityServiceModel.fromJson(Map<String, dynamic> json) =>
      EntityServiceModel(
        totalPages: json["total_pages"] as num?,
        count: json["count"] as num?,
        current: json["current"] as num?,
        next: json["next"] as String?,
        previous: json["previous"] as num?,
        pageSize: json["page_size"] as num?,
        result: json["result"] == null
            ? []
            : List<EntityService>.from(
                json["result"]!.map(
                  (x) => EntityService.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "total_pages": totalPages,
        "count": count,
        "current": current,
        "next": next,
        "previous": previous,
        "page_size": pageSize,
        "result": result == null
            ? []
            : List<dynamic>.from(
                result!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class EntityService {
  EntityService({
    this.id,
    this.slug,
    this.createdAt,
    this.createdBy,
    this.title,
    this.currency,
    this.city,
    this.isOnline,
    this.service,
    this.images,
    this.rating,
    this.budgetType,
    this.isRequested,
    this.budgetFrom,
    this.budgetTo,
    this.location,
    this.count,
    this.isEndorsed,
    this.endDate,
    this.videos,
  });

  final String? id;
  final String? slug;
  final DateTime? createdAt;
  final CreatedBy? createdBy;
  final String? title;
  final Currency? currency;
  final City? city;
  final bool? isOnline;
  final Service? service;
  final List<Image>? images;
  final List<Rating>? rating;
  final String? budgetType;
  final bool? isRequested;
  final num? budgetFrom;
  final num? budgetTo;
  final String? location;
  final num? count;
  final bool? isEndorsed;
  final DateTime? endDate;
  final List<dynamic>? videos;

  factory EntityService.fromJson(Map<String, dynamic> json) => EntityService(
        id: json["id"] as String?,
        slug: json["slug"] as String?,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(
                json["created_at"] as String,
              ),
        createdBy: json["created_by"] == null
            ? null
            : CreatedBy.fromJson(
                json["created_by"] as Map<String, dynamic>,
              ),
        title: json["title"] as String?,
        currency: json["currency"] == null
            ? null
            : Currency.fromJson(
                json["currency"] as Map<String, dynamic>,
              ),
        city: json["city"] == null
            ? null
            : City.fromJson(
                json["city"] as Map<String, dynamic>,
              ),
        isOnline: json["is_online"] as bool?,
        service: json["service"] == null
            ? null
            : Service.fromJson(
                json["service"] as Map<String, dynamic>,
              ),
        images: json["images"] == null
            ? []
            : List<Image>.from(
                json["images"].map(
                  (x) => Image.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        rating: json["rating"] == null
            ? []
            : List<Rating>.from(
                json["rating"].map(
                  (x) => Rating.fromJson(
                    x as Map<String, dynamic>,
                  ),
                ) as Iterable,
              ),
        budgetType: json["budget_type"] as String?,
        isRequested: json["is_requested"] as bool?,
        budgetFrom: json["budget_from"] as num?,
        budgetTo: json["budget_to"] as num?,
        location: json["location"] as String?,
        count: json["count"] as num?,
        isEndorsed: json["is_endorsed"] as bool?,
        endDate: json["end_date"] == null
            ? null
            : DateTime.parse(json["end_date"] as String),
        videos: json["videos"] == null
            ? []
            : List<dynamic>.from(
                json["videos"].map((x) => x) as Iterable,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy?.toJson(),
        "title": title,
        "currency": currency?.toJson(),
        "city": city?.toJson(),
        "is_online": isOnline,
        "service": service?.toJson(),
        "images": images == null
            ? []
            : List<dynamic>.from(images!.map((x) => x.toJson())),
        "rating": rating == null
            ? []
            : List<dynamic>.from(rating!.map((x) => x.toJson())),
        "budget_type": budgetType,
        "is_requested": isRequested,
        "budget_from": budgetFrom,
        "budget_to": budgetTo,
        "location": location,
        "count": count,
        "is_endorsed": isEndorsed,
        "end_date":
            "${endDate?.year.toString().padLeft(4, '0')}-${endDate?.month.toString().padLeft(2, '0')}-${endDate?.day.toString().padLeft(2, '0')}",
        "videos":
            videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
      };
}

class City {
  City({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.country,
  });

  final num? id;
  final String? name;
  final num? latitude;
  final num? longitude;
  final Country? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"] as num?,
        name: json["name"] as String?,
        latitude: json["latitude"] as num?,
        longitude: json["longitude"] as num?,
        country: json["country"] == null
            ? null
            : Country.fromJson(
                json["country"] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "country": country?.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
  });

  final String? name;
  final String? code;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] as String?,
        code: json["code"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  final String? code;
  final String? name;
  final String? symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
        code: json["code"] as String?,
        name: json["name"] as String?,
        symbol: json["symbol"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class Image {
  Image({
    this.id,
    this.name,
    this.size,
    this.mediaType,
    this.media,
  });

  final num? id;
  final String? name;
  final String? size;
  final String? mediaType;
  final String? media;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"] as num?,
        name: json["name"] as String?,
        size: json["size"] as String?,
        mediaType: json["media_type"] as String?,
        media: json["media"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "size": size,
        "media_type": mediaType,
        "media": media,
      };
}

class Rating {
  Rating({
    this.rating,
  });

  final num? rating;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        rating: json["rating"] as num?,
      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
      };
}

class Service {
  Service({
    this.id,
    this.title,
    this.isActive,
    this.isVerified,
    this.category,
  });

  final String? id;
  final String? title;
  final bool? isActive;
  final bool? isVerified;
  final Category? category;

  factory Service.fromJson(Map<String, dynamic> json) => Service(
        id: json["id"] as String?,
        title: json["title"] as String?,
        isActive: json["is_active"] as bool?,
        isVerified: json["is_verified"] as bool?,
        category: json["category"] == null
            ? null
            : Category.fromJson(
                json["category"] as Map<String, dynamic>,
              ),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "is_active": isActive,
        "is_verified": isVerified,
        "category": category?.toJson(),
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.level,
    this.slug,
  });

  final num? id;
  final String? name;
  final num? level;
  final String? slug;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] as num?,
        name: json["name"] as String?,
        level: json["level"] as num?,
        slug: json["slug"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "level": level,
        "slug": slug,
      };
}
