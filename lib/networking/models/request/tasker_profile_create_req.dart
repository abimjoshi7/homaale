//Request: {
//   "first_name": "string",
//   "middle_name": "string",
//   "last_name": "string",
//   "interests": [
//     0
//   ],
//   "bio": "string",
//   "gender": "Male",
//   "profile_image": "string",
//   "date_of_birth": "2023-01-11",
//   "skill": "string",
//   "active_hour_start": "string",
//   "active_hour_end": "string",
//   "experience_level": "string",
//   "user_type": "string",
//   "hourly_rate": 0,
//   "profile_visibility": "Private",
//   "task_preferences": "string",
//   "address_line1": "string",
//   "address_line2": "string",
//   "designation": "string",
//   "points": 2147483647,
//   "remaining_points": 2147483647,
//   "following_count": 2147483647,
//   "city": 0,
//   "country": "string",
//   "language": "string",
//   "charge_currency": "string",
//   "avatar": 0
// }

//Reponse: {status: success, message: Profile Successfully created}

import 'package:dio/dio.dart';

class TaskerProfileCreateReq {
  TaskerProfileCreateReq({
    this.firstName,
    this.middleName,
    this.lastName,
    this.interests,
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
    this.designation,
    this.points,
    this.remainingPoints,
    this.followingCount,
    this.city,
    this.country,
    this.language,
    this.chargeCurrency,
    this.avatar,
  });

  final String? firstName;
  final String? middleName;
  final String? lastName;
  final List<int?>? interests;
  final String? bio;
  final String? gender;
  final MultipartFile? profileImage;
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
  final String? designation;
  final int? points;
  final int? remainingPoints;
  final int? followingCount;
  final int? city;
  final String? country;
  final String? language;
  final String? chargeCurrency;
  final int? avatar;

  factory TaskerProfileCreateReq.fromJson(Map<String, dynamic> json) =>
      TaskerProfileCreateReq(
        firstName: json['first_name'] as String?,
        middleName: json['middle_name'] as String?,
        lastName: json['last_name'] as String?,
        interests: json['interests'] == null
            ? []
            : List<int?>.from(json['interests']!.map((x) => x) as Iterable),
        bio: json['bio'] as String?,
        gender: json['gender'] as String?,
        profileImage: json['profile_image'] as MultipartFile,
        dateOfBirth: DateTime.parse(json['date_of_birth'] as String),
        skill: json['skill'] as String?,
        activeHourStart: json['active_hour_start'] as String?,
        activeHourEnd: json['active_hour_end'] as String?,
        experienceLevel: json['experience_level'] as String?,
        userType: json['user_type'] as String?,
        hourlyRate: json['hourly_rate'] as int?,
        profileVisibility: json['profile_visibility'] as String?,
        taskPreferences: json['task_preferences'] as String?,
        addressLine1: json['address_line1'] as String?,
        addressLine2: json['address_line2'] as String?,
        designation: json['designation'] as String?,
        points: json['points'] as int?,
        remainingPoints: json['remaining_points'] as int?,
        followingCount: json['following_count'] as int?,
        city: json['city'] as int?,
        country: json['country'] as String?,
        language: json['language'] as String?,
        chargeCurrency: json['charge_currency'] as String?,
        avatar: json['avatar'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'middle_name': middleName,
        'last_name': lastName,
        'interests': interests == null
            ? []
            : List<dynamic>.from(interests!.map((x) => x)),
        'bio': bio,
        'gender': gender,
        'profile_image': profileImage,
        'date_of_birth':
            "${dateOfBirth?.year.toString().padLeft(4, '0')}-${dateOfBirth?.month.toString().padLeft(2, '0')}-${dateOfBirth?.day.toString().padLeft(2, '0')}",
        'skill': skill,
        'active_hour_start': activeHourStart,
        'active_hour_end': activeHourEnd,
        'experience_level': experienceLevel,
        'user_type': userType,
        'hourly_rate': hourlyRate,
        'profile_visibility': profileVisibility,
        'task_preferences': taskPreferences,
        'address_line1': addressLine1,
        'address_line2': addressLine2,
        'designation': designation,
        'points': points,
        'remaining_points': remainingPoints,
        'following_count': followingCount,
        'city': city,
        'country': country,
        'language': language,
        'charge_currency': chargeCurrency,
        'avatar': avatar,
      };
}
