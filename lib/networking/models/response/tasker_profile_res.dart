// To parse this JSON data, do
//
//     final taskerProfileRes = taskerProfileResFromJson(jsonString);

import 'dart:convert';

TaskerProfileRes taskerProfileResFromJson(String str) =>
    TaskerProfileRes.fromJson(json.decode(str));

String taskerProfileResToJson(TaskerProfileRes data) =>
    json.encode(data.toJson());

class TaskerProfileRes {
  TaskerProfileRes({
    this.id,
    this.chargeCurrency,
    this.user,
    this.portfolio,
    this.experience,
    this.education,
    this.certificates,
    this.stats,
    this.rating,
    this.country,
    this.language,
    this.city,
    this.interests,
    this.isFollowed,
    this.avatar,
    this.badge,
    this.status,
    this.bio,
    this.gender,
    this.profileImage,
    this.dateOfBirth,
    this.skill,
    this.activeHourStart,
    this.activeHourEnd,
    this.experienceLevel,
    this.userType,
    this.hourlyRate,
    this.profileVisibility,
    this.taskPreferences,
    this.addressLine1,
    this.addressLine2,
    this.isProfileVerified,
    this.designation,
    this.points,
    this.remainingPoints,
    this.followersCount,
    this.followingCount,
    this.subscription,
    this.securityQuestions,
  });

  final int? id;
  final ChargeCurrency? chargeCurrency;
  final User? user;
  final String? portfolio;
  final String? experience;
  final String? education;
  final String? certificates;
  final String? stats;
  final String? rating;
  final Country? country;
  final Country? language;
  final City? city;
  final List<Interest>? interests;
  final String? isFollowed;
  final Avatar? avatar;
  final String? badge;
  final String? status;
  final String? bio;
  final String? gender;
  final String? profileImage;
  final DateTime? dateOfBirth;
  final String? skill;
  final String? activeHourStart;
  final String? activeHourEnd;
  final String? experienceLevel;
  final String? userType;
  final int? hourlyRate;
  final String? profileVisibility;
  final String? taskPreferences;
  final String? addressLine1;
  final String? addressLine2;
  final bool? isProfileVerified;
  final String? designation;
  final int? points;
  final int? remainingPoints;
  final int? followersCount;
  final int? followingCount;
  final List<int>? subscription;
  final List<int>? securityQuestions;

  factory TaskerProfileRes.fromJson(Map<String, dynamic> json) =>
      TaskerProfileRes(
        id: json["id"],
        chargeCurrency: ChargeCurrency.fromJson(json["charge_currency"]),
        user: User.fromJson(json["user"]),
        portfolio: json["portfolio"],
        experience: json["experience"],
        education: json["education"],
        certificates: json["certificates"],
        stats: json["stats"],
        rating: json["rating"],
        country: Country.fromJson(json["country"]),
        language: Country.fromJson(json["language"]),
        city: City.fromJson(json["city"]),
        interests: List<Interest>.from(
            json["interests"].map((x) => Interest.fromJson(x))),
        isFollowed: json["is_followed"],
        avatar: Avatar.fromJson(json["avatar"]),
        badge: json["badge"],
        status: json["status"],
        bio: json["bio"],
        gender: json["gender"],
        profileImage: json["profile_image"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        skill: json["skill"],
        activeHourStart: json["active_hour_start"],
        activeHourEnd: json["active_hour_end"],
        experienceLevel: json["experience_level"],
        userType: json["user_type"],
        hourlyRate: json["hourly_rate"],
        profileVisibility: json["profile_visibility"],
        taskPreferences: json["task_preferences"],
        addressLine1: json["address_line1"],
        addressLine2: json["address_line2"],
        isProfileVerified: json["is_profile_verified"],
        designation: json["designation"],
        points: json["points"],
        remainingPoints: json["remaining_points"],
        followersCount: json["followers_count"],
        followingCount: json["following_count"],
        subscription: List<int>.from(json["subscription"].map((x) => x)),
        securityQuestions:
            List<int>.from(json["security_questions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "charge_currency": chargeCurrency!.toJson(),
        "user": user?.toJson(),
        "portfolio": portfolio,
        "experience": experience,
        "education": education,
        "certificates": certificates,
        "stats": stats,
        "rating": rating,
        "country": country?.toJson(),
        "language": language?.toJson(),
        "city": city!.toJson(),
        "interests": List<dynamic>.from(interests!.map((x) => x.toJson())),
        "is_followed": isFollowed,
        "avatar": avatar?.toJson(),
        "badge": badge,
        "status": status,
        "bio": bio,
        "gender": gender,
        "profile_image": profileImage,
        "date_of_birth":
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        "skill": skill,
        "active_hour_start": activeHourStart,
        "active_hour_end": activeHourEnd,
        "experience_level": experienceLevel,
        "user_type": userType,
        "hourly_rate": hourlyRate,
        "profile_visibility": profileVisibility,
        "task_preferences": taskPreferences,
        "address_line1": addressLine1,
        "address_line2": addressLine2,
        "is_profile_verified": isProfileVerified,
        "designation": designation,
        "points": points,
        "remaining_points": remainingPoints,
        "followers_count": followersCount,
        "following_count": followingCount,
        "subscription": List<dynamic>.from(subscription!.map((x) => x)),
        "security_questions":
            List<dynamic>.from(securityQuestions!.map((x) => x)),
      };
}

class Avatar {
  Avatar({
    this.image,
  });

  final String? image;

  factory Avatar.fromJson(Map<String, dynamic> json) => Avatar(
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}

class ChargeCurrency {
  ChargeCurrency({
    this.code,
    this.name,
    this.symbol,
  });

  final String? code;
  final String? name;
  final String? symbol;

  factory ChargeCurrency.fromJson(Map<String, dynamic> json) => ChargeCurrency(
        code: json["code"],
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "name": name,
        "symbol": symbol,
      };
}

class City {
  City({
    this.id,
    this.name,
    this.localName,
    this.zipCode,
    this.latitude,
    this.longitude,
    this.country,
  });

  final int? id;
  final String? name;
  final String? localName;
  final String? zipCode;
  final int? latitude;
  final int? longitude;
  final String? country;

  factory City.fromJson(Map<String, dynamic> json) => City(
        id: json["id"],
        name: json["name"],
        localName: json["local_name"],
        zipCode: json["zip_code"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "local_name": localName,
        "zip_code": zipCode,
        "latitude": latitude,
        "longitude": longitude,
        "country": country,
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
        name: json["name"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
      };
}

class Interest {
  Interest({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.email,
    this.draftEmail,
    this.phone,
    this.draftPhone,
    this.firstName,
    this.middleName,
    this.lastName,
    this.profileImage,
    this.createdAt,
  });

  final String? id;
  final String? username;
  final String? email;
  final String? draftEmail;
  final String? phone;
  final String? draftPhone;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? profileImage;
  final DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        draftEmail: json["draft_email"],
        phone: json["phone"],
        draftPhone: json["draft_phone"],
        firstName: json["first_name"],
        middleName: json["middle_name"],
        lastName: json["last_name"],
        profileImage: json["profile_image"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "draft_email": draftEmail,
        "phone": phone,
        "draft_phone": draftPhone,
        "first_name": firstName,
        "middle_name": middleName,
        "last_name": lastName,
        "profile_image": profileImage,
        "created_at": createdAt?.toIso8601String(),
      };
}
