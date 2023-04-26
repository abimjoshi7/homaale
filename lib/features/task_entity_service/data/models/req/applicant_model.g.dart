// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'applicant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApplicantModel _$$_ApplicantModelFromJson(Map<String, dynamic> json) =>
    _$_ApplicantModel(
      totalPages: json['total_pages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['page_size'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ApplicantModelToJson(_$_ApplicantModel instance) =>
    <String, dynamic>{
      'total_pages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'page_size': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
      currency: json['currency'] as String?,
      budgetFrom: json['budget_from'] as String?,
      budgetTo: json['budget_to'] as String?,
      budgetType: json['budget_type'] as String?,
      createdBy: json['created_by'] == null
          ? null
          : CreatedBy.fromJson(json['created_by'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt,
      'status': instance.status,
      'currency': instance.currency,
      'budget_from': instance.budgetFrom,
      'budget_to': instance.budgetTo,
      'budget_type': instance.budgetType,
      'created_by': instance.createdBy,
    };

_$_CreatedBy _$$_CreatedByFromJson(Map<String, dynamic> json) => _$_CreatedBy(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      designation: json['designation'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      stats: json['stats'] == null
          ? null
          : Stats.fromJson(json['stats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CreatedByToJson(_$_CreatedBy instance) =>
    <String, dynamic>{
      'user': instance.user,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'designation': instance.designation,
      'is_profile_verified': instance.isProfileVerified,
      'stats': instance.stats,
    };

_$_Stats _$$_StatsFromJson(Map<String, dynamic> json) => _$_Stats(
      successRate: (json['success_rate'] as num?)?.toDouble(),
      happyClients: (json['happy_clients'] as num?)?.toDouble(),
      userReviews: (json['user_reviews'] as num?)?.toDouble(),
      avgRating: (json['avg_rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_StatsToJson(_$_Stats instance) => <String, dynamic>{
      'success_rate': instance.successRate,
      'happy_clients': instance.happyClients,
      'user_reviews': instance.userReviews,
      'avg_rating': instance.avgRating,
    };

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'created_at': instance.createdAt,
    };
