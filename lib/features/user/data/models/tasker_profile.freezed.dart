// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasker_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskerProfile _$TaskerProfileFromJson(Map<String, dynamic> json) {
  return _TaskerProfile.fromJson(json);
}

/// @nodoc
mixin _$TaskerProfile {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "charge_currency")
  Currency? get chargeCurrency => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Portfolio>? get portfolio => throw _privateConstructorUsedError;
  List<Experience>? get experience => throw _privateConstructorUsedError;
  List<Education>? get education => throw _privateConstructorUsedError;
  List<Certificate>? get certificates => throw _privateConstructorUsedError;
  Stats? get stats => throw _privateConstructorUsedError;
  Rating? get rating => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  Language? get language => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  List<Interest>? get interests => throw _privateConstructorUsedError;
  @JsonKey(name: "is_followed")
  bool? get isFollowed => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  List<SkillOptionModel>? get skills => throw _privateConstructorUsedError;
  @JsonKey(name: "active_hour_start")
  String? get activeHourStart => throw _privateConstructorUsedError;
  @JsonKey(name: "active_hour_end")
  String? get activeHourEnd => throw _privateConstructorUsedError;
  @JsonKey(name: "experience_level")
  String? get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_visibility")
  String? get profileVisibility => throw _privateConstructorUsedError;
  @JsonKey(name: "task_preferences")
  String? get taskPreferences => throw _privateConstructorUsedError;
  @JsonKey(name: "address_line1")
  String? get addressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: "address_line2")
  String? get addressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(name: "remaining_points")
  int? get remainingPoints => throw _privateConstructorUsedError;
  @JsonKey(name: "followers_count")
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: "following_count")
  int? get followingCount => throw _privateConstructorUsedError;
  dynamic get avatar => throw _privateConstructorUsedError;
  List<dynamic>? get subscription => throw _privateConstructorUsedError;
  @JsonKey(name: "")
  List<dynamic>? get securityQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskerProfileCopyWith<TaskerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskerProfileCopyWith<$Res> {
  factory $TaskerProfileCopyWith(
          TaskerProfile value, $Res Function(TaskerProfile) then) =
      _$TaskerProfileCopyWithImpl<$Res, TaskerProfile>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "charge_currency") Currency? chargeCurrency,
      User? user,
      List<Portfolio>? portfolio,
      List<Experience>? experience,
      List<Education>? education,
      List<Certificate>? certificates,
      Stats? stats,
      Rating? rating,
      Country? country,
      Language? language,
      City? city,
      List<Interest>? interests,
      @JsonKey(name: "is_followed") bool? isFollowed,
      Badge? badge,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      String? status,
      String? bio,
      String? gender,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      List<SkillOptionModel>? skills,
      @JsonKey(name: "active_hour_start") String? activeHourStart,
      @JsonKey(name: "active_hour_end") String? activeHourEnd,
      @JsonKey(name: "experience_level") String? experienceLevel,
      @JsonKey(name: "profile_visibility") String? profileVisibility,
      @JsonKey(name: "task_preferences") String? taskPreferences,
      @JsonKey(name: "address_line1") String? addressLine1,
      @JsonKey(name: "address_line2") String? addressLine2,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      String? designation,
      int? points,
      @JsonKey(name: "remaining_points") int? remainingPoints,
      @JsonKey(name: "followers_count") int? followersCount,
      @JsonKey(name: "following_count") int? followingCount,
      dynamic avatar,
      List<dynamic>? subscription,
      @JsonKey(name: "") List<dynamic>? securityQuestions});

  $CurrencyCopyWith<$Res>? get chargeCurrency;
  $UserCopyWith<$Res>? get user;
  $StatsCopyWith<$Res>? get stats;
  $RatingCopyWith<$Res>? get rating;
  $CountryCopyWith<$Res>? get country;
  $LanguageCopyWith<$Res>? get language;
  $CityCopyWith<$Res>? get city;
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$TaskerProfileCopyWithImpl<$Res, $Val extends TaskerProfile>
    implements $TaskerProfileCopyWith<$Res> {
  _$TaskerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? fullName = freezed,
    Object? chargeCurrency = freezed,
    Object? user = freezed,
    Object? portfolio = freezed,
    Object? experience = freezed,
    Object? education = freezed,
    Object? certificates = freezed,
    Object? stats = freezed,
    Object? rating = freezed,
    Object? country = freezed,
    Object? language = freezed,
    Object? city = freezed,
    Object? interests = freezed,
    Object? isFollowed = freezed,
    Object? badge = freezed,
    Object? isBookmarked = freezed,
    Object? status = freezed,
    Object? bio = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? skills = freezed,
    Object? activeHourStart = freezed,
    Object? activeHourEnd = freezed,
    Object? experienceLevel = freezed,
    Object? profileVisibility = freezed,
    Object? taskPreferences = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? isProfileVerified = freezed,
    Object? designation = freezed,
    Object? points = freezed,
    Object? remainingPoints = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? avatar = freezed,
    Object? subscription = freezed,
    Object? securityQuestions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeCurrency: freezed == chargeCurrency
          ? _value.chargeCurrency
          : chargeCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      portfolio: freezed == portfolio
          ? _value.portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>?,
      experience: freezed == experience
          ? _value.experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      education: freezed == education
          ? _value.education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      certificates: freezed == certificates
          ? _value.certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<Certificate>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<Interest>?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: freezed == skills
          ? _value.skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillOptionModel>?,
      activeHourStart: freezed == activeHourStart
          ? _value.activeHourStart
          : activeHourStart // ignore: cast_nullable_to_non_nullable
              as String?,
      activeHourEnd: freezed == activeHourEnd
          ? _value.activeHourEnd
          : activeHourEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      taskPreferences: freezed == taskPreferences
          ? _value.taskPreferences
          : taskPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      remainingPoints: freezed == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      securityQuestions: freezed == securityQuestions
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get chargeCurrency {
    if (_value.chargeCurrency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.chargeCurrency!, (value) {
      return _then(_value.copyWith(chargeCurrency: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StatsCopyWith<$Res>? get stats {
    if (_value.stats == null) {
      return null;
    }

    return $StatsCopyWith<$Res>(_value.stats!, (value) {
      return _then(_value.copyWith(stats: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RatingCopyWith<$Res>? get rating {
    if (_value.rating == null) {
      return null;
    }

    return $RatingCopyWith<$Res>(_value.rating!, (value) {
      return _then(_value.copyWith(rating: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LanguageCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $LanguageCopyWith<$Res>(_value.language!, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CityCopyWith<$Res>? get city {
    if (_value.city == null) {
      return null;
    }

    return $CityCopyWith<$Res>(_value.city!, (value) {
      return _then(_value.copyWith(city: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $BadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TaskerProfileCopyWith<$Res>
    implements $TaskerProfileCopyWith<$Res> {
  factory _$$_TaskerProfileCopyWith(
          _$_TaskerProfile value, $Res Function(_$_TaskerProfile) then) =
      __$$_TaskerProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "charge_currency") Currency? chargeCurrency,
      User? user,
      List<Portfolio>? portfolio,
      List<Experience>? experience,
      List<Education>? education,
      List<Certificate>? certificates,
      Stats? stats,
      Rating? rating,
      Country? country,
      Language? language,
      City? city,
      List<Interest>? interests,
      @JsonKey(name: "is_followed") bool? isFollowed,
      Badge? badge,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked,
      String? status,
      String? bio,
      String? gender,
      @JsonKey(name: "date_of_birth") DateTime? dateOfBirth,
      List<SkillOptionModel>? skills,
      @JsonKey(name: "active_hour_start") String? activeHourStart,
      @JsonKey(name: "active_hour_end") String? activeHourEnd,
      @JsonKey(name: "experience_level") String? experienceLevel,
      @JsonKey(name: "profile_visibility") String? profileVisibility,
      @JsonKey(name: "task_preferences") String? taskPreferences,
      @JsonKey(name: "address_line1") String? addressLine1,
      @JsonKey(name: "address_line2") String? addressLine2,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      String? designation,
      int? points,
      @JsonKey(name: "remaining_points") int? remainingPoints,
      @JsonKey(name: "followers_count") int? followersCount,
      @JsonKey(name: "following_count") int? followingCount,
      dynamic avatar,
      List<dynamic>? subscription,
      @JsonKey(name: "") List<dynamic>? securityQuestions});

  @override
  $CurrencyCopyWith<$Res>? get chargeCurrency;
  @override
  $UserCopyWith<$Res>? get user;
  @override
  $StatsCopyWith<$Res>? get stats;
  @override
  $RatingCopyWith<$Res>? get rating;
  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $LanguageCopyWith<$Res>? get language;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_TaskerProfileCopyWithImpl<$Res>
    extends _$TaskerProfileCopyWithImpl<$Res, _$_TaskerProfile>
    implements _$$_TaskerProfileCopyWith<$Res> {
  __$$_TaskerProfileCopyWithImpl(
      _$_TaskerProfile _value, $Res Function(_$_TaskerProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? profileImage = freezed,
    Object? fullName = freezed,
    Object? chargeCurrency = freezed,
    Object? user = freezed,
    Object? portfolio = freezed,
    Object? experience = freezed,
    Object? education = freezed,
    Object? certificates = freezed,
    Object? stats = freezed,
    Object? rating = freezed,
    Object? country = freezed,
    Object? language = freezed,
    Object? city = freezed,
    Object? interests = freezed,
    Object? isFollowed = freezed,
    Object? badge = freezed,
    Object? isBookmarked = freezed,
    Object? status = freezed,
    Object? bio = freezed,
    Object? gender = freezed,
    Object? dateOfBirth = freezed,
    Object? skills = freezed,
    Object? activeHourStart = freezed,
    Object? activeHourEnd = freezed,
    Object? experienceLevel = freezed,
    Object? profileVisibility = freezed,
    Object? taskPreferences = freezed,
    Object? addressLine1 = freezed,
    Object? addressLine2 = freezed,
    Object? isProfileVerified = freezed,
    Object? designation = freezed,
    Object? points = freezed,
    Object? remainingPoints = freezed,
    Object? followersCount = freezed,
    Object? followingCount = freezed,
    Object? avatar = freezed,
    Object? subscription = freezed,
    Object? securityQuestions = freezed,
  }) {
    return _then(_$_TaskerProfile(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeCurrency: freezed == chargeCurrency
          ? _value.chargeCurrency
          : chargeCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      portfolio: freezed == portfolio
          ? _value._portfolio
          : portfolio // ignore: cast_nullable_to_non_nullable
              as List<Portfolio>?,
      experience: freezed == experience
          ? _value._experience
          : experience // ignore: cast_nullable_to_non_nullable
              as List<Experience>?,
      education: freezed == education
          ? _value._education
          : education // ignore: cast_nullable_to_non_nullable
              as List<Education>?,
      certificates: freezed == certificates
          ? _value._certificates
          : certificates // ignore: cast_nullable_to_non_nullable
              as List<Certificate>?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as Rating?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as Language?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<Interest>?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      skills: freezed == skills
          ? _value._skills
          : skills // ignore: cast_nullable_to_non_nullable
              as List<SkillOptionModel>?,
      activeHourStart: freezed == activeHourStart
          ? _value.activeHourStart
          : activeHourStart // ignore: cast_nullable_to_non_nullable
              as String?,
      activeHourEnd: freezed == activeHourEnd
          ? _value.activeHourEnd
          : activeHourEnd // ignore: cast_nullable_to_non_nullable
              as String?,
      experienceLevel: freezed == experienceLevel
          ? _value.experienceLevel
          : experienceLevel // ignore: cast_nullable_to_non_nullable
              as String?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as String?,
      taskPreferences: freezed == taskPreferences
          ? _value.taskPreferences
          : taskPreferences // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine1: freezed == addressLine1
          ? _value.addressLine1
          : addressLine1 // ignore: cast_nullable_to_non_nullable
              as String?,
      addressLine2: freezed == addressLine2
          ? _value.addressLine2
          : addressLine2 // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int?,
      remainingPoints: freezed == remainingPoints
          ? _value.remainingPoints
          : remainingPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      followersCount: freezed == followersCount
          ? _value.followersCount
          : followersCount // ignore: cast_nullable_to_non_nullable
              as int?,
      followingCount: freezed == followingCount
          ? _value.followingCount
          : followingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subscription: freezed == subscription
          ? _value._subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      securityQuestions: freezed == securityQuestions
          ? _value._securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskerProfile implements _TaskerProfile {
  const _$_TaskerProfile(
      {this.id,
      @JsonKey(name: "profile_image") this.profileImage,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "charge_currency") this.chargeCurrency,
      this.user,
      final List<Portfolio>? portfolio,
      final List<Experience>? experience,
      final List<Education>? education,
      final List<Certificate>? certificates,
      this.stats,
      this.rating,
      this.country,
      this.language,
      this.city,
      final List<Interest>? interests,
      @JsonKey(name: "is_followed") this.isFollowed,
      this.badge,
      @JsonKey(name: "is_bookmarked") this.isBookmarked,
      this.status,
      this.bio,
      this.gender,
      @JsonKey(name: "date_of_birth") this.dateOfBirth,
      final List<SkillOptionModel>? skills,
      @JsonKey(name: "active_hour_start") this.activeHourStart,
      @JsonKey(name: "active_hour_end") this.activeHourEnd,
      @JsonKey(name: "experience_level") this.experienceLevel,
      @JsonKey(name: "profile_visibility") this.profileVisibility,
      @JsonKey(name: "task_preferences") this.taskPreferences,
      @JsonKey(name: "address_line1") this.addressLine1,
      @JsonKey(name: "address_line2") this.addressLine2,
      @JsonKey(name: "is_profile_verified") this.isProfileVerified,
      this.designation,
      this.points,
      @JsonKey(name: "remaining_points") this.remainingPoints,
      @JsonKey(name: "followers_count") this.followersCount,
      @JsonKey(name: "following_count") this.followingCount,
      this.avatar,
      final List<dynamic>? subscription,
      @JsonKey(name: "") final List<dynamic>? securityQuestions})
      : _portfolio = portfolio,
        _experience = experience,
        _education = education,
        _certificates = certificates,
        _interests = interests,
        _skills = skills,
        _subscription = subscription,
        _securityQuestions = securityQuestions;

  factory _$_TaskerProfile.fromJson(Map<String, dynamic> json) =>
      _$$_TaskerProfileFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "charge_currency")
  final Currency? chargeCurrency;
  @override
  final User? user;
  final List<Portfolio>? _portfolio;
  @override
  List<Portfolio>? get portfolio {
    final value = _portfolio;
    if (value == null) return null;
    if (_portfolio is EqualUnmodifiableListView) return _portfolio;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Experience>? _experience;
  @override
  List<Experience>? get experience {
    final value = _experience;
    if (value == null) return null;
    if (_experience is EqualUnmodifiableListView) return _experience;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Education>? _education;
  @override
  List<Education>? get education {
    final value = _education;
    if (value == null) return null;
    if (_education is EqualUnmodifiableListView) return _education;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Certificate>? _certificates;
  @override
  List<Certificate>? get certificates {
    final value = _certificates;
    if (value == null) return null;
    if (_certificates is EqualUnmodifiableListView) return _certificates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Stats? stats;
  @override
  final Rating? rating;
  @override
  final Country? country;
  @override
  final Language? language;
  @override
  final City? city;
  final List<Interest>? _interests;
  @override
  List<Interest>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "is_followed")
  final bool? isFollowed;
  @override
  final Badge? badge;
  @override
  @JsonKey(name: "is_bookmarked")
  final bool? isBookmarked;
  @override
  final String? status;
  @override
  final String? bio;
  @override
  final String? gender;
  @override
  @JsonKey(name: "date_of_birth")
  final DateTime? dateOfBirth;
  final List<SkillOptionModel>? _skills;
  @override
  List<SkillOptionModel>? get skills {
    final value = _skills;
    if (value == null) return null;
    if (_skills is EqualUnmodifiableListView) return _skills;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "active_hour_start")
  final String? activeHourStart;
  @override
  @JsonKey(name: "active_hour_end")
  final String? activeHourEnd;
  @override
  @JsonKey(name: "experience_level")
  final String? experienceLevel;
  @override
  @JsonKey(name: "profile_visibility")
  final String? profileVisibility;
  @override
  @JsonKey(name: "task_preferences")
  final String? taskPreferences;
  @override
  @JsonKey(name: "address_line1")
  final String? addressLine1;
  @override
  @JsonKey(name: "address_line2")
  final String? addressLine2;
  @override
  @JsonKey(name: "is_profile_verified")
  final bool? isProfileVerified;
  @override
  final String? designation;
  @override
  final int? points;
  @override
  @JsonKey(name: "remaining_points")
  final int? remainingPoints;
  @override
  @JsonKey(name: "followers_count")
  final int? followersCount;
  @override
  @JsonKey(name: "following_count")
  final int? followingCount;
  @override
  final dynamic avatar;
  final List<dynamic>? _subscription;
  @override
  List<dynamic>? get subscription {
    final value = _subscription;
    if (value == null) return null;
    if (_subscription is EqualUnmodifiableListView) return _subscription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _securityQuestions;
  @override
  @JsonKey(name: "")
  List<dynamic>? get securityQuestions {
    final value = _securityQuestions;
    if (value == null) return null;
    if (_securityQuestions is EqualUnmodifiableListView)
      return _securityQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskerProfile(id: $id, profileImage: $profileImage, fullName: $fullName, chargeCurrency: $chargeCurrency, user: $user, portfolio: $portfolio, experience: $experience, education: $education, certificates: $certificates, stats: $stats, rating: $rating, country: $country, language: $language, city: $city, interests: $interests, isFollowed: $isFollowed, badge: $badge, isBookmarked: $isBookmarked, status: $status, bio: $bio, gender: $gender, dateOfBirth: $dateOfBirth, skills: $skills, activeHourStart: $activeHourStart, activeHourEnd: $activeHourEnd, experienceLevel: $experienceLevel, profileVisibility: $profileVisibility, taskPreferences: $taskPreferences, addressLine1: $addressLine1, addressLine2: $addressLine2, isProfileVerified: $isProfileVerified, designation: $designation, points: $points, remainingPoints: $remainingPoints, followersCount: $followersCount, followingCount: $followingCount, avatar: $avatar, subscription: $subscription, securityQuestions: $securityQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskerProfile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.chargeCurrency, chargeCurrency) ||
                other.chargeCurrency == chargeCurrency) &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._portfolio, _portfolio) &&
            const DeepCollectionEquality()
                .equals(other._experience, _experience) &&
            const DeepCollectionEquality()
                .equals(other._education, _education) &&
            const DeepCollectionEquality()
                .equals(other._certificates, _certificates) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.badge, badge) || other.badge == badge) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            const DeepCollectionEquality().equals(other._skills, _skills) &&
            (identical(other.activeHourStart, activeHourStart) ||
                other.activeHourStart == activeHourStart) &&
            (identical(other.activeHourEnd, activeHourEnd) ||
                other.activeHourEnd == activeHourEnd) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility) &&
            (identical(other.taskPreferences, taskPreferences) ||
                other.taskPreferences == taskPreferences) &&
            (identical(other.addressLine1, addressLine1) ||
                other.addressLine1 == addressLine1) &&
            (identical(other.addressLine2, addressLine2) ||
                other.addressLine2 == addressLine2) &&
            (identical(other.isProfileVerified, isProfileVerified) ||
                other.isProfileVerified == isProfileVerified) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.remainingPoints, remainingPoints) ||
                other.remainingPoints == remainingPoints) &&
            (identical(other.followersCount, followersCount) ||
                other.followersCount == followersCount) &&
            (identical(other.followingCount, followingCount) ||
                other.followingCount == followingCount) &&
            const DeepCollectionEquality().equals(other.avatar, avatar) &&
            const DeepCollectionEquality()
                .equals(other._subscription, _subscription) &&
            const DeepCollectionEquality()
                .equals(other._securityQuestions, _securityQuestions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        profileImage,
        fullName,
        chargeCurrency,
        user,
        const DeepCollectionEquality().hash(_portfolio),
        const DeepCollectionEquality().hash(_experience),
        const DeepCollectionEquality().hash(_education),
        const DeepCollectionEquality().hash(_certificates),
        stats,
        rating,
        country,
        language,
        city,
        const DeepCollectionEquality().hash(_interests),
        isFollowed,
        badge,
        isBookmarked,
        status,
        bio,
        gender,
        dateOfBirth,
        const DeepCollectionEquality().hash(_skills),
        activeHourStart,
        activeHourEnd,
        experienceLevel,
        profileVisibility,
        taskPreferences,
        addressLine1,
        addressLine2,
        isProfileVerified,
        designation,
        points,
        remainingPoints,
        followersCount,
        followingCount,
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(_subscription),
        const DeepCollectionEquality().hash(_securityQuestions)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskerProfileCopyWith<_$_TaskerProfile> get copyWith =>
      __$$_TaskerProfileCopyWithImpl<_$_TaskerProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskerProfileToJson(
      this,
    );
  }
}

abstract class _TaskerProfile implements TaskerProfile {
  const factory _TaskerProfile(
          {final int? id,
          @JsonKey(name: "profile_image") final String? profileImage,
          @JsonKey(name: "full_name") final String? fullName,
          @JsonKey(name: "charge_currency") final Currency? chargeCurrency,
          final User? user,
          final List<Portfolio>? portfolio,
          final List<Experience>? experience,
          final List<Education>? education,
          final List<Certificate>? certificates,
          final Stats? stats,
          final Rating? rating,
          final Country? country,
          final Language? language,
          final City? city,
          final List<Interest>? interests,
          @JsonKey(name: "is_followed") final bool? isFollowed,
          final Badge? badge,
          @JsonKey(name: "is_bookmarked") final bool? isBookmarked,
          final String? status,
          final String? bio,
          final String? gender,
          @JsonKey(name: "date_of_birth") final DateTime? dateOfBirth,
          final List<SkillOptionModel>? skills,
          @JsonKey(name: "active_hour_start") final String? activeHourStart,
          @JsonKey(name: "active_hour_end") final String? activeHourEnd,
          @JsonKey(name: "experience_level") final String? experienceLevel,
          @JsonKey(name: "profile_visibility") final String? profileVisibility,
          @JsonKey(name: "task_preferences") final String? taskPreferences,
          @JsonKey(name: "address_line1") final String? addressLine1,
          @JsonKey(name: "address_line2") final String? addressLine2,
          @JsonKey(name: "is_profile_verified") final bool? isProfileVerified,
          final String? designation,
          final int? points,
          @JsonKey(name: "remaining_points") final int? remainingPoints,
          @JsonKey(name: "followers_count") final int? followersCount,
          @JsonKey(name: "following_count") final int? followingCount,
          final dynamic avatar,
          final List<dynamic>? subscription,
          @JsonKey(name: "") final List<dynamic>? securityQuestions}) =
      _$_TaskerProfile;

  factory _TaskerProfile.fromJson(Map<String, dynamic> json) =
      _$_TaskerProfile.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "charge_currency")
  Currency? get chargeCurrency;
  @override
  User? get user;
  @override
  List<Portfolio>? get portfolio;
  @override
  List<Experience>? get experience;
  @override
  List<Education>? get education;
  @override
  List<Certificate>? get certificates;
  @override
  Stats? get stats;
  @override
  Rating? get rating;
  @override
  Country? get country;
  @override
  Language? get language;
  @override
  City? get city;
  @override
  List<Interest>? get interests;
  @override
  @JsonKey(name: "is_followed")
  bool? get isFollowed;
  @override
  Badge? get badge;
  @override
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked;
  @override
  String? get status;
  @override
  String? get bio;
  @override
  String? get gender;
  @override
  @JsonKey(name: "date_of_birth")
  DateTime? get dateOfBirth;
  @override
  List<SkillOptionModel>? get skills;
  @override
  @JsonKey(name: "active_hour_start")
  String? get activeHourStart;
  @override
  @JsonKey(name: "active_hour_end")
  String? get activeHourEnd;
  @override
  @JsonKey(name: "experience_level")
  String? get experienceLevel;
  @override
  @JsonKey(name: "profile_visibility")
  String? get profileVisibility;
  @override
  @JsonKey(name: "task_preferences")
  String? get taskPreferences;
  @override
  @JsonKey(name: "address_line1")
  String? get addressLine1;
  @override
  @JsonKey(name: "address_line2")
  String? get addressLine2;
  @override
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified;
  @override
  String? get designation;
  @override
  int? get points;
  @override
  @JsonKey(name: "remaining_points")
  int? get remainingPoints;
  @override
  @JsonKey(name: "followers_count")
  int? get followersCount;
  @override
  @JsonKey(name: "following_count")
  int? get followingCount;
  @override
  dynamic get avatar;
  @override
  List<dynamic>? get subscription;
  @override
  @JsonKey(name: "")
  List<dynamic>? get securityQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_TaskerProfileCopyWith<_$_TaskerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class _$BadgeCopyWithImpl<$Res, $Val extends Badge>
    implements $BadgeCopyWith<$Res> {
  _$BadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$_BadgeCopyWith(_$_Badge value, $Res Function(_$_Badge) then) =
      __$$_BadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class __$$_BadgeCopyWithImpl<$Res> extends _$BadgeCopyWithImpl<$Res, _$_Badge>
    implements _$$_BadgeCopyWith<$Res> {
  __$$_BadgeCopyWithImpl(_$_Badge _value, $Res Function(_$_Badge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_Badge(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Badge implements _Badge {
  const _$_Badge({this.id, this.image, this.title});

  factory _$_Badge.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? title;

  @override
  String toString() {
    return 'Badge(id: $id, image: $image, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Badge &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, image, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BadgeCopyWith<_$_Badge> get copyWith =>
      __$$_BadgeCopyWithImpl<_$_Badge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BadgeToJson(
      this,
    );
  }
}

abstract class _Badge implements Badge {
  const factory _Badge(
      {final int? id, final String? image, final String? title}) = _$_Badge;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$_Badge.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeCopyWith<_$_Badge> get copyWith =>
      throw _privateConstructorUsedError;
}

Language _$LanguageFromJson(Map<String, dynamic> json) {
  return _Language.fromJson(json);
}

/// @nodoc
mixin _$Language {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LanguageCopyWith<Language> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LanguageCopyWith<$Res> {
  factory $LanguageCopyWith(Language value, $Res Function(Language) then) =
      _$LanguageCopyWithImpl<$Res, Language>;
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class _$LanguageCopyWithImpl<$Res, $Val extends Language>
    implements $LanguageCopyWith<$Res> {
  _$LanguageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LanguageCopyWith<$Res> implements $LanguageCopyWith<$Res> {
  factory _$$_LanguageCopyWith(
          _$_Language value, $Res Function(_$_Language) then) =
      __$$_LanguageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class __$$_LanguageCopyWithImpl<$Res>
    extends _$LanguageCopyWithImpl<$Res, _$_Language>
    implements _$$_LanguageCopyWith<$Res> {
  __$$_LanguageCopyWithImpl(
      _$_Language _value, $Res Function(_$_Language) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Language(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Language implements _Language {
  const _$_Language({this.name, this.code});

  factory _$_Language.fromJson(Map<String, dynamic> json) =>
      _$$_LanguageFromJson(json);

  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'Language(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Language &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      __$$_LanguageCopyWithImpl<_$_Language>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LanguageToJson(
      this,
    );
  }
}

abstract class _Language implements Language {
  const factory _Language({final String? name, final String? code}) =
      _$_Language;

  factory _Language.fromJson(Map<String, dynamic> json) = _$_Language.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_LanguageCopyWith<_$_Language> get copyWith =>
      throw _privateConstructorUsedError;
}

Experience _$ExperienceFromJson(Map<String, dynamic> json) {
  return _Experience.fromJson(json);
}

/// @nodoc
mixin _$Experience {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "employment_type")
  String? get employmentType => throw _privateConstructorUsedError;
  @JsonKey(name: "company_name")
  String? get companyName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "currently_working")
  bool? get currentlyWorking => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExperienceCopyWith<Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperienceCopyWith<$Res> {
  factory $ExperienceCopyWith(
          Experience value, $Res Function(Experience) then) =
      _$ExperienceCopyWithImpl<$Res, Experience>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      @JsonKey(name: "employment_type") String? employmentType,
      @JsonKey(name: "company_name") String? companyName,
      String? location,
      @JsonKey(name: "currently_working") bool? currentlyWorking,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate});
}

/// @nodoc
class _$ExperienceCopyWithImpl<$Res, $Val extends Experience>
    implements $ExperienceCopyWith<$Res> {
  _$ExperienceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? employmentType = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? currentlyWorking = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      employmentType: freezed == employmentType
          ? _value.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      currentlyWorking: freezed == currentlyWorking
          ? _value.currentlyWorking
          : currentlyWorking // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExperienceCopyWith<$Res>
    implements $ExperienceCopyWith<$Res> {
  factory _$$_ExperienceCopyWith(
          _$_Experience value, $Res Function(_$_Experience) then) =
      __$$_ExperienceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      @JsonKey(name: "employment_type") String? employmentType,
      @JsonKey(name: "company_name") String? companyName,
      String? location,
      @JsonKey(name: "currently_working") bool? currentlyWorking,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate});
}

/// @nodoc
class __$$_ExperienceCopyWithImpl<$Res>
    extends _$ExperienceCopyWithImpl<$Res, _$_Experience>
    implements _$$_ExperienceCopyWith<$Res> {
  __$$_ExperienceCopyWithImpl(
      _$_Experience _value, $Res Function(_$_Experience) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? employmentType = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? currentlyWorking = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_Experience(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      employmentType: freezed == employmentType
          ? _value.employmentType
          : employmentType // ignore: cast_nullable_to_non_nullable
              as String?,
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      currentlyWorking: freezed == currentlyWorking
          ? _value.currentlyWorking
          : currentlyWorking // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Experience implements _Experience {
  const _$_Experience(
      {this.id,
      this.title,
      this.description,
      @JsonKey(name: "employment_type") this.employmentType,
      @JsonKey(name: "company_name") this.companyName,
      this.location,
      @JsonKey(name: "currently_working") this.currentlyWorking,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate});

  factory _$_Experience.fromJson(Map<String, dynamic> json) =>
      _$$_ExperienceFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "employment_type")
  final String? employmentType;
  @override
  @JsonKey(name: "company_name")
  final String? companyName;
  @override
  final String? location;
  @override
  @JsonKey(name: "currently_working")
  final bool? currentlyWorking;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;

  @override
  String toString() {
    return 'Experience(id: $id, title: $title, description: $description, employmentType: $employmentType, companyName: $companyName, location: $location, currentlyWorking: $currentlyWorking, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Experience &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.employmentType, employmentType) ||
                other.employmentType == employmentType) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.currentlyWorking, currentlyWorking) ||
                other.currentlyWorking == currentlyWorking) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      employmentType,
      companyName,
      location,
      currentlyWorking,
      startDate,
      endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      __$$_ExperienceCopyWithImpl<_$_Experience>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExperienceToJson(
      this,
    );
  }
}

abstract class _Experience implements Experience {
  const factory _Experience(
      {final int? id,
      final String? title,
      final String? description,
      @JsonKey(name: "employment_type") final String? employmentType,
      @JsonKey(name: "company_name") final String? companyName,
      final String? location,
      @JsonKey(name: "currently_working") final bool? currentlyWorking,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate}) = _$_Experience;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$_Experience.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "employment_type")
  String? get employmentType;
  @override
  @JsonKey(name: "company_name")
  String? get companyName;
  @override
  String? get location;
  @override
  @JsonKey(name: "currently_working")
  bool? get currentlyWorking;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
      throw _privateConstructorUsedError;
}

Education _$EducationFromJson(Map<String, dynamic> json) {
  return _Education.fromJson(json);
}

/// @nodoc
mixin _$Education {
  int? get id => throw _privateConstructorUsedError;
  String? get school => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get degree => throw _privateConstructorUsedError;
  @JsonKey(name: "field_of_study")
  String? get fieldOfStudy => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EducationCopyWith<Education> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationCopyWith<$Res> {
  factory $EducationCopyWith(Education value, $Res Function(Education) then) =
      _$EducationCopyWithImpl<$Res, Education>;
  @useResult
  $Res call(
      {int? id,
      String? school,
      String? description,
      String? degree,
      @JsonKey(name: "field_of_study") String? fieldOfStudy,
      String? location,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate});
}

/// @nodoc
class _$EducationCopyWithImpl<$Res, $Val extends Education>
    implements $EducationCopyWith<$Res> {
  _$EducationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? school = freezed,
    Object? description = freezed,
    Object? degree = freezed,
    Object? fieldOfStudy = freezed,
    Object? location = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EducationCopyWith<$Res> implements $EducationCopyWith<$Res> {
  factory _$$_EducationCopyWith(
          _$_Education value, $Res Function(_$_Education) then) =
      __$$_EducationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? school,
      String? description,
      String? degree,
      @JsonKey(name: "field_of_study") String? fieldOfStudy,
      String? location,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate});
}

/// @nodoc
class __$$_EducationCopyWithImpl<$Res>
    extends _$EducationCopyWithImpl<$Res, _$_Education>
    implements _$$_EducationCopyWith<$Res> {
  __$$_EducationCopyWithImpl(
      _$_Education _value, $Res Function(_$_Education) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? school = freezed,
    Object? description = freezed,
    Object? degree = freezed,
    Object? fieldOfStudy = freezed,
    Object? location = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$_Education(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      fieldOfStudy: freezed == fieldOfStudy
          ? _value.fieldOfStudy
          : fieldOfStudy // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Education implements _Education {
  const _$_Education(
      {this.id,
      this.school,
      this.description,
      this.degree,
      @JsonKey(name: "field_of_study") this.fieldOfStudy,
      this.location,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate});

  factory _$_Education.fromJson(Map<String, dynamic> json) =>
      _$$_EducationFromJson(json);

  @override
  final int? id;
  @override
  final String? school;
  @override
  final String? description;
  @override
  final String? degree;
  @override
  @JsonKey(name: "field_of_study")
  final String? fieldOfStudy;
  @override
  final String? location;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;

  @override
  String toString() {
    return 'Education(id: $id, school: $school, description: $description, degree: $degree, fieldOfStudy: $fieldOfStudy, location: $location, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Education &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.fieldOfStudy, fieldOfStudy) ||
                other.fieldOfStudy == fieldOfStudy) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, school, description, degree,
      fieldOfStudy, location, startDate, endDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      __$$_EducationCopyWithImpl<_$_Education>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EducationToJson(
      this,
    );
  }
}

abstract class _Education implements Education {
  const factory _Education(
      {final int? id,
      final String? school,
      final String? description,
      final String? degree,
      @JsonKey(name: "field_of_study") final String? fieldOfStudy,
      final String? location,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate}) = _$_Education;

  factory _Education.fromJson(Map<String, dynamic> json) =
      _$_Education.fromJson;

  @override
  int? get id;
  @override
  String? get school;
  @override
  String? get description;
  @override
  String? get degree;
  @override
  @JsonKey(name: "field_of_study")
  String? get fieldOfStudy;
  @override
  String? get location;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
      throw _privateConstructorUsedError;
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return _Certificate.fromJson(json);
}

/// @nodoc
mixin _$Certificate {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: "issuing_organization")
  String? get issuingOrganization => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  bool? get doesExpire => throw _privateConstructorUsedError;
  @JsonKey(name: "credential_id")
  String? get credentialId => throw _privateConstructorUsedError;
  @JsonKey(name: "certificate_url")
  String? get certificateUrl => throw _privateConstructorUsedError;
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "expire_date")
  DateTime? get expireDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CertificateCopyWith<Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CertificateCopyWith<$Res> {
  factory $CertificateCopyWith(
          Certificate value, $Res Function(Certificate) then) =
      _$CertificateCopyWithImpl<$Res, Certificate>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: "issuing_organization") String? issuingOrganization,
      String? description,
      bool? doesExpire,
      @JsonKey(name: "credential_id") String? credentialId,
      @JsonKey(name: "certificate_url") String? certificateUrl,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "expire_date") DateTime? expireDate});
}

/// @nodoc
class _$CertificateCopyWithImpl<$Res, $Val extends Certificate>
    implements $CertificateCopyWith<$Res> {
  _$CertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? issuingOrganization = freezed,
    Object? description = freezed,
    Object? doesExpire = freezed,
    Object? credentialId = freezed,
    Object? certificateUrl = freezed,
    Object? issuedDate = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingOrganization: freezed == issuingOrganization
          ? _value.issuingOrganization
          : issuingOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      doesExpire: freezed == doesExpire
          ? _value.doesExpire
          : doesExpire // ignore: cast_nullable_to_non_nullable
              as bool?,
      credentialId: freezed == credentialId
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateUrl: freezed == certificateUrl
          ? _value.certificateUrl
          : certificateUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CertificateCopyWith<$Res>
    implements $CertificateCopyWith<$Res> {
  factory _$$_CertificateCopyWith(
          _$_Certificate value, $Res Function(_$_Certificate) then) =
      __$$_CertificateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: "issuing_organization") String? issuingOrganization,
      String? description,
      bool? doesExpire,
      @JsonKey(name: "credential_id") String? credentialId,
      @JsonKey(name: "certificate_url") String? certificateUrl,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "expire_date") DateTime? expireDate});
}

/// @nodoc
class __$$_CertificateCopyWithImpl<$Res>
    extends _$CertificateCopyWithImpl<$Res, _$_Certificate>
    implements _$$_CertificateCopyWith<$Res> {
  __$$_CertificateCopyWithImpl(
      _$_Certificate _value, $Res Function(_$_Certificate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? issuingOrganization = freezed,
    Object? description = freezed,
    Object? doesExpire = freezed,
    Object? credentialId = freezed,
    Object? certificateUrl = freezed,
    Object? issuedDate = freezed,
    Object? expireDate = freezed,
  }) {
    return _then(_$_Certificate(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      issuingOrganization: freezed == issuingOrganization
          ? _value.issuingOrganization
          : issuingOrganization // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      doesExpire: freezed == doesExpire
          ? _value.doesExpire
          : doesExpire // ignore: cast_nullable_to_non_nullable
              as bool?,
      credentialId: freezed == credentialId
          ? _value.credentialId
          : credentialId // ignore: cast_nullable_to_non_nullable
              as String?,
      certificateUrl: freezed == certificateUrl
          ? _value.certificateUrl
          : certificateUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expireDate: freezed == expireDate
          ? _value.expireDate
          : expireDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Certificate implements _Certificate {
  const _$_Certificate(
      {this.id,
      this.name,
      @JsonKey(name: "issuing_organization") this.issuingOrganization,
      this.description,
      this.doesExpire,
      @JsonKey(name: "credential_id") this.credentialId,
      @JsonKey(name: "certificate_url") this.certificateUrl,
      @JsonKey(name: "issued_date") this.issuedDate,
      @JsonKey(name: "expire_date") this.expireDate});

  factory _$_Certificate.fromJson(Map<String, dynamic> json) =>
      _$$_CertificateFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: "issuing_organization")
  final String? issuingOrganization;
  @override
  final String? description;
  @override
  final bool? doesExpire;
  @override
  @JsonKey(name: "credential_id")
  final String? credentialId;
  @override
  @JsonKey(name: "certificate_url")
  final String? certificateUrl;
  @override
  @JsonKey(name: "issued_date")
  final DateTime? issuedDate;
  @override
  @JsonKey(name: "expire_date")
  final DateTime? expireDate;

  @override
  String toString() {
    return 'Certificate(id: $id, name: $name, issuingOrganization: $issuingOrganization, description: $description, doesExpire: $doesExpire, credentialId: $credentialId, certificateUrl: $certificateUrl, issuedDate: $issuedDate, expireDate: $expireDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Certificate &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.issuingOrganization, issuingOrganization) ||
                other.issuingOrganization == issuingOrganization) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.doesExpire, doesExpire) ||
                other.doesExpire == doesExpire) &&
            (identical(other.credentialId, credentialId) ||
                other.credentialId == credentialId) &&
            (identical(other.certificateUrl, certificateUrl) ||
                other.certificateUrl == certificateUrl) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.expireDate, expireDate) ||
                other.expireDate == expireDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      issuingOrganization,
      description,
      doesExpire,
      credentialId,
      certificateUrl,
      issuedDate,
      expireDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CertificateCopyWith<_$_Certificate> get copyWith =>
      __$$_CertificateCopyWithImpl<_$_Certificate>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CertificateToJson(
      this,
    );
  }
}

abstract class _Certificate implements Certificate {
  const factory _Certificate(
      {final int? id,
      final String? name,
      @JsonKey(name: "issuing_organization")
          final String? issuingOrganization,
      final String? description,
      final bool? doesExpire,
      @JsonKey(name: "credential_id")
          final String? credentialId,
      @JsonKey(name: "certificate_url")
          final String? certificateUrl,
      @JsonKey(name: "issued_date")
          final DateTime? issuedDate,
      @JsonKey(name: "expire_date")
          final DateTime? expireDate}) = _$_Certificate;

  factory _Certificate.fromJson(Map<String, dynamic> json) =
      _$_Certificate.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: "issuing_organization")
  String? get issuingOrganization;
  @override
  String? get description;
  @override
  bool? get doesExpire;
  @override
  @JsonKey(name: "credential_id")
  String? get credentialId;
  @override
  @JsonKey(name: "certificate_url")
  String? get certificateUrl;
  @override
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate;
  @override
  @JsonKey(name: "expire_date")
  DateTime? get expireDate;
  @override
  @JsonKey(ignore: true)
  _$$_CertificateCopyWith<_$_Certificate> get copyWith =>
      throw _privateConstructorUsedError;
}

Interest _$InterestFromJson(Map<String, dynamic> json) {
  return _Interest.fromJson(json);
}

/// @nodoc
mixin _$Interest {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterestCopyWith<Interest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestCopyWith<$Res> {
  factory $InterestCopyWith(Interest value, $Res Function(Interest) then) =
      _$InterestCopyWithImpl<$Res, Interest>;
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class _$InterestCopyWithImpl<$Res, $Val extends Interest>
    implements $InterestCopyWith<$Res> {
  _$InterestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InterestCopyWith<$Res> implements $InterestCopyWith<$Res> {
  factory _$$_InterestCopyWith(
          _$_Interest value, $Res Function(_$_Interest) then) =
      __$$_InterestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name});
}

/// @nodoc
class __$$_InterestCopyWithImpl<$Res>
    extends _$InterestCopyWithImpl<$Res, _$_Interest>
    implements _$$_InterestCopyWith<$Res> {
  __$$_InterestCopyWithImpl(
      _$_Interest _value, $Res Function(_$_Interest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$_Interest(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Interest implements _Interest {
  const _$_Interest({this.id, this.name});

  factory _$_Interest.fromJson(Map<String, dynamic> json) =>
      _$$_InterestFromJson(json);

  @override
  final int? id;
  @override
  final String? name;

  @override
  String toString() {
    return 'Interest(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Interest &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InterestCopyWith<_$_Interest> get copyWith =>
      __$$_InterestCopyWithImpl<_$_Interest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InterestToJson(
      this,
    );
  }
}

abstract class _Interest implements Interest {
  const factory _Interest({final int? id, final String? name}) = _$_Interest;

  factory _Interest.fromJson(Map<String, dynamic> json) = _$_Interest.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$_InterestCopyWith<_$_Interest> get copyWith =>
      throw _privateConstructorUsedError;
}

Portfolio _$PortfolioFromJson(Map<String, dynamic> json) {
  return _Portfolio.fromJson(json);
}

/// @nodoc
mixin _$Portfolio {
  int? get id => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<dynamic>? get files => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: "credential_url")
  String? get credentialUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PortfolioCopyWith<Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PortfolioCopyWith<$Res> {
  factory $PortfolioCopyWith(Portfolio value, $Res Function(Portfolio) then) =
      _$PortfolioCopyWithImpl<$Res, Portfolio>;
  @useResult
  $Res call(
      {int? id,
      List<Image>? images,
      List<dynamic>? files,
      String? title,
      String? description,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "credential_url") String? credentialUrl});
}

/// @nodoc
class _$PortfolioCopyWithImpl<$Res, $Val extends Portfolio>
    implements $PortfolioCopyWith<$Res> {
  _$PortfolioCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = freezed,
    Object? files = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? issuedDate = freezed,
    Object? credentialUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      files: freezed == files
          ? _value.files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      credentialUrl: freezed == credentialUrl
          ? _value.credentialUrl
          : credentialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PortfolioCopyWith<$Res> implements $PortfolioCopyWith<$Res> {
  factory _$$_PortfolioCopyWith(
          _$_Portfolio value, $Res Function(_$_Portfolio) then) =
      __$$_PortfolioCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      List<Image>? images,
      List<dynamic>? files,
      String? title,
      String? description,
      @JsonKey(name: "issued_date") DateTime? issuedDate,
      @JsonKey(name: "credential_url") String? credentialUrl});
}

/// @nodoc
class __$$_PortfolioCopyWithImpl<$Res>
    extends _$PortfolioCopyWithImpl<$Res, _$_Portfolio>
    implements _$$_PortfolioCopyWith<$Res> {
  __$$_PortfolioCopyWithImpl(
      _$_Portfolio _value, $Res Function(_$_Portfolio) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? images = freezed,
    Object? files = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? issuedDate = freezed,
    Object? credentialUrl = freezed,
  }) {
    return _then(_$_Portfolio(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      files: freezed == files
          ? _value._files
          : files // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      issuedDate: freezed == issuedDate
          ? _value.issuedDate
          : issuedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      credentialUrl: freezed == credentialUrl
          ? _value.credentialUrl
          : credentialUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Portfolio implements _Portfolio {
  const _$_Portfolio(
      {this.id,
      final List<Image>? images,
      final List<dynamic>? files,
      this.title,
      this.description,
      @JsonKey(name: "issued_date") this.issuedDate,
      @JsonKey(name: "credential_url") this.credentialUrl})
      : _images = images,
        _files = files;

  factory _$_Portfolio.fromJson(Map<String, dynamic> json) =>
      _$$_PortfolioFromJson(json);

  @override
  final int? id;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _files;
  @override
  List<dynamic>? get files {
    final value = _files;
    if (value == null) return null;
    if (_files is EqualUnmodifiableListView) return _files;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "issued_date")
  final DateTime? issuedDate;
  @override
  @JsonKey(name: "credential_url")
  final String? credentialUrl;

  @override
  String toString() {
    return 'Portfolio(id: $id, images: $images, files: $files, title: $title, description: $description, issuedDate: $issuedDate, credentialUrl: $credentialUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Portfolio &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._files, _files) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.issuedDate, issuedDate) ||
                other.issuedDate == issuedDate) &&
            (identical(other.credentialUrl, credentialUrl) ||
                other.credentialUrl == credentialUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_files),
      title,
      description,
      issuedDate,
      credentialUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PortfolioCopyWith<_$_Portfolio> get copyWith =>
      __$$_PortfolioCopyWithImpl<_$_Portfolio>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PortfolioToJson(
      this,
    );
  }
}

abstract class _Portfolio implements Portfolio {
  const factory _Portfolio(
          {final int? id,
          final List<Image>? images,
          final List<dynamic>? files,
          final String? title,
          final String? description,
          @JsonKey(name: "issued_date") final DateTime? issuedDate,
          @JsonKey(name: "credential_url") final String? credentialUrl}) =
      _$_Portfolio;

  factory _Portfolio.fromJson(Map<String, dynamic> json) =
      _$_Portfolio.fromJson;

  @override
  int? get id;
  @override
  List<Image>? get images;
  @override
  List<dynamic>? get files;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "issued_date")
  DateTime? get issuedDate;
  @override
  @JsonKey(name: "credential_url")
  String? get credentialUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioCopyWith<_$_Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
mixin _$Rating {
  @JsonKey(name: "user_rating_count")
  int? get userRatingCount => throw _privateConstructorUsedError;
  @JsonKey(name: "avg_rating")
  num? get avgRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res, Rating>;
  @useResult
  $Res call(
      {@JsonKey(name: "user_rating_count") int? userRatingCount,
      @JsonKey(name: "avg_rating") num? avgRating});
}

/// @nodoc
class _$RatingCopyWithImpl<$Res, $Val extends Rating>
    implements $RatingCopyWith<$Res> {
  _$RatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRatingCount = freezed,
    Object? avgRating = freezed,
  }) {
    return _then(_value.copyWith(
      userRatingCount: freezed == userRatingCount
          ? _value.userRatingCount
          : userRatingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as num?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingCopyWith<$Res> implements $RatingCopyWith<$Res> {
  factory _$$_RatingCopyWith(_$_Rating value, $Res Function(_$_Rating) then) =
      __$$_RatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "user_rating_count") int? userRatingCount,
      @JsonKey(name: "avg_rating") num? avgRating});
}

/// @nodoc
class __$$_RatingCopyWithImpl<$Res>
    extends _$RatingCopyWithImpl<$Res, _$_Rating>
    implements _$$_RatingCopyWith<$Res> {
  __$$_RatingCopyWithImpl(_$_Rating _value, $Res Function(_$_Rating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRatingCount = freezed,
    Object? avgRating = freezed,
  }) {
    return _then(_$_Rating(
      userRatingCount: freezed == userRatingCount
          ? _value.userRatingCount
          : userRatingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rating implements _Rating {
  const _$_Rating(
      {@JsonKey(name: "user_rating_count") this.userRatingCount,
      @JsonKey(name: "avg_rating") this.avgRating});

  factory _$_Rating.fromJson(Map<String, dynamic> json) =>
      _$$_RatingFromJson(json);

  @override
  @JsonKey(name: "user_rating_count")
  final int? userRatingCount;
  @override
  @JsonKey(name: "avg_rating")
  final num? avgRating;

  @override
  String toString() {
    return 'Rating(userRatingCount: $userRatingCount, avgRating: $avgRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rating &&
            (identical(other.userRatingCount, userRatingCount) ||
                other.userRatingCount == userRatingCount) &&
            (identical(other.avgRating, avgRating) ||
                other.avgRating == avgRating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userRatingCount, avgRating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingCopyWith<_$_Rating> get copyWith =>
      __$$_RatingCopyWithImpl<_$_Rating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingToJson(
      this,
    );
  }
}

abstract class _Rating implements Rating {
  const factory _Rating(
      {@JsonKey(name: "user_rating_count") final int? userRatingCount,
      @JsonKey(name: "avg_rating") final num? avgRating}) = _$_Rating;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$_Rating.fromJson;

  @override
  @JsonKey(name: "user_rating_count")
  int? get userRatingCount;
  @override
  @JsonKey(name: "avg_rating")
  num? get avgRating;
  @override
  @JsonKey(ignore: true)
  _$$_RatingCopyWith<_$_Rating> get copyWith =>
      throw _privateConstructorUsedError;
}

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  @JsonKey(name: "success_rate")
  double? get successRate => throw _privateConstructorUsedError;
  @JsonKey(name: "happy_clients")
  double? get happyClients => throw _privateConstructorUsedError;
  @JsonKey(name: "task_completed")
  double? get taskCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: "user_reviews")
  double? get userReviews => throw _privateConstructorUsedError;
  @JsonKey(name: "task_assigned")
  double? get taskAssigned => throw _privateConstructorUsedError;
  @JsonKey(name: "task_in_progess")
  double? get taskInProgress => throw _privateConstructorUsedError;
  @JsonKey(name: "task_cancelled")
  double? get taskCancelled => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatsCopyWith<Stats> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsCopyWith<$Res> {
  factory $StatsCopyWith(Stats value, $Res Function(Stats) then) =
      _$StatsCopyWithImpl<$Res, Stats>;
  @useResult
  $Res call(
      {@JsonKey(name: "success_rate") double? successRate,
      @JsonKey(name: "happy_clients") double? happyClients,
      @JsonKey(name: "task_completed") double? taskCompleted,
      @JsonKey(name: "user_reviews") double? userReviews,
      @JsonKey(name: "task_assigned") double? taskAssigned,
      @JsonKey(name: "task_in_progess") double? taskInProgress,
      @JsonKey(name: "task_cancelled") double? taskCancelled});
}

/// @nodoc
class _$StatsCopyWithImpl<$Res, $Val extends Stats>
    implements $StatsCopyWith<$Res> {
  _$StatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successRate = freezed,
    Object? happyClients = freezed,
    Object? taskCompleted = freezed,
    Object? userReviews = freezed,
    Object? taskAssigned = freezed,
    Object? taskInProgress = freezed,
    Object? taskCancelled = freezed,
  }) {
    return _then(_value.copyWith(
      successRate: freezed == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double?,
      happyClients: freezed == happyClients
          ? _value.happyClients
          : happyClients // ignore: cast_nullable_to_non_nullable
              as double?,
      taskCompleted: freezed == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as double?,
      userReviews: freezed == userReviews
          ? _value.userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as double?,
      taskAssigned: freezed == taskAssigned
          ? _value.taskAssigned
          : taskAssigned // ignore: cast_nullable_to_non_nullable
              as double?,
      taskInProgress: freezed == taskInProgress
          ? _value.taskInProgress
          : taskInProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      taskCancelled: freezed == taskCancelled
          ? _value.taskCancelled
          : taskCancelled // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatsCopyWith<$Res> implements $StatsCopyWith<$Res> {
  factory _$$_StatsCopyWith(_$_Stats value, $Res Function(_$_Stats) then) =
      __$$_StatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "success_rate") double? successRate,
      @JsonKey(name: "happy_clients") double? happyClients,
      @JsonKey(name: "task_completed") double? taskCompleted,
      @JsonKey(name: "user_reviews") double? userReviews,
      @JsonKey(name: "task_assigned") double? taskAssigned,
      @JsonKey(name: "task_in_progess") double? taskInProgress,
      @JsonKey(name: "task_cancelled") double? taskCancelled});
}

/// @nodoc
class __$$_StatsCopyWithImpl<$Res> extends _$StatsCopyWithImpl<$Res, _$_Stats>
    implements _$$_StatsCopyWith<$Res> {
  __$$_StatsCopyWithImpl(_$_Stats _value, $Res Function(_$_Stats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? successRate = freezed,
    Object? happyClients = freezed,
    Object? taskCompleted = freezed,
    Object? userReviews = freezed,
    Object? taskAssigned = freezed,
    Object? taskInProgress = freezed,
    Object? taskCancelled = freezed,
  }) {
    return _then(_$_Stats(
      successRate: freezed == successRate
          ? _value.successRate
          : successRate // ignore: cast_nullable_to_non_nullable
              as double?,
      happyClients: freezed == happyClients
          ? _value.happyClients
          : happyClients // ignore: cast_nullable_to_non_nullable
              as double?,
      taskCompleted: freezed == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as double?,
      userReviews: freezed == userReviews
          ? _value.userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as double?,
      taskAssigned: freezed == taskAssigned
          ? _value.taskAssigned
          : taskAssigned // ignore: cast_nullable_to_non_nullable
              as double?,
      taskInProgress: freezed == taskInProgress
          ? _value.taskInProgress
          : taskInProgress // ignore: cast_nullable_to_non_nullable
              as double?,
      taskCancelled: freezed == taskCancelled
          ? _value.taskCancelled
          : taskCancelled // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats implements _Stats {
  const _$_Stats(
      {@JsonKey(name: "success_rate") this.successRate,
      @JsonKey(name: "happy_clients") this.happyClients,
      @JsonKey(name: "task_completed") this.taskCompleted,
      @JsonKey(name: "user_reviews") this.userReviews,
      @JsonKey(name: "task_assigned") this.taskAssigned,
      @JsonKey(name: "task_in_progess") this.taskInProgress,
      @JsonKey(name: "task_cancelled") this.taskCancelled});

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  @JsonKey(name: "success_rate")
  final double? successRate;
  @override
  @JsonKey(name: "happy_clients")
  final double? happyClients;
  @override
  @JsonKey(name: "task_completed")
  final double? taskCompleted;
  @override
  @JsonKey(name: "user_reviews")
  final double? userReviews;
  @override
  @JsonKey(name: "task_assigned")
  final double? taskAssigned;
  @override
  @JsonKey(name: "task_in_progess")
  final double? taskInProgress;
  @override
  @JsonKey(name: "task_cancelled")
  final double? taskCancelled;

  @override
  String toString() {
    return 'Stats(successRate: $successRate, happyClients: $happyClients, taskCompleted: $taskCompleted, userReviews: $userReviews, taskAssigned: $taskAssigned, taskInProgress: $taskInProgress, taskCancelled: $taskCancelled)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Stats &&
            (identical(other.successRate, successRate) ||
                other.successRate == successRate) &&
            (identical(other.happyClients, happyClients) ||
                other.happyClients == happyClients) &&
            (identical(other.taskCompleted, taskCompleted) ||
                other.taskCompleted == taskCompleted) &&
            (identical(other.userReviews, userReviews) ||
                other.userReviews == userReviews) &&
            (identical(other.taskAssigned, taskAssigned) ||
                other.taskAssigned == taskAssigned) &&
            (identical(other.taskInProgress, taskInProgress) ||
                other.taskInProgress == taskInProgress) &&
            (identical(other.taskCancelled, taskCancelled) ||
                other.taskCancelled == taskCancelled));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, successRate, happyClients,
      taskCompleted, userReviews, taskAssigned, taskInProgress, taskCancelled);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      __$$_StatsCopyWithImpl<_$_Stats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatsToJson(
      this,
    );
  }
}

abstract class _Stats implements Stats {
  const factory _Stats(
      {@JsonKey(name: "success_rate") final double? successRate,
      @JsonKey(name: "happy_clients") final double? happyClients,
      @JsonKey(name: "task_completed") final double? taskCompleted,
      @JsonKey(name: "user_reviews") final double? userReviews,
      @JsonKey(name: "task_assigned") final double? taskAssigned,
      @JsonKey(name: "task_in_progess") final double? taskInProgress,
      @JsonKey(name: "task_cancelled") final double? taskCancelled}) = _$_Stats;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  @JsonKey(name: "success_rate")
  double? get successRate;
  @override
  @JsonKey(name: "happy_clients")
  double? get happyClients;
  @override
  @JsonKey(name: "task_completed")
  double? get taskCompleted;
  @override
  @JsonKey(name: "user_reviews")
  double? get userReviews;
  @override
  @JsonKey(name: "task_assigned")
  double? get taskAssigned;
  @override
  @JsonKey(name: "task_in_progess")
  double? get taskInProgress;
  @override
  @JsonKey(name: "task_cancelled")
  double? get taskCancelled;
  @override
  @JsonKey(ignore: true)
  _$$_StatsCopyWith<_$_Stats> get copyWith =>
      throw _privateConstructorUsedError;
}

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: "draft_email")
  String? get draftEmail => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "draft_phone")
  String? get draftPhone => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "middle_name")
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      @JsonKey(name: "draft_email") String? draftEmail,
      String? phone,
      @JsonKey(name: "draft_phone") String? draftPhone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? draftEmail = freezed,
    Object? phone = freezed,
    Object? draftPhone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      draftEmail: freezed == draftEmail
          ? _value.draftEmail
          : draftEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      draftPhone: freezed == draftPhone
          ? _value.draftPhone
          : draftPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      @JsonKey(name: "draft_email") String? draftEmail,
      String? phone,
      @JsonKey(name: "draft_phone") String? draftPhone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      @JsonKey(name: "created_at") DateTime? createdAt});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? draftEmail = freezed,
    Object? phone = freezed,
    Object? draftPhone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      draftEmail: freezed == draftEmail
          ? _value.draftEmail
          : draftEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      draftPhone: freezed == draftPhone
          ? _value.draftPhone
          : draftPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {this.id,
      this.username,
      this.email,
      @JsonKey(name: "draft_email") this.draftEmail,
      this.phone,
      @JsonKey(name: "draft_phone") this.draftPhone,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "middle_name") this.middleName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "profile_image") this.profileImage,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  @JsonKey(name: "draft_email")
  final String? draftEmail;
  @override
  final String? phone;
  @override
  @JsonKey(name: "draft_phone")
  final String? draftPhone;
  @override
  @JsonKey(name: "full_name")
  final String? fullName;
  @override
  @JsonKey(name: "first_name")
  final String? firstName;
  @override
  @JsonKey(name: "middle_name")
  final String? middleName;
  @override
  @JsonKey(name: "last_name")
  final String? lastName;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, draftEmail: $draftEmail, phone: $phone, draftPhone: $draftPhone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.draftEmail, draftEmail) ||
                other.draftEmail == draftEmail) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.draftPhone, draftPhone) ||
                other.draftPhone == draftPhone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      draftEmail,
      phone,
      draftPhone,
      fullName,
      firstName,
      middleName,
      lastName,
      profileImage,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {final String? id,
      final String? username,
      final String? email,
      @JsonKey(name: "draft_email") final String? draftEmail,
      final String? phone,
      @JsonKey(name: "draft_phone") final String? draftPhone,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "middle_name") final String? middleName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "profile_image") final String? profileImage,
      @JsonKey(name: "created_at") final DateTime? createdAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  @JsonKey(name: "draft_email")
  String? get draftEmail;
  @override
  String? get phone;
  @override
  @JsonKey(name: "draft_phone")
  String? get draftPhone;
  @override
  @JsonKey(name: "full_name")
  String? get fullName;
  @override
  @JsonKey(name: "first_name")
  String? get firstName;
  @override
  @JsonKey(name: "middle_name")
  String? get middleName;
  @override
  @JsonKey(name: "last_name")
  String? get lastName;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return _Currency.fromJson(json);
}

/// @nodoc
mixin _$Currency {
  String? get code => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get symbol => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CurrencyCopyWith<Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyCopyWith<$Res> {
  factory $CurrencyCopyWith(Currency value, $Res Function(Currency) then) =
      _$CurrencyCopyWithImpl<$Res, Currency>;
  @useResult
  $Res call({String? code, String? name, String? symbol});
}

/// @nodoc
class _$CurrencyCopyWithImpl<$Res, $Val extends Currency>
    implements $CurrencyCopyWith<$Res> {
  _$CurrencyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CurrencyCopyWith<$Res> implements $CurrencyCopyWith<$Res> {
  factory _$$_CurrencyCopyWith(
          _$_Currency value, $Res Function(_$_Currency) then) =
      __$$_CurrencyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code, String? name, String? symbol});
}

/// @nodoc
class __$$_CurrencyCopyWithImpl<$Res>
    extends _$CurrencyCopyWithImpl<$Res, _$_Currency>
    implements _$$_CurrencyCopyWith<$Res> {
  __$$_CurrencyCopyWithImpl(
      _$_Currency _value, $Res Function(_$_Currency) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
    Object? name = freezed,
    Object? symbol = freezed,
  }) {
    return _then(_$_Currency(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: freezed == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Currency implements _Currency {
  const _$_Currency({this.code, this.name, this.symbol});

  factory _$_Currency.fromJson(Map<String, dynamic> json) =>
      _$$_CurrencyFromJson(json);

  @override
  final String? code;
  @override
  final String? name;
  @override
  final String? symbol;

  @override
  String toString() {
    return 'Currency(code: $code, name: $name, symbol: $symbol)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Currency &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, name, symbol);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      __$$_CurrencyCopyWithImpl<_$_Currency>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CurrencyToJson(
      this,
    );
  }
}

abstract class _Currency implements Currency {
  const factory _Currency(
      {final String? code,
      final String? name,
      final String? symbol}) = _$_Currency;

  factory _Currency.fromJson(Map<String, dynamic> json) = _$_Currency.fromJson;

  @override
  String? get code;
  @override
  String? get name;
  @override
  String? get symbol;
  @override
  @JsonKey(ignore: true)
  _$$_CurrencyCopyWith<_$_Currency> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  num? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: "media_type")
  String? get mediaType => throw _privateConstructorUsedError;
  String? get media => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {num? id,
      String? name,
      String? size,
      @JsonKey(name: "media_type") String? mediaType,
      String? media});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? size = freezed,
    Object? mediaType = freezed,
    Object? media = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$_ImageCopyWith(_$_Image value, $Res Function(_$_Image) then) =
      __$$_ImageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      String? name,
      String? size,
      @JsonKey(name: "media_type") String? mediaType,
      String? media});
}

/// @nodoc
class __$$_ImageCopyWithImpl<$Res> extends _$ImageCopyWithImpl<$Res, _$_Image>
    implements _$$_ImageCopyWith<$Res> {
  __$$_ImageCopyWithImpl(_$_Image _value, $Res Function(_$_Image) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? size = freezed,
    Object? mediaType = freezed,
    Object? media = freezed,
  }) {
    return _then(_$_Image(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: freezed == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String?,
      media: freezed == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Image implements _Image {
  const _$_Image(
      {this.id,
      this.name,
      this.size,
      @JsonKey(name: "media_type") this.mediaType,
      this.media});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final num? id;
  @override
  final String? name;
  @override
  final String? size;
  @override
  @JsonKey(name: "media_type")
  final String? mediaType;
  @override
  final String? media;

  @override
  String toString() {
    return 'Image(id: $id, name: $name, size: $size, mediaType: $mediaType, media: $media)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Image &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.media, media) || other.media == media));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, size, mediaType, media);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      __$$_ImageCopyWithImpl<_$_Image>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ImageToJson(
      this,
    );
  }
}

abstract class _Image implements Image {
  const factory _Image(
      {final num? id,
      final String? name,
      final String? size,
      @JsonKey(name: "media_type") final String? mediaType,
      final String? media}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  num? get id;
  @override
  String? get name;
  @override
  String? get size;
  @override
  @JsonKey(name: "media_type")
  String? get mediaType;
  @override
  String? get media;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}
