class TaskerUserData {
  TaskerUserData({
    this.id,
    this.createdAt,
    this.updatedAt,
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
    this.securityQuestions,
  });

  factory TaskerUserData.fromJson(Map<String, dynamic> json) => TaskerUserData(
        id: json['id'] as int?,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        bio: json['bio'] as String?,
        gender: json['gender'] as String?,
        profileImage: json['profile_image'] as String?,
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
        securityQuestions: json['security_questions'] == null
            ? []
            : List<int?>.from(
                json['security_questions']!.map((x) => x) as Iterable,
              ),
      );

  final int? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
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
  final String? designation;
  final int? points;
  final int? remainingPoints;
  final int? followingCount;
  final int? city;
  final String? country;
  final String? language;
  final String? chargeCurrency;
  final int? avatar;
  final List<int?>? securityQuestions;

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'bio': bio,
        'gender': gender,
        'profile_image': profileImage,
        'date_of_birth':
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
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
        'security_questions': securityQuestions == null
            ? []
            : List<dynamic>.from(securityQuestions!.map((x) => x)),
      };
}
