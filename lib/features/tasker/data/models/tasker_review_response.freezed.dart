// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasker_review_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskerReviewResponse _$TaskerReviewResponseFromJson(Map<String, dynamic> json) {
  return _TaskerReviewResponse.fromJson(json);
}

/// @nodoc
mixin _$TaskerReviewResponse {
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  dynamic? get next => throw _privateConstructorUsedError;
  dynamic? get previous => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskerReviewResponseCopyWith<TaskerReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskerReviewResponseCopyWith<$Res> {
  factory $TaskerReviewResponseCopyWith(TaskerReviewResponse value,
          $Res Function(TaskerReviewResponse) then) =
      _$TaskerReviewResponseCopyWithImpl<$Res, TaskerReviewResponse>;
  @useResult
  $Res call(
      {int? totalPages,
      int? count,
      int? current,
      dynamic? next,
      dynamic? previous,
      int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$TaskerReviewResponseCopyWithImpl<$Res,
        $Val extends TaskerReviewResponse>
    implements $TaskerReviewResponseCopyWith<$Res> {
  _$TaskerReviewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskerReviewResponseCopyWith<$Res>
    implements $TaskerReviewResponseCopyWith<$Res> {
  factory _$$_TaskerReviewResponseCopyWith(_$_TaskerReviewResponse value,
          $Res Function(_$_TaskerReviewResponse) then) =
      __$$_TaskerReviewResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalPages,
      int? count,
      int? current,
      dynamic? next,
      dynamic? previous,
      int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_TaskerReviewResponseCopyWithImpl<$Res>
    extends _$TaskerReviewResponseCopyWithImpl<$Res, _$_TaskerReviewResponse>
    implements _$$_TaskerReviewResponseCopyWith<$Res> {
  __$$_TaskerReviewResponseCopyWithImpl(_$_TaskerReviewResponse _value,
      $Res Function(_$_TaskerReviewResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPages = freezed,
    Object? count = freezed,
    Object? current = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? pageSize = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_TaskerReviewResponse(
      totalPages: freezed == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      current: freezed == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      result: freezed == result
          ? _value._result
          : result // ignore: cast_nullable_to_non_nullable
              as List<Result>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskerReviewResponse implements _TaskerReviewResponse {
  const _$_TaskerReviewResponse(
      {this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_TaskerReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$$_TaskerReviewResponseFromJson(json);

  @override
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final dynamic? next;
  @override
  final dynamic? previous;
  @override
  final int? pageSize;
  final List<Result>? _result;
  @override
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TaskerReviewResponse(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TaskerReviewResponse &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPages,
      count,
      current,
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(previous),
      pageSize,
      const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskerReviewResponseCopyWith<_$_TaskerReviewResponse> get copyWith =>
      __$$_TaskerReviewResponseCopyWithImpl<_$_TaskerReviewResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskerReviewResponseToJson(
      this,
    );
  }
}

abstract class _TaskerReviewResponse implements TaskerReviewResponse {
  const factory _TaskerReviewResponse(
      {final int? totalPages,
      final int? count,
      final int? current,
      final dynamic? next,
      final dynamic? previous,
      final int? pageSize,
      final List<Result>? result}) = _$_TaskerReviewResponse;

  factory _TaskerReviewResponse.fromJson(Map<String, dynamic> json) =
      _$_TaskerReviewResponse.fromJson;

  @override
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  dynamic? get next;
  @override
  dynamic? get previous;
  @override
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_TaskerReviewResponseCopyWith<_$_TaskerReviewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  Rated? get ratedTo => throw _privateConstructorUsedError;
  Rated? get ratedBy => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  int? get rating => throw _privateConstructorUsedError;
  String? get review => throw _privateConstructorUsedError;
  dynamic? get reply => throw _privateConstructorUsedError;
  dynamic? get repliedDate => throw _privateConstructorUsedError;
  bool? get isVerified => throw _privateConstructorUsedError;
  String? get task => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call(
      {int? id,
      Rated? ratedTo,
      Rated? ratedBy,
      DateTime? createdAt,
      int? rating,
      String? review,
      dynamic? reply,
      dynamic? repliedDate,
      bool? isVerified,
      String? task});

  $RatedCopyWith<$Res>? get ratedTo;
  $RatedCopyWith<$Res>? get ratedBy;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ratedTo = freezed,
    Object? ratedBy = freezed,
    Object? createdAt = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? reply = freezed,
    Object? repliedDate = freezed,
    Object? isVerified = freezed,
    Object? task = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ratedTo: freezed == ratedTo
          ? _value.ratedTo
          : ratedTo // ignore: cast_nullable_to_non_nullable
              as Rated?,
      ratedBy: freezed == ratedBy
          ? _value.ratedBy
          : ratedBy // ignore: cast_nullable_to_non_nullable
              as Rated?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      repliedDate: freezed == repliedDate
          ? _value.repliedDate
          : repliedDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RatedCopyWith<$Res>? get ratedTo {
    if (_value.ratedTo == null) {
      return null;
    }

    return $RatedCopyWith<$Res>(_value.ratedTo!, (value) {
      return _then(_value.copyWith(ratedTo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RatedCopyWith<$Res>? get ratedBy {
    if (_value.ratedBy == null) {
      return null;
    }

    return $RatedCopyWith<$Res>(_value.ratedBy!, (value) {
      return _then(_value.copyWith(ratedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResultCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$_ResultCopyWith(_$_Result value, $Res Function(_$_Result) then) =
      __$$_ResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      Rated? ratedTo,
      Rated? ratedBy,
      DateTime? createdAt,
      int? rating,
      String? review,
      dynamic? reply,
      dynamic? repliedDate,
      bool? isVerified,
      String? task});

  @override
  $RatedCopyWith<$Res>? get ratedTo;
  @override
  $RatedCopyWith<$Res>? get ratedBy;
}

/// @nodoc
class __$$_ResultCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$_Result>
    implements _$$_ResultCopyWith<$Res> {
  __$$_ResultCopyWithImpl(_$_Result _value, $Res Function(_$_Result) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? ratedTo = freezed,
    Object? ratedBy = freezed,
    Object? createdAt = freezed,
    Object? rating = freezed,
    Object? review = freezed,
    Object? reply = freezed,
    Object? repliedDate = freezed,
    Object? isVerified = freezed,
    Object? task = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      ratedTo: freezed == ratedTo
          ? _value.ratedTo
          : ratedTo // ignore: cast_nullable_to_non_nullable
              as Rated?,
      ratedBy: freezed == ratedBy
          ? _value.ratedBy
          : ratedBy // ignore: cast_nullable_to_non_nullable
              as Rated?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      review: freezed == review
          ? _value.review
          : review // ignore: cast_nullable_to_non_nullable
              as String?,
      reply: freezed == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      repliedDate: freezed == repliedDate
          ? _value.repliedDate
          : repliedDate // ignore: cast_nullable_to_non_nullable
              as dynamic?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      this.ratedTo,
      this.ratedBy,
      this.createdAt,
      this.rating,
      this.review,
      this.reply,
      this.repliedDate,
      this.isVerified,
      this.task});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  final Rated? ratedTo;
  @override
  final Rated? ratedBy;
  @override
  final DateTime? createdAt;
  @override
  final int? rating;
  @override
  final String? review;
  @override
  final dynamic? reply;
  @override
  final dynamic? repliedDate;
  @override
  final bool? isVerified;
  @override
  final String? task;

  @override
  String toString() {
    return 'Result(id: $id, ratedTo: $ratedTo, ratedBy: $ratedBy, createdAt: $createdAt, rating: $rating, review: $review, reply: $reply, repliedDate: $repliedDate, isVerified: $isVerified, task: $task)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ratedTo, ratedTo) || other.ratedTo == ratedTo) &&
            (identical(other.ratedBy, ratedBy) || other.ratedBy == ratedBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.review, review) || other.review == review) &&
            const DeepCollectionEquality().equals(other.reply, reply) &&
            const DeepCollectionEquality()
                .equals(other.repliedDate, repliedDate) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.task, task) || other.task == task));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ratedTo,
      ratedBy,
      createdAt,
      rating,
      review,
      const DeepCollectionEquality().hash(reply),
      const DeepCollectionEquality().hash(repliedDate),
      isVerified,
      task);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      __$$_ResultCopyWithImpl<_$_Result>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {final int? id,
      final Rated? ratedTo,
      final Rated? ratedBy,
      final DateTime? createdAt,
      final int? rating,
      final String? review,
      final dynamic? reply,
      final dynamic? repliedDate,
      final bool? isVerified,
      final String? task}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  Rated? get ratedTo;
  @override
  Rated? get ratedBy;
  @override
  DateTime? get createdAt;
  @override
  int? get rating;
  @override
  String? get review;
  @override
  dynamic? get reply;
  @override
  dynamic? get repliedDate;
  @override
  bool? get isVerified;
  @override
  String? get task;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Rated _$RatedFromJson(Map<String, dynamic> json) {
  return _Rated.fromJson(json);
}

/// @nodoc
mixin _$Rated {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  dynamic? get phone => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get middleName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  String? get userType => throw _privateConstructorUsedError;
  String? get isProfileVerified => throw _privateConstructorUsedError;
  bool? get isFollowed => throw _privateConstructorUsedError;
  bool? get isFollowing => throw _privateConstructorUsedError;
  Avatar? get avatar => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatedCopyWith<Rated> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatedCopyWith<$Res> {
  factory $RatedCopyWith(Rated value, $Res Function(Rated) then) =
      _$RatedCopyWithImpl<$Res, Rated>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      dynamic? phone,
      String? fullName,
      String? firstName,
      String? middleName,
      String? lastName,
      String? profileImage,
      String? bio,
      DateTime? createdAt,
      String? designation,
      String? userType,
      String? isProfileVerified,
      bool? isFollowed,
      bool? isFollowing,
      Avatar? avatar,
      Badge? badge});

  $AvatarCopyWith<$Res>? get avatar;
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$RatedCopyWithImpl<$Res, $Val extends Rated>
    implements $RatedCopyWith<$Res> {
  _$RatedCopyWithImpl(this._value, this._then);

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
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? designation = freezed,
    Object? userType = freezed,
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? avatar = freezed,
    Object? badge = freezed,
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AvatarCopyWith<$Res>? get avatar {
    if (_value.avatar == null) {
      return null;
    }

    return $AvatarCopyWith<$Res>(_value.avatar!, (value) {
      return _then(_value.copyWith(avatar: value) as $Val);
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
abstract class _$$_RatedCopyWith<$Res> implements $RatedCopyWith<$Res> {
  factory _$$_RatedCopyWith(_$_Rated value, $Res Function(_$_Rated) then) =
      __$$_RatedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      dynamic? phone,
      String? fullName,
      String? firstName,
      String? middleName,
      String? lastName,
      String? profileImage,
      String? bio,
      DateTime? createdAt,
      String? designation,
      String? userType,
      String? isProfileVerified,
      bool? isFollowed,
      bool? isFollowing,
      Avatar? avatar,
      Badge? badge});

  @override
  $AvatarCopyWith<$Res>? get avatar;
  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_RatedCopyWithImpl<$Res> extends _$RatedCopyWithImpl<$Res, _$_Rated>
    implements _$$_RatedCopyWith<$Res> {
  __$$_RatedCopyWithImpl(_$_Rated _value, $Res Function(_$_Rated) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? bio = freezed,
    Object? createdAt = freezed,
    Object? designation = freezed,
    Object? userType = freezed,
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? avatar = freezed,
    Object? badge = freezed,
  }) {
    return _then(_$_Rated(
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
      phone: freezed == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as String?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as Avatar?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as Badge?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rated implements _Rated {
  const _$_Rated(
      {this.id,
      this.username,
      this.email,
      this.phone,
      this.fullName,
      this.firstName,
      this.middleName,
      this.lastName,
      this.profileImage,
      this.bio,
      this.createdAt,
      this.designation,
      this.userType,
      this.isProfileVerified,
      this.isFollowed,
      this.isFollowing,
      this.avatar,
      this.badge});

  factory _$_Rated.fromJson(Map<String, dynamic> json) =>
      _$$_RatedFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final dynamic? phone;
  @override
  final String? fullName;
  @override
  final String? firstName;
  @override
  final String? middleName;
  @override
  final String? lastName;
  @override
  final String? profileImage;
  @override
  final String? bio;
  @override
  final DateTime? createdAt;
  @override
  final String? designation;
  @override
  final String? userType;
  @override
  final String? isProfileVerified;
  @override
  final bool? isFollowed;
  @override
  final bool? isFollowing;
  @override
  final Avatar? avatar;
  @override
  final Badge? badge;

  @override
  String toString() {
    return 'Rated(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, userType: $userType, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, avatar: $avatar, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rated &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
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
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.designation, designation) ||
                other.designation == designation) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.isProfileVerified, isProfileVerified) ||
                other.isProfileVerified == isProfileVerified) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.badge, badge) || other.badge == badge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      const DeepCollectionEquality().hash(phone),
      fullName,
      firstName,
      middleName,
      lastName,
      profileImage,
      bio,
      createdAt,
      designation,
      userType,
      isProfileVerified,
      isFollowed,
      isFollowing,
      avatar,
      badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatedCopyWith<_$_Rated> get copyWith =>
      __$$_RatedCopyWithImpl<_$_Rated>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatedToJson(
      this,
    );
  }
}

abstract class _Rated implements Rated {
  const factory _Rated(
      {final String? id,
      final String? username,
      final String? email,
      final dynamic? phone,
      final String? fullName,
      final String? firstName,
      final String? middleName,
      final String? lastName,
      final String? profileImage,
      final String? bio,
      final DateTime? createdAt,
      final String? designation,
      final String? userType,
      final String? isProfileVerified,
      final bool? isFollowed,
      final bool? isFollowing,
      final Avatar? avatar,
      final Badge? badge}) = _$_Rated;

  factory _Rated.fromJson(Map<String, dynamic> json) = _$_Rated.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  dynamic? get phone;
  @override
  String? get fullName;
  @override
  String? get firstName;
  @override
  String? get middleName;
  @override
  String? get lastName;
  @override
  String? get profileImage;
  @override
  String? get bio;
  @override
  DateTime? get createdAt;
  @override
  String? get designation;
  @override
  String? get userType;
  @override
  String? get isProfileVerified;
  @override
  bool? get isFollowed;
  @override
  bool? get isFollowing;
  @override
  Avatar? get avatar;
  @override
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_RatedCopyWith<_$_Rated> get copyWith =>
      throw _privateConstructorUsedError;
}

Avatar _$AvatarFromJson(Map<String, dynamic> json) {
  return _Avatar.fromJson(json);
}

/// @nodoc
mixin _$Avatar {
  String? get image => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AvatarCopyWith<Avatar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AvatarCopyWith<$Res> {
  factory $AvatarCopyWith(Avatar value, $Res Function(Avatar) then) =
      _$AvatarCopyWithImpl<$Res, Avatar>;
  @useResult
  $Res call({String? image, int? id});
}

/// @nodoc
class _$AvatarCopyWithImpl<$Res, $Val extends Avatar>
    implements $AvatarCopyWith<$Res> {
  _$AvatarCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AvatarCopyWith<$Res> implements $AvatarCopyWith<$Res> {
  factory _$$_AvatarCopyWith(_$_Avatar value, $Res Function(_$_Avatar) then) =
      __$$_AvatarCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? image, int? id});
}

/// @nodoc
class __$$_AvatarCopyWithImpl<$Res>
    extends _$AvatarCopyWithImpl<$Res, _$_Avatar>
    implements _$$_AvatarCopyWith<$Res> {
  __$$_AvatarCopyWithImpl(_$_Avatar _value, $Res Function(_$_Avatar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_Avatar(
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Avatar implements _Avatar {
  const _$_Avatar({this.image, this.id});

  factory _$_Avatar.fromJson(Map<String, dynamic> json) =>
      _$$_AvatarFromJson(json);

  @override
  final String? image;
  @override
  final int? id;

  @override
  String toString() {
    return 'Avatar(image: $image, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Avatar &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, image, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
      __$$_AvatarCopyWithImpl<_$_Avatar>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AvatarToJson(
      this,
    );
  }
}

abstract class _Avatar implements Avatar {
  const factory _Avatar({final String? image, final int? id}) = _$_Avatar;

  factory _Avatar.fromJson(Map<String, dynamic> json) = _$_Avatar.fromJson;

  @override
  String? get image;
  @override
  int? get id;
  @override
  @JsonKey(ignore: true)
  _$$_AvatarCopyWith<_$_Avatar> get copyWith =>
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
