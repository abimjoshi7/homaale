// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasker_review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TaskerReviewResponse _$$_TaskerReviewResponseFromJson(
        Map<String, dynamic> json) =>
    _$_TaskerReviewResponse(
      totalPages: json['totalPages'] as int?,
      count: json['count'] as int?,
      current: json['current'] as int?,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      pageSize: json['pageSize'] as int?,
      result: (json['result'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_TaskerReviewResponseToJson(
        _$_TaskerReviewResponse instance) =>
    <String, dynamic>{
      'totalPages': instance.totalPages,
      'count': instance.count,
      'current': instance.current,
      'next': instance.next,
      'previous': instance.previous,
      'pageSize': instance.pageSize,
      'result': instance.result,
    };

_$_Result _$$_ResultFromJson(Map<String, dynamic> json) => _$_Result(
      id: json['id'] as int?,
      ratedTo: json['rated_to'] == null
          ? null
          : Rated.fromJson(json['rated_to'] as Map<String, dynamic>),
      ratedBy: json['rated_by'] == null
          ? null
          : Rated.fromJson(json['rated_by'] as Map<String, dynamic>),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      rating: json['rating'] as int?,
      review: json['review'] as String?,
      reply: json['reply'],
      repliedDate: json['replied_date'],
      isVerified: json['is_verified'] as bool?,
      task: json['task'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'rated_to': instance.ratedTo,
      'rated_by': instance.ratedBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'rating': instance.rating,
      'review': instance.review,
      'reply': instance.reply,
      'replied_date': instance.repliedDate,
      'is_verified': instance.isVerified,
      'task': instance.task,
    };

_$_Rated _$$_RatedFromJson(Map<String, dynamic> json) => _$_Rated(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      fullName: json['full_name'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      profileImage: json['profile_image'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      designation: json['designation'] as String?,
      userType: json['user_type'] as String?,
      isProfileVerified: json['is_profile_verified'] as bool?,
      isFollowed: json['is_followed'] as bool?,
      isFollowing: json['is_following'] as bool?,
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RatedToJson(_$_Rated instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'full_name': instance.fullName,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'profile_image': instance.profileImage,
      'bio': instance.bio,
      'created_at': instance.createdAt?.toIso8601String(),
      'designation': instance.designation,
      'user_type': instance.userType,
      'is_profile_verified': instance.isProfileVerified,
      'is_followed': instance.isFollowed,
      'is_following': instance.isFollowing,
      'badge': instance.badge,
    };

_$_Badge _$$_BadgeFromJson(Map<String, dynamic> json) => _$_Badge(
      id: json['id'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$$_BadgeToJson(_$_Badge instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'title': instance.title,
    };
