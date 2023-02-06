// class EntityService {
//   EntityService({
//     this.totalPages,
//     this.count,
//     this.current,
//     this.next,
//     this.previous,
//     this.pageSize,
//     this.result,
//   });
//
//   final int? totalPages;
//   final int? count;
//   final int? current;
//   final String? next;
//   final dynamic previous;
//   final int? pageSize;
//   final List<Result>? result;
//
//   factory EntityService.fromJson(Map<String, dynamic> json) => EntityService(
//         totalPages: json["total_pages"],
//         count: json["count"],
//         current: json["current"],
//         next: json["next"],
//         previous: json["previous"],
//         pageSize: json["page_size"],
//         result: json["result"] == null
//             ? []
//             : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "total_pages": totalPages,
//         "count": count,
//         "current": current,
//         "next": next,
//         "previous": previous,
//         "page_size": pageSize,
//         "result": result == null
//             ? []
//             : List<dynamic>.from(result!.map((x) => x.toJson())),
//       };
// }
//
// class Result {
//   Result({
//     this.id,
//     this.slug,
//     this.createdAt,
//     this.createdBy,
//     this.title,
//     this.currency,
//     this.city,
//     this.isOnline,
//     this.service,
//     this.images,
//     this.rating,
//     this.budgetType,
//     this.isRequested,
//     this.budgetFrom,
//     this.budgetTo,
//     this.location,
//     this.count,
//     this.isEndorsed,
//     this.endDate,
//     this.videos,
//   });
//
//   final String? id;
//   final String? slug;
//   final DateTime? createdAt;
//   final CreatedBy? createdBy;
//   final String? title;
//   final Currency? currency;
//   final City? city;
//   final bool? isOnline;
//   final Service? service;
//   final List<Image>? images;
//   final List<Rating>? rating;
//   final BudgetType? budgetType;
//   final bool? isRequested;
//   final int? budgetFrom;
//   final int? budgetTo;
//   final Location? location;
//   final int? count;
//   final bool? isEndorsed;
//   final DateTime? endDate;
//   final List<dynamic>? videos;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         slug: json["slug"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         createdBy: json["created_by"] == null
//             ? null
//             : CreatedBy.fromJson(json["created_by"]),
//         title: json["title"],
//         currency: json["currency"] == null
//             ? null
//             : Currency.fromJson(json["currency"]),
//         city: json["city"] == null ? null : City.fromJson(json["city"]),
//         isOnline: json["is_online"],
//         service:
//             json["service"] == null ? null : Service.fromJson(json["service"]),
//         images: json["images"] == null
//             ? []
//             : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
//         rating: json["rating"] == null
//             ? []
//             : List<Rating>.from(json["rating"]!.map((x) => Rating.fromJson(x))),
//         budgetType: budgetTypeValues.map[json["budget_type"]]!,
//         isRequested: json["is_requested"],
//         budgetFrom: json["budget_from"],
//         budgetTo: json["budget_to"],
//         location: locationValues.map[json["location"]]!,
//         count: json["count"],
//         isEndorsed: json["is_endorsed"],
//         endDate:
//             json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
//         videos: json["videos"] == null
//             ? []
//             : List<dynamic>.from(json["videos"]!.map((x) => x)),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "slug": slug,
//         "created_at": createdAt?.toIso8601String(),
//         "created_by": createdBy?.toJson(),
//         "title": title,
//         "currency": currency?.toJson(),
//         "city": city?.toJson(),
//         "is_online": isOnline,
//         "service": service?.toJson(),
//         "images": images == null
//             ? []
//             : List<dynamic>.from(images!.map((x) => x.toJson())),
//         "rating": rating == null
//             ? []
//             : List<dynamic>.from(rating!.map((x) => x.toJson())),
//         "budget_type": budgetTypeValues.reverse[budgetType],
//         "is_requested": isRequested,
//         "budget_from": budgetFrom,
//         "budget_to": budgetTo,
//         "location": locationValues.reverse[location],
//         "count": count,
//         "is_endorsed": isEndorsed,
//         "end_date":
//             "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
//         "videos":
//             videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
//       };
// }
//
// enum BudgetType { PROJECT }
//
// final budgetTypeValues = EnumValues({"Project": BudgetType.PROJECT});
//
// class City {
//   City({
//     this.id,
//     this.name,
//     this.latitude,
//     this.longitude,
//     this.country,
//   });
//
//   final int? id;
//   final CityName? name;
//   final double? latitude;
//   final double? longitude;
//   final Country? country;
//
//   factory City.fromJson(Map<String, dynamic> json) => City(
//         id: json["id"],
//         name: cityNameValues.map[json["name"]]!,
//         latitude: json["latitude"]?.toDouble(),
//         longitude: json["longitude"]?.toDouble(),
//         country:
//             json["country"] == null ? null : Country.fromJson(json["country"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": cityNameValues.reverse[name],
//         "latitude": latitude,
//         "longitude": longitude,
//         "country": country?.toJson(),
//       };
// }
//
// class Country {
//   Country({
//     this.name,
//     this.code,
//   });
//
//   final CountryName? name;
//   final CountryCode? code;
//
//   factory Country.fromJson(Map<String, dynamic> json) => Country(
//         name: countryNameValues.map[json["name"]]!,
//         code: countryCodeValues.map[json["code"]]!,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "name": countryNameValues.reverse[name],
//         "code": countryCodeValues.reverse[code],
//       };
// }
//
// enum CountryCode { NP }
//
// final countryCodeValues = EnumValues({"NP": CountryCode.NP});
//
// enum CountryName { NEPAL }
//
// final countryNameValues = EnumValues({"Nepal": CountryName.NEPAL});
//
// enum CityName { KATHMANDU, BUDHANILKANTHA_KATHMANDU }
//
// final cityNameValues = EnumValues({
//   "Budhanilkantha, Kathmandu": CityName.BUDHANILKANTHA_KATHMANDU,
//   "Kathmandu": CityName.KATHMANDU
// });
//
// class CreatedBy {
//   CreatedBy({
//     this.id,
//     this.username,
//     this.email,
//     this.phone,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.profileImage,
//     this.bio,
//     this.createdAt,
//     this.designation,
//     this.userType,
//     this.isProfileVerified,
//     this.isFollowed,
//     this.isFollowing,
//     this.avatar,
//   });
//
//   final String? id;
//   final Email? username;
//   final Email? email;
//   final dynamic phone;
//   final FirstName? firstName;
//   final String? middleName;
//   final LastName? lastName;
//   final String? profileImage;
//   final String? bio;
//   final DateTime? createdAt;
//   final Designation? designation;
//   final UserType? userType;
//   final IsProfileVerified? isProfileVerified;
//   final bool? isFollowed;
//   final bool? isFollowing;
//   final Avatar? avatar;
//
//   factory CreatedBy.fromJson(Map<String, dynamic> json) => CreatedBy(
//         id: json["id"],
//         username: emailValues.map[json["username"]]!,
//         email: emailValues.map[json["email"]]!,
//         phone: json["phone"],
//         firstName: firstNameValues.map[json["first_name"]]!,
//         middleName: json["middle_name"],
//         lastName: lastNameValues.map[json["last_name"]]!,
//         profileImage: json["profile_image"],
//         bio: json["bio"],
//         createdAt: json["created_at"] == null
//             ? null
//             : DateTime.parse(json["created_at"]),
//         designation: designationValues.map[json["designation"]]!,
//         userType: userTypeValues.map[json["user_type"]]!,
//         isProfileVerified:
//             isProfileVerifiedValues.map[json["is_profile_verified"]]!,
//         isFollowed: json["is_followed"],
//         isFollowing: json["is_following"],
//         avatar: json["avatar"] == null ? null : Avatar.fromJson(json["avatar"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "username": emailValues.reverse[username],
//         "email": emailValues.reverse[email],
//         "phone": phone,
//         "first_name": firstNameValues.reverse[firstName],
//         "middle_name": middleName,
//         "last_name": lastNameValues.reverse[lastName],
//         "profile_image": profileImage,
//         "bio": bio,
//         "created_at": createdAt?.toIso8601String(),
//         "designation": designationValues.reverse[designation],
//         "user_type": userTypeValues.reverse[userType],
//         "is_profile_verified":
//             isProfileVerifiedValues.reverse[isProfileVerified],
//         "is_followed": isFollowed,
//         "is_following": isFollowing,
//         "avatar": avatar?.toJson(),
//       };
// }
//
// class Avatar {
//   Avatar({
//     this.image,
//     this.id,
//   });
//
//   final String? image;
//   final int? id;
//
//   factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
//         image: json["image"],
//         id: json["id"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "image": image,
//         "id": id,
//       };
// }
//
// enum Designation { FRONTEND_DEVELOPER, TEST, EMPTY }
//
// final designationValues = EnumValues({
//   "": Designation.EMPTY,
//   "Frontend Developer": Designation.FRONTEND_DEVELOPER,
//   "test": Designation.TEST
// });
//
// enum Email {
//   SANDIPTHAPA_1_CAGTU_COM,
//   SANDIPTHAPA_2_CAGTU_COM,
//   ANANSHAKC_245_CAGTU_COM
// }
//
// final emailValues = EnumValues({
//   "ananshakc+245@cagtu.com": Email.ANANSHAKC_245_CAGTU_COM,
//   "sandipthapa+1@cagtu.com": Email.SANDIPTHAPA_1_CAGTU_COM,
//   "sandipthapa+2@cagtu.com": Email.SANDIPTHAPA_2_CAGTU_COM
// });
//
// enum FirstName { SANDIP, ANANSHA }
//
// final firstNameValues =
//     EnumValues({"Anansha": FirstName.ANANSHA, "Sandip": FirstName.SANDIP});
//
// enum IsProfileVerified { FALSE }
//
// final isProfileVerifiedValues = EnumValues({"False": IsProfileVerified.FALSE});
//
// enum LastName { THAPA, KC }
//
// final lastNameValues = EnumValues({"KC": LastName.KC, "Thapa": LastName.THAPA});
//
// enum UserType { TASKER, CLIENT_TASKER }
//
// final userTypeValues = EnumValues({
//   "[\"Client\",\"Tasker\"]": UserType.CLIENT_TASKER,
//   "[\"Tasker\"]": UserType.TASKER
// });
//
// class Currency {
//   Currency({
//     this.code,
//     this.name,
//     this.symbol,
//   });
//
//   final CurrencyCode? code;
//   final CurrencyName? name;
//   final Symbol? symbol;
//
//   factory Currency.fromJson(Map<String, dynamic> json) => Currency(
//         code: currencyCodeValues.map[json["code"]]!,
//         name: currencyNameValues.map[json["name"]]!,
//         symbol: symbolValues.map[json["symbol"]]!,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "code": currencyCodeValues.reverse[code],
//         "name": currencyNameValues.reverse[name],
//         "symbol": symbolValues.reverse[symbol],
//       };
// }
//
// enum CurrencyCode { NPR }
//
// final currencyCodeValues = EnumValues({"NPR": CurrencyCode.NPR});
//
// enum CurrencyName { NEPALESE_RUPEE }
//
// final currencyNameValues =
//     EnumValues({"Nepalese Rupee": CurrencyName.NEPALESE_RUPEE});
//
// enum Symbol { EMPTY }
//
// final symbolValues = EnumValues({"रु": Symbol.EMPTY});
//
// class Image {
//   Image({
//     this.id,
//     this.name,
//     this.size,
//     this.mediaType,
//     this.media,
//   });
//
//   final int? id;
//   final String? name;
//   final String? size;
//   final String? mediaType;
//   final String? media;
//
//   factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         name: json["name"],
//         size: json["size"],
//         mediaType: json["media_type"],
//         media: json["media"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "size": size,
//         "media_type": mediaType,
//         "media": media,
//       };
// }
//
// enum Location { REMOTE }
//
// final locationValues = EnumValues({"remote": Location.REMOTE});
//
// class Rating {
//   Rating({
//     this.rating,
//   });
//
//   final double? rating;
//
//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//         rating: json["rating"]?.toDouble(),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "rating": rating,
//       };
// }
//
// class Service {
//   Service({
//     this.id,
//     this.title,
//     this.isActive,
//     this.isVerified,
//     this.category,
//   });
//
//   final String? id;
//   final String? title;
//   final bool? isActive;
//   final bool? isVerified;
//   final Category? category;
//
//   factory Service.fromJson(Map<String, dynamic> json) => Service(
//         id: json["id"],
//         title: json["title"],
//         isActive: json["is_active"],
//         isVerified: json["is_verified"],
//         category: json["category"] == null
//             ? null
//             : Category.fromJson(json["category"]),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "is_active": isActive,
//         "is_verified": isVerified,
//         "category": category?.toJson(),
//       };
// }
//
// class Category {
//   Category({
//     this.id,
//     this.name,
//     this.level,
//     this.slug,
//   });
//
//   final int? id;
//   final CategoryName? name;
//   final int? level;
//   final Slug? slug;
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//         id: json["id"],
//         name: categoryNameValues.map[json["name"]]!,
//         level: json["level"],
//         slug: slugValues.map[json["slug"]]!,
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": categoryNameValues.reverse[name],
//         "level": level,
//         "slug": slugValues.reverse[slug],
//       };
// }
//
// enum CategoryName { REAL_ESTATE_RENTAL, HOME_RENOVATION_AND_REPAIR, OTHER }
//
// final categoryNameValues = EnumValues({
//   "Home Renovation and Repair": CategoryName.HOME_RENOVATION_AND_REPAIR,
//   "Other": CategoryName.OTHER,
//   "Real Estate Rental": CategoryName.REAL_ESTATE_RENTAL
// });
//
// enum Slug { RENTAL_REAL_ESTATE, REPAIR_INSTALLATION_HOME_RENOVATION, OTHER }
//
// final slugValues = EnumValues({
//   "other": Slug.OTHER,
//   "rental_real-estate": Slug.RENTAL_REAL_ESTATE,
//   "repair-installation_home-renovation":
//       Slug.REPAIR_INSTALLATION_HOME_RENOVATION
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
