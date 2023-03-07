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
      next: json['next'],
      previous: json['previous'],
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
      ratedTo: json['ratedTo'] == null
          ? null
          : Rated.fromJson(json['ratedTo'] as Map<String, dynamic>),
      ratedBy: json['ratedBy'] == null
          ? null
          : Rated.fromJson(json['ratedBy'] as Map<String, dynamic>),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      rating: json['rating'] as int?,
      review: json['review'] as String?,
      reply: json['reply'],
      repliedDate: json['repliedDate'],
      isVerified: json['isVerified'] as bool?,
      task: json['task'] as String?,
    );

Map<String, dynamic> _$$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'ratedTo': instance.ratedTo,
      'ratedBy': instance.ratedBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'rating': instance.rating,
      'review': instance.review,
      'reply': instance.reply,
      'repliedDate': instance.repliedDate,
      'isVerified': instance.isVerified,
      'task': instance.task,
    };

_$_Rated _$$_RatedFromJson(Map<String, dynamic> json) => _$_Rated(
      id: json['id'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phone: json['phone'],
      fullName: json['fullName'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      profileImage: json['profileImage'] as String?,
      bio: json['bio'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      designation: json['designation'] as String?,
      userType: json['userType'] as String?,
      isProfileVerified: json['isProfileVerified'] as String?,
      isFollowed: json['isFollowed'] as bool?,
      isFollowing: json['isFollowing'] as bool?,
      avatar: json['avatar'] == null
          ? null
          : Avatar.fromJson(json['avatar'] as Map<String, dynamic>),
      badge: json['badge'] == null
          ? null
          : Badge.fromJson(json['badge'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RatedToJson(_$_Rated instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'profileImage': instance.profileImage,
      'bio': instance.bio,
      'createdAt': instance.createdAt?.toIso8601String(),
      'designation': instance.designation,
      'userType': instance.userType,
      'isProfileVerified': instance.isProfileVerified,
      'isFollowed': instance.isFollowed,
      'isFollowing': instance.isFollowing,
      'avatar': instance.avatar,
      'badge': instance.badge,
    };

_$_Avatar _$$_AvatarFromJson(Map<String, dynamic> json) => _$_Avatar(
      image: json['image'] as String?,
      id: json['id'] as int?,
    );

Map<String, dynamic> _$$_AvatarToJson(_$_Avatar instance) => <String, dynamic>{
      'image': instance.image,
      'id': instance.id,
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
