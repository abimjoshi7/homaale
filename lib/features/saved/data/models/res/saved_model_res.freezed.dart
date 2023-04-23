// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saved_model_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavedModelRes _$SavedModelResFromJson(Map<String, dynamic> json) {
  return _SavedModelRes.fromJson(json);
}

/// @nodoc
mixin _$SavedModelRes {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavedModelResCopyWith<SavedModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavedModelResCopyWith<$Res> {
  factory $SavedModelResCopyWith(
          SavedModelRes value, $Res Function(SavedModelRes) then) =
      _$SavedModelResCopyWithImpl<$Res, SavedModelRes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$SavedModelResCopyWithImpl<$Res, $Val extends SavedModelRes>
    implements $SavedModelResCopyWith<$Res> {
  _$SavedModelResCopyWithImpl(this._value, this._then);

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
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_SavedModelResCopyWith<$Res>
    implements $SavedModelResCopyWith<$Res> {
  factory _$$_SavedModelResCopyWith(
          _$_SavedModelRes value, $Res Function(_$_SavedModelRes) then) =
      __$$_SavedModelResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_SavedModelResCopyWithImpl<$Res>
    extends _$SavedModelResCopyWithImpl<$Res, _$_SavedModelRes>
    implements _$$_SavedModelResCopyWith<$Res> {
  __$$_SavedModelResCopyWithImpl(
      _$_SavedModelRes _value, $Res Function(_$_SavedModelRes) _then)
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
    return _then(_$_SavedModelRes(
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
              as String?,
      previous: freezed == previous
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_SavedModelRes implements _SavedModelRes {
  const _$_SavedModelRes(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_SavedModelRes.fromJson(Map<String, dynamic> json) =>
      _$$_SavedModelResFromJson(json);

  @override
  @JsonKey(name: 'total_pages')
  final int? totalPages;
  @override
  final int? count;
  @override
  final int? current;
  @override
  final String? next;
  @override
  final String? previous;
  @override
  @JsonKey(name: 'page_size')
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
    return 'SavedModelRes(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavedModelRes &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.previous, previous) ||
                other.previous == previous) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            const DeepCollectionEquality().equals(other._result, _result));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, totalPages, count, current, next,
      previous, pageSize, const DeepCollectionEquality().hash(_result));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavedModelResCopyWith<_$_SavedModelRes> get copyWith =>
      __$$_SavedModelResCopyWithImpl<_$_SavedModelRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedModelResToJson(
      this,
    );
  }
}

abstract class _SavedModelRes implements SavedModelRes {
  const factory _SavedModelRes(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      final List<Result>? result}) = _$_SavedModelRes;

  factory _SavedModelRes.fromJson(Map<String, dynamic> json) =
      _$_SavedModelRes.fromJson;

  @override
  @JsonKey(name: 'total_pages')
  int? get totalPages;
  @override
  int? get count;
  @override
  int? get current;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  @JsonKey(name: 'page_size')
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_SavedModelResCopyWith<_$_SavedModelRes> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  String? get user => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'object_id')
  String? get objectId => throw _privateConstructorUsedError;
  @JsonKey(name: 'content_type')
  int? get contentType => throw _privateConstructorUsedError;

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
      String? user,
      String? type,
      Data? data,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'object_id') String? objectId,
      @JsonKey(name: 'content_type') int? contentType});

  $DataCopyWith<$Res>? get data;
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
    Object? user = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
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
      String? user,
      String? type,
      Data? data,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt,
      @JsonKey(name: 'object_id') String? objectId,
      @JsonKey(name: 'content_type') int? contentType});

  @override
  $DataCopyWith<$Res>? get data;
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
    Object? user = freezed,
    Object? type = freezed,
    Object? data = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? objectId = freezed,
    Object? contentType = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      objectId: freezed == objectId
          ? _value.objectId
          : objectId // ignore: cast_nullable_to_non_nullable
              as String?,
      contentType: freezed == contentType
          ? _value.contentType
          : contentType // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      this.user,
      this.type,
      this.data,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'object_id') this.objectId,
      @JsonKey(name: 'content_type') this.contentType});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  final String? user;
  @override
  final String? type;
  @override
  final Data? data;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @override
  @JsonKey(name: 'object_id')
  final String? objectId;
  @override
  @JsonKey(name: 'content_type')
  final int? contentType;

  @override
  String toString() {
    return 'Result(id: $id, user: $user, type: $type, data: $data, createdAt: $createdAt, updatedAt: $updatedAt, objectId: $objectId, contentType: $contentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.objectId, objectId) ||
                other.objectId == objectId) &&
            (identical(other.contentType, contentType) ||
                other.contentType == contentType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, type, data, createdAt,
      updatedAt, objectId, contentType);

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
      final String? user,
      final String? type,
      final Data? data,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt,
      @JsonKey(name: 'object_id') final String? objectId,
      @JsonKey(name: 'content_type') final int? contentType}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  String? get user;
  @override
  String? get type;
  @override
  Data? get data;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;
  @override
  @JsonKey(name: 'object_id')
  String? get objectId;
  @override
  @JsonKey(name: 'content_type')
  int? get contentType;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
mixin _$Data {
  dynamic? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'charge_currency')
  Currency? get chargeCurrency => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  List<Portfolio>? get portfolio => throw _privateConstructorUsedError;
  List<Experience>? get experience => throw _privateConstructorUsedError;
  List<Education>? get education => throw _privateConstructorUsedError;
  List<Certificate>? get certificates => throw _privateConstructorUsedError;
  Stats? get stats => throw _privateConstructorUsedError;
  dynamic? get rating => throw _privateConstructorUsedError;
  CountryClass? get country => throw _privateConstructorUsedError;
  CountryClass? get language => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  List<Interest>? get interests => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_followed')
  bool? get isFollowed => throw _privateConstructorUsedError;
  NextClass? get badge => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_brith')
  DateTime? get dateOfBirth => throw _privateConstructorUsedError;
  String? get skill => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_hour_start')
  String? get activeHourStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_hour_end')
  String? get activeHourEnd => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_level')
  String? get experienceLevel => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_visibility')
  String? get profileVisibility => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_preferences')
  String? get taskPreferences => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line1')
  String? get addressLine1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line2')
  String? get addressLine2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  int? get points => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_point')
  int? get remainingPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'followers_count')
  int? get followersCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'following_count')
  int? get followingCount => throw _privateConstructorUsedError;
  int? get avatar => throw _privateConstructorUsedError;
  List<dynamic>? get subscription => throw _privateConstructorUsedError;
  @JsonKey(name: 'security_questions')
  List<int>? get securityQuestions => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_online')
  bool? get isOnline => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;
  List<dynamic>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_type')
  String? get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_requested')
  bool? get isRequested => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_from')
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_to')
  String? get budgetTo => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_endorsed')
  bool? get isEndorsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  List<dynamic>? get videos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res, Data>;
  @useResult
  $Res call(
      {dynamic? id,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'charge_currency') Currency? chargeCurrency,
      User? user,
      List<Portfolio>? portfolio,
      List<Experience>? experience,
      List<Education>? education,
      List<Certificate>? certificates,
      Stats? stats,
      dynamic? rating,
      CountryClass? country,
      CountryClass? language,
      City? city,
      List<Interest>? interests,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      NextClass? badge,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      String? status,
      String? bio,
      String? gender,
      @JsonKey(name: 'date_of_brith') DateTime? dateOfBirth,
      String? skill,
      @JsonKey(name: 'active_hour_start') String? activeHourStart,
      @JsonKey(name: 'active_hour_end') String? activeHourEnd,
      @JsonKey(name: 'experience_level') String? experienceLevel,
      @JsonKey(name: 'profile_visibility') String? profileVisibility,
      @JsonKey(name: 'task_preferences') String? taskPreferences,
      @JsonKey(name: 'address_line1') String? addressLine1,
      @JsonKey(name: 'address_line2') String? addressLine2,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      String? designation,
      int? points,
      @JsonKey(name: 'remaining_point') int? remainingPoints,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'following_count') int? followingCount,
      int? avatar,
      List<dynamic>? subscription,
      @JsonKey(name: 'security_questions') List<int>? securityQuestions,
      String? slug,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'created_by') CreatedBy? createdBy,
      String? title,
      Currency? currency,
      @JsonKey(name: 'is_online') bool? isOnline,
      Service? service,
      List<dynamic>? images,
      @JsonKey(name: 'budget_type') String? budgetType,
      @JsonKey(name: 'is_requested') bool? isRequested,
      @JsonKey(name: 'budget_from') String? budgetFrom,
      @JsonKey(name: 'budget_to') String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: 'is_endorsed') bool? isEndorsed,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      List<dynamic>? videos});

  $CurrencyCopyWith<$Res>? get chargeCurrency;
  $UserCopyWith<$Res>? get user;
  $StatsCopyWith<$Res>? get stats;
  $CountryClassCopyWith<$Res>? get country;
  $CountryClassCopyWith<$Res>? get language;
  $CityCopyWith<$Res>? get city;
  $NextClassCopyWith<$Res>? get badge;
  $CreatedByCopyWith<$Res>? get createdBy;
  $CurrencyCopyWith<$Res>? get currency;
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class _$DataCopyWithImpl<$Res, $Val extends Data>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

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
    Object? skill = freezed,
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
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? budgetType = freezed,
    Object? isRequested = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? location = freezed,
    Object? count = freezed,
    Object? isEndorsed = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? videos = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
              as dynamic?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryClass?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CountryClass?,
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
              as NextClass?,
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
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      securityQuestions: freezed == securityQuestions
          ? _value.securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
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
  $CountryClassCopyWith<$Res>? get country {
    if (_value.country == null) {
      return null;
    }

    return $CountryClassCopyWith<$Res>(_value.country!, (value) {
      return _then(_value.copyWith(country: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CountryClassCopyWith<$Res>? get language {
    if (_value.language == null) {
      return null;
    }

    return $CountryClassCopyWith<$Res>(_value.language!, (value) {
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
  $NextClassCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $NextClassCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $CreatedByCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res>? get currency {
    if (_value.currency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.currency!, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServiceCopyWith<$Res>? get service {
    if (_value.service == null) {
      return null;
    }

    return $ServiceCopyWith<$Res>(_value.service!, (value) {
      return _then(_value.copyWith(service: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$$_DataCopyWith(_$_Data value, $Res Function(_$_Data) then) =
      __$$_DataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic? id,
      @JsonKey(name: 'profile_image') String? profileImage,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'charge_currency') Currency? chargeCurrency,
      User? user,
      List<Portfolio>? portfolio,
      List<Experience>? experience,
      List<Education>? education,
      List<Certificate>? certificates,
      Stats? stats,
      dynamic? rating,
      CountryClass? country,
      CountryClass? language,
      City? city,
      List<Interest>? interests,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      NextClass? badge,
      @JsonKey(name: 'is_bookmarked') bool? isBookmarked,
      String? status,
      String? bio,
      String? gender,
      @JsonKey(name: 'date_of_brith') DateTime? dateOfBirth,
      String? skill,
      @JsonKey(name: 'active_hour_start') String? activeHourStart,
      @JsonKey(name: 'active_hour_end') String? activeHourEnd,
      @JsonKey(name: 'experience_level') String? experienceLevel,
      @JsonKey(name: 'profile_visibility') String? profileVisibility,
      @JsonKey(name: 'task_preferences') String? taskPreferences,
      @JsonKey(name: 'address_line1') String? addressLine1,
      @JsonKey(name: 'address_line2') String? addressLine2,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      String? designation,
      int? points,
      @JsonKey(name: 'remaining_point') int? remainingPoints,
      @JsonKey(name: 'followers_count') int? followersCount,
      @JsonKey(name: 'following_count') int? followingCount,
      int? avatar,
      List<dynamic>? subscription,
      @JsonKey(name: 'security_questions') List<int>? securityQuestions,
      String? slug,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'created_by') CreatedBy? createdBy,
      String? title,
      Currency? currency,
      @JsonKey(name: 'is_online') bool? isOnline,
      Service? service,
      List<dynamic>? images,
      @JsonKey(name: 'budget_type') String? budgetType,
      @JsonKey(name: 'is_requested') bool? isRequested,
      @JsonKey(name: 'budget_from') String? budgetFrom,
      @JsonKey(name: 'budget_to') String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: 'is_endorsed') bool? isEndorsed,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime,
      List<dynamic>? videos});

  @override
  $CurrencyCopyWith<$Res>? get chargeCurrency;
  @override
  $UserCopyWith<$Res>? get user;
  @override
  $StatsCopyWith<$Res>? get stats;
  @override
  $CountryClassCopyWith<$Res>? get country;
  @override
  $CountryClassCopyWith<$Res>? get language;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $NextClassCopyWith<$Res>? get badge;
  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class __$$_DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res, _$_Data>
    implements _$$_DataCopyWith<$Res> {
  __$$_DataCopyWithImpl(_$_Data _value, $Res Function(_$_Data) _then)
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
    Object? skill = freezed,
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
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? budgetType = freezed,
    Object? isRequested = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? location = freezed,
    Object? count = freezed,
    Object? isEndorsed = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? videos = freezed,
  }) {
    return _then(_$_Data(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
              as dynamic?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as CountryClass?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as CountryClass?,
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
              as NextClass?,
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
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
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
              as int?,
      subscription: freezed == subscription
          ? _value._subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      securityQuestions: freezed == securityQuestions
          ? _value._securityQuestions
          : securityQuestions // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {this.id,
      @JsonKey(name: 'profile_image') this.profileImage,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'charge_currency') this.chargeCurrency,
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
      @JsonKey(name: 'is_followed') this.isFollowed,
      this.badge,
      @JsonKey(name: 'is_bookmarked') this.isBookmarked,
      this.status,
      this.bio,
      this.gender,
      @JsonKey(name: 'date_of_brith') this.dateOfBirth,
      this.skill,
      @JsonKey(name: 'active_hour_start') this.activeHourStart,
      @JsonKey(name: 'active_hour_end') this.activeHourEnd,
      @JsonKey(name: 'experience_level') this.experienceLevel,
      @JsonKey(name: 'profile_visibility') this.profileVisibility,
      @JsonKey(name: 'task_preferences') this.taskPreferences,
      @JsonKey(name: 'address_line1') this.addressLine1,
      @JsonKey(name: 'address_line2') this.addressLine2,
      @JsonKey(name: 'is_profile_verified') this.isProfileVerified,
      this.designation,
      this.points,
      @JsonKey(name: 'remaining_point') this.remainingPoints,
      @JsonKey(name: 'followers_count') this.followersCount,
      @JsonKey(name: 'following_count') this.followingCount,
      this.avatar,
      final List<dynamic>? subscription,
      @JsonKey(name: 'security_questions') final List<int>? securityQuestions,
      this.slug,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'created_by') this.createdBy,
      this.title,
      this.currency,
      @JsonKey(name: 'is_online') this.isOnline,
      this.service,
      final List<dynamic>? images,
      @JsonKey(name: 'budget_type') this.budgetType,
      @JsonKey(name: 'is_requested') this.isRequested,
      @JsonKey(name: 'budget_from') this.budgetFrom,
      @JsonKey(name: 'budget_to') this.budgetTo,
      this.location,
      this.count,
      @JsonKey(name: 'is_endorsed') this.isEndorsed,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      final List<dynamic>? videos})
      : _portfolio = portfolio,
        _experience = experience,
        _education = education,
        _certificates = certificates,
        _interests = interests,
        _subscription = subscription,
        _securityQuestions = securityQuestions,
        _images = images,
        _videos = videos;

  factory _$_Data.fromJson(Map<String, dynamic> json) => _$$_DataFromJson(json);

  @override
  final dynamic? id;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'charge_currency')
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
  final dynamic? rating;
  @override
  final CountryClass? country;
  @override
  final CountryClass? language;
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
  @JsonKey(name: 'is_followed')
  final bool? isFollowed;
  @override
  final NextClass? badge;
  @override
  @JsonKey(name: 'is_bookmarked')
  final bool? isBookmarked;
  @override
  final String? status;
  @override
  final String? bio;
  @override
  final String? gender;
  @override
  @JsonKey(name: 'date_of_brith')
  final DateTime? dateOfBirth;
  @override
  final String? skill;
  @override
  @JsonKey(name: 'active_hour_start')
  final String? activeHourStart;
  @override
  @JsonKey(name: 'active_hour_end')
  final String? activeHourEnd;
  @override
  @JsonKey(name: 'experience_level')
  final String? experienceLevel;
  @override
  @JsonKey(name: 'profile_visibility')
  final String? profileVisibility;
  @override
  @JsonKey(name: 'task_preferences')
  final String? taskPreferences;
  @override
  @JsonKey(name: 'address_line1')
  final String? addressLine1;
  @override
  @JsonKey(name: 'address_line2')
  final String? addressLine2;
  @override
  @JsonKey(name: 'is_profile_verified')
  final bool? isProfileVerified;
  @override
  final String? designation;
  @override
  final int? points;
  @override
  @JsonKey(name: 'remaining_point')
  final int? remainingPoints;
  @override
  @JsonKey(name: 'followers_count')
  final int? followersCount;
  @override
  @JsonKey(name: 'following_count')
  final int? followingCount;
  @override
  final int? avatar;
  final List<dynamic>? _subscription;
  @override
  List<dynamic>? get subscription {
    final value = _subscription;
    if (value == null) return null;
    if (_subscription is EqualUnmodifiableListView) return _subscription;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<int>? _securityQuestions;
  @override
  @JsonKey(name: 'security_questions')
  List<int>? get securityQuestions {
    final value = _securityQuestions;
    if (value == null) return null;
    if (_securityQuestions is EqualUnmodifiableListView)
      return _securityQuestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? slug;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'created_by')
  final CreatedBy? createdBy;
  @override
  final String? title;
  @override
  final Currency? currency;
  @override
  @JsonKey(name: 'is_online')
  final bool? isOnline;
  @override
  final Service? service;
  final List<dynamic>? _images;
  @override
  List<dynamic>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'budget_type')
  final String? budgetType;
  @override
  @JsonKey(name: 'is_requested')
  final bool? isRequested;
  @override
  @JsonKey(name: 'budget_from')
  final String? budgetFrom;
  @override
  @JsonKey(name: 'budget_to')
  final String? budgetTo;
  @override
  final String? location;
  @override
  final int? count;
  @override
  @JsonKey(name: 'is_endorsed')
  final bool? isEndorsed;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  final List<dynamic>? _videos;
  @override
  List<dynamic>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Data(id: $id, profileImage: $profileImage, fullName: $fullName, chargeCurrency: $chargeCurrency, user: $user, portfolio: $portfolio, experience: $experience, education: $education, certificates: $certificates, stats: $stats, rating: $rating, country: $country, language: $language, city: $city, interests: $interests, isFollowed: $isFollowed, badge: $badge, isBookmarked: $isBookmarked, status: $status, bio: $bio, gender: $gender, dateOfBirth: $dateOfBirth, skill: $skill, activeHourStart: $activeHourStart, activeHourEnd: $activeHourEnd, experienceLevel: $experienceLevel, profileVisibility: $profileVisibility, taskPreferences: $taskPreferences, addressLine1: $addressLine1, addressLine2: $addressLine2, isProfileVerified: $isProfileVerified, designation: $designation, points: $points, remainingPoints: $remainingPoints, followersCount: $followersCount, followingCount: $followingCount, avatar: $avatar, subscription: $subscription, securityQuestions: $securityQuestions, slug: $slug, createdAt: $createdAt, createdBy: $createdBy, title: $title, currency: $currency, isOnline: $isOnline, service: $service, images: $images, budgetType: $budgetType, isRequested: $isRequested, budgetFrom: $budgetFrom, budgetTo: $budgetTo, location: $location, count: $count, isEndorsed: $isEndorsed, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, videos: $videos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Data &&
            const DeepCollectionEquality().equals(other.id, id) &&
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
            const DeepCollectionEquality().equals(other.rating, rating) &&
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
            (identical(other.skill, skill) || other.skill == skill) &&
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
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            const DeepCollectionEquality()
                .equals(other._subscription, _subscription) &&
            const DeepCollectionEquality()
                .equals(other._securityQuestions, _securityQuestions) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.isRequested, isRequested) ||
                other.isRequested == isRequested) &&
            (identical(other.budgetFrom, budgetFrom) ||
                other.budgetFrom == budgetFrom) &&
            (identical(other.budgetTo, budgetTo) ||
                other.budgetTo == budgetTo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isEndorsed, isEndorsed) ||
                other.isEndorsed == isEndorsed) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other._videos, _videos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        const DeepCollectionEquality().hash(id),
        profileImage,
        fullName,
        chargeCurrency,
        user,
        const DeepCollectionEquality().hash(_portfolio),
        const DeepCollectionEquality().hash(_experience),
        const DeepCollectionEquality().hash(_education),
        const DeepCollectionEquality().hash(_certificates),
        stats,
        const DeepCollectionEquality().hash(rating),
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
        skill,
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
        avatar,
        const DeepCollectionEquality().hash(_subscription),
        const DeepCollectionEquality().hash(_securityQuestions),
        slug,
        createdAt,
        createdBy,
        title,
        currency,
        isOnline,
        service,
        const DeepCollectionEquality().hash(_images),
        budgetType,
        isRequested,
        budgetFrom,
        budgetTo,
        location,
        count,
        isEndorsed,
        startDate,
        endDate,
        startTime,
        endTime,
        const DeepCollectionEquality().hash(_videos)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DataCopyWith<_$_Data> get copyWith =>
      __$$_DataCopyWithImpl<_$_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DataToJson(
      this,
    );
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {final dynamic? id,
      @JsonKey(name: 'profile_image') final String? profileImage,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'charge_currency') final Currency? chargeCurrency,
      final User? user,
      final List<Portfolio>? portfolio,
      final List<Experience>? experience,
      final List<Education>? education,
      final List<Certificate>? certificates,
      final Stats? stats,
      final dynamic? rating,
      final CountryClass? country,
      final CountryClass? language,
      final City? city,
      final List<Interest>? interests,
      @JsonKey(name: 'is_followed') final bool? isFollowed,
      final NextClass? badge,
      @JsonKey(name: 'is_bookmarked') final bool? isBookmarked,
      final String? status,
      final String? bio,
      final String? gender,
      @JsonKey(name: 'date_of_brith') final DateTime? dateOfBirth,
      final String? skill,
      @JsonKey(name: 'active_hour_start') final String? activeHourStart,
      @JsonKey(name: 'active_hour_end') final String? activeHourEnd,
      @JsonKey(name: 'experience_level') final String? experienceLevel,
      @JsonKey(name: 'profile_visibility') final String? profileVisibility,
      @JsonKey(name: 'task_preferences') final String? taskPreferences,
      @JsonKey(name: 'address_line1') final String? addressLine1,
      @JsonKey(name: 'address_line2') final String? addressLine2,
      @JsonKey(name: 'is_profile_verified') final bool? isProfileVerified,
      final String? designation,
      final int? points,
      @JsonKey(name: 'remaining_point') final int? remainingPoints,
      @JsonKey(name: 'followers_count') final int? followersCount,
      @JsonKey(name: 'following_count') final int? followingCount,
      final int? avatar,
      final List<dynamic>? subscription,
      @JsonKey(name: 'security_questions') final List<int>? securityQuestions,
      final String? slug,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'created_by') final CreatedBy? createdBy,
      final String? title,
      final Currency? currency,
      @JsonKey(name: 'is_online') final bool? isOnline,
      final Service? service,
      final List<dynamic>? images,
      @JsonKey(name: 'budget_type') final String? budgetType,
      @JsonKey(name: 'is_requested') final bool? isRequested,
      @JsonKey(name: 'budget_from') final String? budgetFrom,
      @JsonKey(name: 'budget_to') final String? budgetTo,
      final String? location,
      final int? count,
      @JsonKey(name: 'is_endorsed') final bool? isEndorsed,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate,
      @JsonKey(name: 'start_time') final String? startTime,
      @JsonKey(name: 'end_time') final String? endTime,
      final List<dynamic>? videos}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  dynamic? get id;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'charge_currency')
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
  dynamic? get rating;
  @override
  CountryClass? get country;
  @override
  CountryClass? get language;
  @override
  City? get city;
  @override
  List<Interest>? get interests;
  @override
  @JsonKey(name: 'is_followed')
  bool? get isFollowed;
  @override
  NextClass? get badge;
  @override
  @JsonKey(name: 'is_bookmarked')
  bool? get isBookmarked;
  @override
  String? get status;
  @override
  String? get bio;
  @override
  String? get gender;
  @override
  @JsonKey(name: 'date_of_brith')
  DateTime? get dateOfBirth;
  @override
  String? get skill;
  @override
  @JsonKey(name: 'active_hour_start')
  String? get activeHourStart;
  @override
  @JsonKey(name: 'active_hour_end')
  String? get activeHourEnd;
  @override
  @JsonKey(name: 'experience_level')
  String? get experienceLevel;
  @override
  @JsonKey(name: 'profile_visibility')
  String? get profileVisibility;
  @override
  @JsonKey(name: 'task_preferences')
  String? get taskPreferences;
  @override
  @JsonKey(name: 'address_line1')
  String? get addressLine1;
  @override
  @JsonKey(name: 'address_line2')
  String? get addressLine2;
  @override
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified;
  @override
  String? get designation;
  @override
  int? get points;
  @override
  @JsonKey(name: 'remaining_point')
  int? get remainingPoints;
  @override
  @JsonKey(name: 'followers_count')
  int? get followersCount;
  @override
  @JsonKey(name: 'following_count')
  int? get followingCount;
  @override
  int? get avatar;
  @override
  List<dynamic>? get subscription;
  @override
  @JsonKey(name: 'security_questions')
  List<int>? get securityQuestions;
  @override
  String? get slug;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'created_by')
  CreatedBy? get createdBy;
  @override
  String? get title;
  @override
  Currency? get currency;
  @override
  @JsonKey(name: 'is_online')
  bool? get isOnline;
  @override
  Service? get service;
  @override
  List<dynamic>? get images;
  @override
  @JsonKey(name: 'budget_type')
  String? get budgetType;
  @override
  @JsonKey(name: 'is_requested')
  bool? get isRequested;
  @override
  @JsonKey(name: 'budget_from')
  String? get budgetFrom;
  @override
  @JsonKey(name: 'budget_to')
  String? get budgetTo;
  @override
  String? get location;
  @override
  int? get count;
  @override
  @JsonKey(name: 'is_endorsed')
  bool? get isEndorsed;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  List<dynamic>? get videos;
  @override
  @JsonKey(ignore: true)
  _$$_DataCopyWith<_$_Data> get copyWith => throw _privateConstructorUsedError;
}

NextClass _$NextClassFromJson(Map<String, dynamic> json) {
  return _NextClass.fromJson(json);
}

/// @nodoc
mixin _$NextClass {
  int? get id => throw _privateConstructorUsedError;
  NextClass? get next => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_level_start')
  int? get progressLevelStart => throw _privateConstructorUsedError;
  @JsonKey(name: 'progress_level_end')
  int? get progressLevelEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NextClassCopyWith<NextClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NextClassCopyWith<$Res> {
  factory $NextClassCopyWith(NextClass value, $Res Function(NextClass) then) =
      _$NextClassCopyWithImpl<$Res, NextClass>;
  @useResult
  $Res call(
      {int? id,
      NextClass? next,
      String? image,
      String? title,
      @JsonKey(name: 'progress_level_start') int? progressLevelStart,
      @JsonKey(name: 'progress_level_end') int? progressLevelEnd});

  $NextClassCopyWith<$Res>? get next;
}

/// @nodoc
class _$NextClassCopyWithImpl<$Res, $Val extends NextClass>
    implements $NextClassCopyWith<$Res> {
  _$NextClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? next = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? progressLevelStart = freezed,
    Object? progressLevelEnd = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as NextClass?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLevelStart: freezed == progressLevelStart
          ? _value.progressLevelStart
          : progressLevelStart // ignore: cast_nullable_to_non_nullable
              as int?,
      progressLevelEnd: freezed == progressLevelEnd
          ? _value.progressLevelEnd
          : progressLevelEnd // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NextClassCopyWith<$Res>? get next {
    if (_value.next == null) {
      return null;
    }

    return $NextClassCopyWith<$Res>(_value.next!, (value) {
      return _then(_value.copyWith(next: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NextClassCopyWith<$Res> implements $NextClassCopyWith<$Res> {
  factory _$$_NextClassCopyWith(
          _$_NextClass value, $Res Function(_$_NextClass) then) =
      __$$_NextClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      NextClass? next,
      String? image,
      String? title,
      @JsonKey(name: 'progress_level_start') int? progressLevelStart,
      @JsonKey(name: 'progress_level_end') int? progressLevelEnd});

  @override
  $NextClassCopyWith<$Res>? get next;
}

/// @nodoc
class __$$_NextClassCopyWithImpl<$Res>
    extends _$NextClassCopyWithImpl<$Res, _$_NextClass>
    implements _$$_NextClassCopyWith<$Res> {
  __$$_NextClassCopyWithImpl(
      _$_NextClass _value, $Res Function(_$_NextClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? next = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? progressLevelStart = freezed,
    Object? progressLevelEnd = freezed,
  }) {
    return _then(_$_NextClass(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as NextClass?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      progressLevelStart: freezed == progressLevelStart
          ? _value.progressLevelStart
          : progressLevelStart // ignore: cast_nullable_to_non_nullable
              as int?,
      progressLevelEnd: freezed == progressLevelEnd
          ? _value.progressLevelEnd
          : progressLevelEnd // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NextClass implements _NextClass {
  const _$_NextClass(
      {this.id,
      this.next,
      this.image,
      this.title,
      @JsonKey(name: 'progress_level_start') this.progressLevelStart,
      @JsonKey(name: 'progress_level_end') this.progressLevelEnd});

  factory _$_NextClass.fromJson(Map<String, dynamic> json) =>
      _$$_NextClassFromJson(json);

  @override
  final int? id;
  @override
  final NextClass? next;
  @override
  final String? image;
  @override
  final String? title;
  @override
  @JsonKey(name: 'progress_level_start')
  final int? progressLevelStart;
  @override
  @JsonKey(name: 'progress_level_end')
  final int? progressLevelEnd;

  @override
  String toString() {
    return 'NextClass(id: $id, next: $next, image: $image, title: $title, progressLevelStart: $progressLevelStart, progressLevelEnd: $progressLevelEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NextClass &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.next, next) || other.next == next) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.progressLevelStart, progressLevelStart) ||
                other.progressLevelStart == progressLevelStart) &&
            (identical(other.progressLevelEnd, progressLevelEnd) ||
                other.progressLevelEnd == progressLevelEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, next, image, title,
      progressLevelStart, progressLevelEnd);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NextClassCopyWith<_$_NextClass> get copyWith =>
      __$$_NextClassCopyWithImpl<_$_NextClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NextClassToJson(
      this,
    );
  }
}

abstract class _NextClass implements NextClass {
  const factory _NextClass(
          {final int? id,
          final NextClass? next,
          final String? image,
          final String? title,
          @JsonKey(name: 'progress_level_start') final int? progressLevelStart,
          @JsonKey(name: 'progress_level_end') final int? progressLevelEnd}) =
      _$_NextClass;

  factory _NextClass.fromJson(Map<String, dynamic> json) =
      _$_NextClass.fromJson;

  @override
  int? get id;
  @override
  NextClass? get next;
  @override
  String? get image;
  @override
  String? get title;
  @override
  @JsonKey(name: 'progress_level_start')
  int? get progressLevelStart;
  @override
  @JsonKey(name: 'progress_level_end')
  int? get progressLevelEnd;
  @override
  @JsonKey(ignore: true)
  _$$_NextClassCopyWith<_$_NextClass> get copyWith =>
      throw _privateConstructorUsedError;
}

Certificate _$CertificateFromJson(Map<String, dynamic> json) {
  return _Certificate.fromJson(json);
}

/// @nodoc
mixin _$Certificate {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'issuing_organization')
  String? get issuingOrganization => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  bool? get doesExpire => throw _privateConstructorUsedError;
  @JsonKey(name: 'credential_id')
  String? get credentialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'certificate_url')
  String? get certificateUrl => throw _privateConstructorUsedError;
  dynamic? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expire_date')
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
      @JsonKey(name: 'issuing_organization') String? issuingOrganization,
      String? description,
      @JsonKey(name: 'created_at') bool? doesExpire,
      @JsonKey(name: 'credential_id') String? credentialId,
      @JsonKey(name: 'certificate_url') String? certificateUrl,
      dynamic? image,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'expire_date') DateTime? expireDate});
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
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      @JsonKey(name: 'issuing_organization') String? issuingOrganization,
      String? description,
      @JsonKey(name: 'created_at') bool? doesExpire,
      @JsonKey(name: 'credential_id') String? credentialId,
      @JsonKey(name: 'certificate_url') String? certificateUrl,
      dynamic? image,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'expire_date') DateTime? expireDate});
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
    Object? image = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as dynamic?,
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
      @JsonKey(name: 'issuing_organization') this.issuingOrganization,
      this.description,
      @JsonKey(name: 'created_at') this.doesExpire,
      @JsonKey(name: 'credential_id') this.credentialId,
      @JsonKey(name: 'certificate_url') this.certificateUrl,
      this.image,
      @JsonKey(name: 'issued_date') this.issuedDate,
      @JsonKey(name: 'expire_date') this.expireDate});

  factory _$_Certificate.fromJson(Map<String, dynamic> json) =>
      _$$_CertificateFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'issuing_organization')
  final String? issuingOrganization;
  @override
  final String? description;
  @override
  @JsonKey(name: 'created_at')
  final bool? doesExpire;
  @override
  @JsonKey(name: 'credential_id')
  final String? credentialId;
  @override
  @JsonKey(name: 'certificate_url')
  final String? certificateUrl;
  @override
  final dynamic? image;
  @override
  @JsonKey(name: 'issued_date')
  final DateTime? issuedDate;
  @override
  @JsonKey(name: 'expire_date')
  final DateTime? expireDate;

  @override
  String toString() {
    return 'Certificate(id: $id, name: $name, issuingOrganization: $issuingOrganization, description: $description, doesExpire: $doesExpire, credentialId: $credentialId, certificateUrl: $certificateUrl, image: $image, issuedDate: $issuedDate, expireDate: $expireDate)';
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
            const DeepCollectionEquality().equals(other.image, image) &&
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
      const DeepCollectionEquality().hash(image),
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
      @JsonKey(name: 'issuing_organization')
          final String? issuingOrganization,
      final String? description,
      @JsonKey(name: 'created_at')
          final bool? doesExpire,
      @JsonKey(name: 'credential_id')
          final String? credentialId,
      @JsonKey(name: 'certificate_url')
          final String? certificateUrl,
      final dynamic? image,
      @JsonKey(name: 'issued_date')
          final DateTime? issuedDate,
      @JsonKey(name: 'expire_date')
          final DateTime? expireDate}) = _$_Certificate;

  factory _Certificate.fromJson(Map<String, dynamic> json) =
      _$_Certificate.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'issuing_organization')
  String? get issuingOrganization;
  @override
  String? get description;
  @override
  @JsonKey(name: 'created_at')
  bool? get doesExpire;
  @override
  @JsonKey(name: 'credential_id')
  String? get credentialId;
  @override
  @JsonKey(name: 'certificate_url')
  String? get certificateUrl;
  @override
  dynamic? get image;
  @override
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate;
  @override
  @JsonKey(name: 'expire_date')
  DateTime? get expireDate;
  @override
  @JsonKey(ignore: true)
  _$$_CertificateCopyWith<_$_Certificate> get copyWith =>
      throw _privateConstructorUsedError;
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

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'local_name')
  String? get localName => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_code')
  String? get zipCode => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  dynamic? get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CityCopyWith<City> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CityCopyWith<$Res> {
  factory $CityCopyWith(City value, $Res Function(City) then) =
      _$CityCopyWithImpl<$Res, City>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'local_name') String? localName,
      @JsonKey(name: 'zip_code') String? zipCode,
      double? latitude,
      double? longitude,
      dynamic? country});
}

/// @nodoc
class _$CityCopyWithImpl<$Res, $Val extends City>
    implements $CityCopyWith<$Res> {
  _$CityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? localName = freezed,
    Object? zipCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
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
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CityCopyWith<$Res> implements $CityCopyWith<$Res> {
  factory _$$_CityCopyWith(_$_City value, $Res Function(_$_City) then) =
      __$$_CityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      @JsonKey(name: 'local_name') String? localName,
      @JsonKey(name: 'zip_code') String? zipCode,
      double? latitude,
      double? longitude,
      dynamic? country});
}

/// @nodoc
class __$$_CityCopyWithImpl<$Res> extends _$CityCopyWithImpl<$Res, _$_City>
    implements _$$_CityCopyWith<$Res> {
  __$$_CityCopyWithImpl(_$_City _value, $Res Function(_$_City) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? localName = freezed,
    Object? zipCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_City(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localName: freezed == localName
          ? _value.localName
          : localName // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City implements _City {
  const _$_City(
      {this.id,
      this.name,
      @JsonKey(name: 'local_name') this.localName,
      @JsonKey(name: 'zip_code') this.zipCode,
      this.latitude,
      this.longitude,
      this.country});

  factory _$_City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  @JsonKey(name: 'local_name')
  final String? localName;
  @override
  @JsonKey(name: 'zip_code')
  final String? zipCode;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final dynamic? country;

  @override
  String toString() {
    return 'City(id: $id, name: $name, localName: $localName, zipCode: $zipCode, latitude: $latitude, longitude: $longitude, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_City &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.localName, localName) ||
                other.localName == localName) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, localName, zipCode,
      latitude, longitude, const DeepCollectionEquality().hash(country));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CityCopyWith<_$_City> get copyWith =>
      __$$_CityCopyWithImpl<_$_City>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CityToJson(
      this,
    );
  }
}

abstract class _City implements City {
  const factory _City(
      {final int? id,
      final String? name,
      @JsonKey(name: 'local_name') final String? localName,
      @JsonKey(name: 'zip_code') final String? zipCode,
      final double? latitude,
      final double? longitude,
      final dynamic? country}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  @JsonKey(name: 'local_name')
  String? get localName;
  @override
  @JsonKey(name: 'zip_code')
  String? get zipCode;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  dynamic? get country;
  @override
  @JsonKey(ignore: true)
  _$$_CityCopyWith<_$_City> get copyWith => throw _privateConstructorUsedError;
}

CountryClass _$CountryClassFromJson(Map<String, dynamic> json) {
  return _CountryClass.fromJson(json);
}

/// @nodoc
mixin _$CountryClass {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryClassCopyWith<CountryClass> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryClassCopyWith<$Res> {
  factory $CountryClassCopyWith(
          CountryClass value, $Res Function(CountryClass) then) =
      _$CountryClassCopyWithImpl<$Res, CountryClass>;
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class _$CountryClassCopyWithImpl<$Res, $Val extends CountryClass>
    implements $CountryClassCopyWith<$Res> {
  _$CountryClassCopyWithImpl(this._value, this._then);

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
abstract class _$$_CountryClassCopyWith<$Res>
    implements $CountryClassCopyWith<$Res> {
  factory _$$_CountryClassCopyWith(
          _$_CountryClass value, $Res Function(_$_CountryClass) then) =
      __$$_CountryClassCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class __$$_CountryClassCopyWithImpl<$Res>
    extends _$CountryClassCopyWithImpl<$Res, _$_CountryClass>
    implements _$$_CountryClassCopyWith<$Res> {
  __$$_CountryClassCopyWithImpl(
      _$_CountryClass _value, $Res Function(_$_CountryClass) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_CountryClass(
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
class _$_CountryClass implements _CountryClass {
  const _$_CountryClass({this.name, this.code});

  factory _$_CountryClass.fromJson(Map<String, dynamic> json) =>
      _$$_CountryClassFromJson(json);

  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'CountryClass(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CountryClass &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryClassCopyWith<_$_CountryClass> get copyWith =>
      __$$_CountryClassCopyWithImpl<_$_CountryClass>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryClassToJson(
      this,
    );
  }
}

abstract class _CountryClass implements CountryClass {
  const factory _CountryClass({final String? name, final String? code}) =
      _$_CountryClass;

  factory _CountryClass.fromJson(Map<String, dynamic> json) =
      _$_CountryClass.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_CountryClassCopyWith<_$_CountryClass> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  String? get profileImage => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_followed')
  bool? get isFollowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;
  CreatedByBadge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_image') String? profileImage,
      String? bio,
      @JsonKey(name: 'created_at') String? createdAt,
      String? designation,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      CreatedByBadge? badge});

  $CreatedByBadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

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
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
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
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as CreatedByBadge?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CreatedByBadgeCopyWith<$Res>? get badge {
    if (_value.badge == null) {
      return null;
    }

    return $CreatedByBadgeCopyWith<$Res>(_value.badge!, (value) {
      return _then(_value.copyWith(badge: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreatedByCopyWith<$Res> implements $CreatedByCopyWith<$Res> {
  factory _$$_CreatedByCopyWith(
          _$_CreatedBy value, $Res Function(_$_CreatedBy) then) =
      __$$_CreatedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'profile_image') String? profileImage,
      String? bio,
      @JsonKey(name: 'created_at') String? createdAt,
      String? designation,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      CreatedByBadge? badge});

  @override
  $CreatedByBadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_CreatedByCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$_CreatedBy>
    implements _$$_CreatedByCopyWith<$Res> {
  __$$_CreatedByCopyWithImpl(
      _$_CreatedBy _value, $Res Function(_$_CreatedBy) _then)
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
    Object? isProfileVerified = freezed,
    Object? isFollowed = freezed,
    Object? isFollowing = freezed,
    Object? badge = freezed,
  }) {
    return _then(_$_CreatedBy(
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
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      designation: freezed == designation
          ? _value.designation
          : designation // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfileVerified: freezed == isProfileVerified
          ? _value.isProfileVerified
          : isProfileVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowed: freezed == isFollowed
          ? _value.isFollowed
          : isFollowed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFollowing: freezed == isFollowing
          ? _value.isFollowing
          : isFollowing // ignore: cast_nullable_to_non_nullable
              as bool?,
      badge: freezed == badge
          ? _value.badge
          : badge // ignore: cast_nullable_to_non_nullable
              as CreatedByBadge?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatedBy implements _CreatedBy {
  const _$_CreatedBy(
      {this.id,
      this.username,
      this.email,
      this.phone,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'middle_name') this.middleName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'profile_image') this.profileImage,
      this.bio,
      @JsonKey(name: 'created_at') this.createdAt,
      this.designation,
      @JsonKey(name: 'is_profile_verified') this.isProfileVerified,
      @JsonKey(name: 'is_followed') this.isFollowed,
      @JsonKey(name: 'is_following') this.isFollowing,
      this.badge});

  factory _$_CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$$_CreatedByFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'profile_image')
  final String? profileImage;
  @override
  final String? bio;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final String? designation;
  @override
  @JsonKey(name: 'is_profile_verified')
  final bool? isProfileVerified;
  @override
  @JsonKey(name: 'is_followed')
  final bool? isFollowed;
  @override
  @JsonKey(name: 'is_following')
  final bool? isFollowing;
  @override
  final CreatedByBadge? badge;

  @override
  String toString() {
    return 'CreatedBy(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
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
            (identical(other.isProfileVerified, isProfileVerified) ||
                other.isProfileVerified == isProfileVerified) &&
            (identical(other.isFollowed, isFollowed) ||
                other.isFollowed == isFollowed) &&
            (identical(other.isFollowing, isFollowing) ||
                other.isFollowing == isFollowing) &&
            (identical(other.badge, badge) || other.badge == badge));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      email,
      phone,
      fullName,
      firstName,
      middleName,
      lastName,
      profileImage,
      bio,
      createdAt,
      designation,
      isProfileVerified,
      isFollowed,
      isFollowing,
      badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      __$$_CreatedByCopyWithImpl<_$_CreatedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatedByToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
      {final String? id,
      final String? username,
      final String? email,
      final String? phone,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'middle_name') final String? middleName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'profile_image') final String? profileImage,
      final String? bio,
      @JsonKey(name: 'created_at') final String? createdAt,
      final String? designation,
      @JsonKey(name: 'is_profile_verified') final bool? isProfileVerified,
      @JsonKey(name: 'is_followed') final bool? isFollowed,
      @JsonKey(name: 'is_following') final bool? isFollowing,
      final CreatedByBadge? badge}) = _$_CreatedBy;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$_CreatedBy.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'middle_name')
  String? get middleName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'profile_image')
  String? get profileImage;
  @override
  String? get bio;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  String? get designation;
  @override
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified;
  @override
  @JsonKey(name: 'is_followed')
  bool? get isFollowed;
  @override
  @JsonKey(name: 'is_following')
  bool? get isFollowing;
  @override
  CreatedByBadge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedByBadge _$CreatedByBadgeFromJson(Map<String, dynamic> json) {
  return _CreatedByBadge.fromJson(json);
}

/// @nodoc
mixin _$CreatedByBadge {
  int? get id => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByBadgeCopyWith<CreatedByBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByBadgeCopyWith<$Res> {
  factory $CreatedByBadgeCopyWith(
          CreatedByBadge value, $Res Function(CreatedByBadge) then) =
      _$CreatedByBadgeCopyWithImpl<$Res, CreatedByBadge>;
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class _$CreatedByBadgeCopyWithImpl<$Res, $Val extends CreatedByBadge>
    implements $CreatedByBadgeCopyWith<$Res> {
  _$CreatedByBadgeCopyWithImpl(this._value, this._then);

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
abstract class _$$_CreatedByBadgeCopyWith<$Res>
    implements $CreatedByBadgeCopyWith<$Res> {
  factory _$$_CreatedByBadgeCopyWith(
          _$_CreatedByBadge value, $Res Function(_$_CreatedByBadge) then) =
      __$$_CreatedByBadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? image, String? title});
}

/// @nodoc
class __$$_CreatedByBadgeCopyWithImpl<$Res>
    extends _$CreatedByBadgeCopyWithImpl<$Res, _$_CreatedByBadge>
    implements _$$_CreatedByBadgeCopyWith<$Res> {
  __$$_CreatedByBadgeCopyWithImpl(
      _$_CreatedByBadge _value, $Res Function(_$_CreatedByBadge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_$_CreatedByBadge(
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
class _$_CreatedByBadge implements _CreatedByBadge {
  const _$_CreatedByBadge({this.id, this.image, this.title});

  factory _$_CreatedByBadge.fromJson(Map<String, dynamic> json) =>
      _$$_CreatedByBadgeFromJson(json);

  @override
  final int? id;
  @override
  final String? image;
  @override
  final String? title;

  @override
  String toString() {
    return 'CreatedByBadge(id: $id, image: $image, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedByBadge &&
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
  _$$_CreatedByBadgeCopyWith<_$_CreatedByBadge> get copyWith =>
      __$$_CreatedByBadgeCopyWithImpl<_$_CreatedByBadge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatedByBadgeToJson(
      this,
    );
  }
}

abstract class _CreatedByBadge implements CreatedByBadge {
  const factory _CreatedByBadge(
      {final int? id,
      final String? image,
      final String? title}) = _$_CreatedByBadge;

  factory _CreatedByBadge.fromJson(Map<String, dynamic> json) =
      _$_CreatedByBadge.fromJson;

  @override
  int? get id;
  @override
  String? get image;
  @override
  String? get title;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedByBadgeCopyWith<_$_CreatedByBadge> get copyWith =>
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
  @JsonKey(name: 'field_of_study')
  String? get fieldOfStudy => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
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
      @JsonKey(name: 'field_of_study') String? fieldOfStudy,
      String? location,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate});
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
      @JsonKey(name: 'field_of_study') String? fieldOfStudy,
      String? location,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate});
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
      @JsonKey(name: 'field_of_study') this.fieldOfStudy,
      this.location,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate});

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
  @JsonKey(name: 'field_of_study')
  final String? fieldOfStudy;
  @override
  final String? location;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
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
      @JsonKey(name: 'field_of_study') final String? fieldOfStudy,
      final String? location,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate}) = _$_Education;

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
  @JsonKey(name: 'field_of_study')
  String? get fieldOfStudy;
  @override
  String? get location;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_EducationCopyWith<_$_Education> get copyWith =>
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
  @JsonKey(name: 'employment_type')
  String? get employmentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'currently_working')
  bool? get currentlyWorking => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
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
      @JsonKey(name: 'employment_type') String? employmentType,
      @JsonKey(name: 'company_name') String? companyName,
      String? location,
      @JsonKey(name: 'currently_working') bool? currentlyWorking,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate});
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
      @JsonKey(name: 'employment_type') String? employmentType,
      @JsonKey(name: 'company_name') String? companyName,
      String? location,
      @JsonKey(name: 'currently_working') bool? currentlyWorking,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate});
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
      @JsonKey(name: 'employment_type') this.employmentType,
      @JsonKey(name: 'company_name') this.companyName,
      this.location,
      @JsonKey(name: 'currently_working') this.currentlyWorking,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate});

  factory _$_Experience.fromJson(Map<String, dynamic> json) =>
      _$$_ExperienceFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'employment_type')
  final String? employmentType;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  final String? location;
  @override
  @JsonKey(name: 'currently_working')
  final bool? currentlyWorking;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
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
      @JsonKey(name: 'employment_type') final String? employmentType,
      @JsonKey(name: 'company_name') final String? companyName,
      final String? location,
      @JsonKey(name: 'currently_working') final bool? currentlyWorking,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate}) = _$_Experience;

  factory _Experience.fromJson(Map<String, dynamic> json) =
      _$_Experience.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'employment_type')
  String? get employmentType;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  String? get location;
  @override
  @JsonKey(name: 'currently_working')
  bool? get currentlyWorking;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(ignore: true)
  _$$_ExperienceCopyWith<_$_Experience> get copyWith =>
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
  List<Image>? get files => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'cretential_url')
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
      List<Image>? files,
      String? title,
      String? description,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'cretential_url') String? credentialUrl});
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
              as List<Image>?,
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
      List<Image>? files,
      String? title,
      String? description,
      @JsonKey(name: 'issued_date') DateTime? issuedDate,
      @JsonKey(name: 'cretential_url') String? credentialUrl});
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
              as List<Image>?,
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
      final List<Image>? files,
      this.title,
      this.description,
      @JsonKey(name: 'issued_date') this.issuedDate,
      @JsonKey(name: 'cretential_url') this.credentialUrl})
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

  final List<Image>? _files;
  @override
  List<Image>? get files {
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
  @JsonKey(name: 'issued_date')
  final DateTime? issuedDate;
  @override
  @JsonKey(name: 'cretential_url')
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
          final List<Image>? files,
          final String? title,
          final String? description,
          @JsonKey(name: 'issued_date') final DateTime? issuedDate,
          @JsonKey(name: 'cretential_url') final String? credentialUrl}) =
      _$_Portfolio;

  factory _Portfolio.fromJson(Map<String, dynamic> json) =
      _$_Portfolio.fromJson;

  @override
  int? get id;
  @override
  List<Image>? get images;
  @override
  List<Image>? get files;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'issued_date')
  DateTime? get issuedDate;
  @override
  @JsonKey(name: 'cretential_url')
  String? get credentialUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PortfolioCopyWith<_$_Portfolio> get copyWith =>
      throw _privateConstructorUsedError;
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'media_type')
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
      {int? id,
      String? name,
      String? size,
      @JsonKey(name: 'media_type') String? mediaType,
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
              as int?,
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
      {int? id,
      String? name,
      String? size,
      @JsonKey(name: 'media_type') String? mediaType,
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
              as int?,
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
      @JsonKey(name: 'media_type') this.mediaType,
      this.media});

  factory _$_Image.fromJson(Map<String, dynamic> json) =>
      _$$_ImageFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? size;
  @override
  @JsonKey(name: 'media_type')
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
      {final int? id,
      final String? name,
      final String? size,
      @JsonKey(name: 'media_type') final String? mediaType,
      final String? media}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get size;
  @override
  @JsonKey(name: 'media_type')
  String? get mediaType;
  @override
  String? get media;
  @override
  @JsonKey(ignore: true)
  _$$_ImageCopyWith<_$_Image> get copyWith =>
      throw _privateConstructorUsedError;
}

RatingElement _$RatingElementFromJson(Map<String, dynamic> json) {
  return _RatingElement.fromJson(json);
}

/// @nodoc
mixin _$RatingElement {
  int? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating_count')
  int? get ratingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingElementCopyWith<RatingElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingElementCopyWith<$Res> {
  factory $RatingElementCopyWith(
          RatingElement value, $Res Function(RatingElement) then) =
      _$RatingElementCopyWithImpl<$Res, RatingElement>;
  @useResult
  $Res call({int? rating, @JsonKey(name: 'rating_count') int? ratingCount});
}

/// @nodoc
class _$RatingElementCopyWithImpl<$Res, $Val extends RatingElement>
    implements $RatingElementCopyWith<$Res> {
  _$RatingElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? ratingCount = freezed,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RatingElementCopyWith<$Res>
    implements $RatingElementCopyWith<$Res> {
  factory _$$_RatingElementCopyWith(
          _$_RatingElement value, $Res Function(_$_RatingElement) then) =
      __$$_RatingElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? rating, @JsonKey(name: 'rating_count') int? ratingCount});
}

/// @nodoc
class __$$_RatingElementCopyWithImpl<$Res>
    extends _$RatingElementCopyWithImpl<$Res, _$_RatingElement>
    implements _$$_RatingElementCopyWith<$Res> {
  __$$_RatingElementCopyWithImpl(
      _$_RatingElement _value, $Res Function(_$_RatingElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rating = freezed,
    Object? ratingCount = freezed,
  }) {
    return _then(_$_RatingElement(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RatingElement implements _RatingElement {
  const _$_RatingElement(
      {this.rating, @JsonKey(name: 'rating_count') this.ratingCount});

  factory _$_RatingElement.fromJson(Map<String, dynamic> json) =>
      _$$_RatingElementFromJson(json);

  @override
  final int? rating;
  @override
  @JsonKey(name: 'rating_count')
  final int? ratingCount;

  @override
  String toString() {
    return 'RatingElement(rating: $rating, ratingCount: $ratingCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RatingElement &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingCount, ratingCount) ||
                other.ratingCount == ratingCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, rating, ratingCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RatingElementCopyWith<_$_RatingElement> get copyWith =>
      __$$_RatingElementCopyWithImpl<_$_RatingElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RatingElementToJson(
      this,
    );
  }
}

abstract class _RatingElement implements RatingElement {
  const factory _RatingElement(
          {final int? rating,
          @JsonKey(name: 'rating_count') final int? ratingCount}) =
      _$_RatingElement;

  factory _RatingElement.fromJson(Map<String, dynamic> json) =
      _$_RatingElement.fromJson;

  @override
  int? get rating;
  @override
  @JsonKey(name: 'rating_count')
  int? get ratingCount;
  @override
  @JsonKey(ignore: true)
  _$$_RatingElementCopyWith<_$_RatingElement> get copyWith =>
      throw _privateConstructorUsedError;
}

PurpleRating _$PurpleRatingFromJson(Map<String, dynamic> json) {
  return _PurpleRating.fromJson(json);
}

/// @nodoc
mixin _$PurpleRating {
  @JsonKey(name: 'user_rating_count')
  int? get userRatingCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'avg_rating')
  double? get avgRating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PurpleRatingCopyWith<PurpleRating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurpleRatingCopyWith<$Res> {
  factory $PurpleRatingCopyWith(
          PurpleRating value, $Res Function(PurpleRating) then) =
      _$PurpleRatingCopyWithImpl<$Res, PurpleRating>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_rating_count') int? userRatingCount,
      @JsonKey(name: 'avg_rating') double? avgRating});
}

/// @nodoc
class _$PurpleRatingCopyWithImpl<$Res, $Val extends PurpleRating>
    implements $PurpleRatingCopyWith<$Res> {
  _$PurpleRatingCopyWithImpl(this._value, this._then);

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
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PurpleRatingCopyWith<$Res>
    implements $PurpleRatingCopyWith<$Res> {
  factory _$$_PurpleRatingCopyWith(
          _$_PurpleRating value, $Res Function(_$_PurpleRating) then) =
      __$$_PurpleRatingCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_rating_count') int? userRatingCount,
      @JsonKey(name: 'avg_rating') double? avgRating});
}

/// @nodoc
class __$$_PurpleRatingCopyWithImpl<$Res>
    extends _$PurpleRatingCopyWithImpl<$Res, _$_PurpleRating>
    implements _$$_PurpleRatingCopyWith<$Res> {
  __$$_PurpleRatingCopyWithImpl(
      _$_PurpleRating _value, $Res Function(_$_PurpleRating) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userRatingCount = freezed,
    Object? avgRating = freezed,
  }) {
    return _then(_$_PurpleRating(
      userRatingCount: freezed == userRatingCount
          ? _value.userRatingCount
          : userRatingCount // ignore: cast_nullable_to_non_nullable
              as int?,
      avgRating: freezed == avgRating
          ? _value.avgRating
          : avgRating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PurpleRating implements _PurpleRating {
  const _$_PurpleRating(
      {@JsonKey(name: 'user_rating_count') this.userRatingCount,
      @JsonKey(name: 'avg_rating') this.avgRating});

  factory _$_PurpleRating.fromJson(Map<String, dynamic> json) =>
      _$$_PurpleRatingFromJson(json);

  @override
  @JsonKey(name: 'user_rating_count')
  final int? userRatingCount;
  @override
  @JsonKey(name: 'avg_rating')
  final double? avgRating;

  @override
  String toString() {
    return 'PurpleRating(userRatingCount: $userRatingCount, avgRating: $avgRating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PurpleRating &&
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
  _$$_PurpleRatingCopyWith<_$_PurpleRating> get copyWith =>
      __$$_PurpleRatingCopyWithImpl<_$_PurpleRating>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PurpleRatingToJson(
      this,
    );
  }
}

abstract class _PurpleRating implements PurpleRating {
  const factory _PurpleRating(
      {@JsonKey(name: 'user_rating_count') final int? userRatingCount,
      @JsonKey(name: 'avg_rating') final double? avgRating}) = _$_PurpleRating;

  factory _PurpleRating.fromJson(Map<String, dynamic> json) =
      _$_PurpleRating.fromJson;

  @override
  @JsonKey(name: 'user_rating_count')
  int? get userRatingCount;
  @override
  @JsonKey(name: 'avg_rating')
  double? get avgRating;
  @override
  @JsonKey(ignore: true)
  _$$_PurpleRatingCopyWith<_$_PurpleRating> get copyWith =>
      throw _privateConstructorUsedError;
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_verified')
  bool? get isVerified => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'required_documents')
  List<dynamic>? get requiredDocuments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceCopyWith<Service> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceCopyWith<$Res> {
  factory $ServiceCopyWith(Service value, $Res Function(Service) then) =
      _$ServiceCopyWithImpl<$Res, Service>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_verified') bool? isVerified,
      Category? category,
      List<Image>? images,
      @JsonKey(name: 'required_documents') List<dynamic>? requiredDocuments});

  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class _$ServiceCopyWithImpl<$Res, $Val extends Service>
    implements $ServiceCopyWith<$Res> {
  _$ServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isActive = freezed,
    Object? isVerified = freezed,
    Object? category = freezed,
    Object? images = freezed,
    Object? requiredDocuments = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      requiredDocuments: freezed == requiredDocuments
          ? _value.requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ServiceCopyWith<$Res> implements $ServiceCopyWith<$Res> {
  factory _$$_ServiceCopyWith(
          _$_Service value, $Res Function(_$_Service) then) =
      __$$_ServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_verified') bool? isVerified,
      Category? category,
      List<Image>? images,
      @JsonKey(name: 'required_documents') List<dynamic>? requiredDocuments});

  @override
  $CategoryCopyWith<$Res>? get category;
}

/// @nodoc
class __$$_ServiceCopyWithImpl<$Res>
    extends _$ServiceCopyWithImpl<$Res, _$_Service>
    implements _$$_ServiceCopyWith<$Res> {
  __$$_ServiceCopyWithImpl(_$_Service _value, $Res Function(_$_Service) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? isActive = freezed,
    Object? isVerified = freezed,
    Object? category = freezed,
    Object? images = freezed,
    Object? requiredDocuments = freezed,
  }) {
    return _then(_$_Service(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isVerified: freezed == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      requiredDocuments: freezed == requiredDocuments
          ? _value._requiredDocuments
          : requiredDocuments // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Service implements _Service {
  const _$_Service(
      {this.id,
      this.title,
      @JsonKey(name: 'is_active')
          this.isActive,
      @JsonKey(name: 'is_verified')
          this.isVerified,
      this.category,
      final List<Image>? images,
      @JsonKey(name: 'required_documents')
          final List<dynamic>? requiredDocuments})
      : _images = images,
        _requiredDocuments = requiredDocuments;

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'is_verified')
  final bool? isVerified;
  @override
  final Category? category;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _requiredDocuments;
  @override
  @JsonKey(name: 'required_documents')
  List<dynamic>? get requiredDocuments {
    final value = _requiredDocuments;
    if (value == null) return null;
    if (_requiredDocuments is EqualUnmodifiableListView)
      return _requiredDocuments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Service(id: $id, title: $title, isActive: $isActive, isVerified: $isVerified, category: $category, images: $images, requiredDocuments: $requiredDocuments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Service &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified) &&
            (identical(other.category, category) ||
                other.category == category) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality()
                .equals(other._requiredDocuments, _requiredDocuments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      isActive,
      isVerified,
      category,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_requiredDocuments));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      __$$_ServiceCopyWithImpl<_$_Service>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceToJson(
      this,
    );
  }
}

abstract class _Service implements Service {
  const factory _Service(
      {final String? id,
      final String? title,
      @JsonKey(name: 'is_active')
          final bool? isActive,
      @JsonKey(name: 'is_verified')
          final bool? isVerified,
      final Category? category,
      final List<Image>? images,
      @JsonKey(name: 'required_documents')
          final List<dynamic>? requiredDocuments}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'is_verified')
  bool? get isVerified;
  @override
  Category? get category;
  @override
  List<Image>? get images;
  @override
  @JsonKey(name: 'required_documents')
  List<dynamic>? get requiredDocuments;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceCopyWith<_$_Service> get copyWith =>
      throw _privateConstructorUsedError;
}

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

/// @nodoc
mixin _$Category {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get level => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoryCopyWith<Category> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCopyWith<$Res> {
  factory $CategoryCopyWith(Category value, $Res Function(Category) then) =
      _$CategoryCopyWithImpl<$Res, Category>;
  @useResult
  $Res call({int? id, String? name, int? level, String? slug});
}

/// @nodoc
class _$CategoryCopyWithImpl<$Res, $Val extends Category>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? slug = freezed,
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
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$$_CategoryCopyWith(
          _$_Category value, $Res Function(_$_Category) then) =
      __$$_CategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, String? name, int? level, String? slug});
}

/// @nodoc
class __$$_CategoryCopyWithImpl<$Res>
    extends _$CategoryCopyWithImpl<$Res, _$_Category>
    implements _$$_CategoryCopyWith<$Res> {
  __$$_CategoryCopyWithImpl(
      _$_Category _value, $Res Function(_$_Category) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? level = freezed,
    Object? slug = freezed,
  }) {
    return _then(_$_Category(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      level: freezed == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Category implements _Category {
  const _$_Category({this.id, this.name, this.level, this.slug});

  factory _$_Category.fromJson(Map<String, dynamic> json) =>
      _$$_CategoryFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? level;
  @override
  final String? slug;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, level: $level, slug: $slug)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Category &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.slug, slug) || other.slug == slug));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, level, slug);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      __$$_CategoryCopyWithImpl<_$_Category>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoryToJson(
      this,
    );
  }
}

abstract class _Category implements Category {
  const factory _Category(
      {final int? id,
      final String? name,
      final int? level,
      final String? slug}) = _$_Category;

  factory _Category.fromJson(Map<String, dynamic> json) = _$_Category.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get level;
  @override
  String? get slug;
  @override
  @JsonKey(ignore: true)
  _$$_CategoryCopyWith<_$_Category> get copyWith =>
      throw _privateConstructorUsedError;
}

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return _Stats.fromJson(json);
}

/// @nodoc
mixin _$Stats {
  @JsonKey(name: 'success_rate')
  double? get successRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'happy_clients')
  int? get happyClients => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_completed')
  int? get taskCompleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_reviews')
  int? get userReviews => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_assigned')
  int? get taskAssigned => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_in_progress')
  int? get taskInProgress => throw _privateConstructorUsedError;
  @JsonKey(name: 'task_cancelled')
  int? get taskCancelled => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'success_rate') double? successRate,
      @JsonKey(name: 'happy_clients') int? happyClients,
      @JsonKey(name: 'task_completed') int? taskCompleted,
      @JsonKey(name: 'user_reviews') int? userReviews,
      @JsonKey(name: 'task_assigned') int? taskAssigned,
      @JsonKey(name: 'task_in_progress') int? taskInProgress,
      @JsonKey(name: 'task_cancelled') int? taskCancelled});
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
              as int?,
      taskCompleted: freezed == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      userReviews: freezed == userReviews
          ? _value.userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      taskAssigned: freezed == taskAssigned
          ? _value.taskAssigned
          : taskAssigned // ignore: cast_nullable_to_non_nullable
              as int?,
      taskInProgress: freezed == taskInProgress
          ? _value.taskInProgress
          : taskInProgress // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCancelled: freezed == taskCancelled
          ? _value.taskCancelled
          : taskCancelled // ignore: cast_nullable_to_non_nullable
              as int?,
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
      {@JsonKey(name: 'success_rate') double? successRate,
      @JsonKey(name: 'happy_clients') int? happyClients,
      @JsonKey(name: 'task_completed') int? taskCompleted,
      @JsonKey(name: 'user_reviews') int? userReviews,
      @JsonKey(name: 'task_assigned') int? taskAssigned,
      @JsonKey(name: 'task_in_progress') int? taskInProgress,
      @JsonKey(name: 'task_cancelled') int? taskCancelled});
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
              as int?,
      taskCompleted: freezed == taskCompleted
          ? _value.taskCompleted
          : taskCompleted // ignore: cast_nullable_to_non_nullable
              as int?,
      userReviews: freezed == userReviews
          ? _value.userReviews
          : userReviews // ignore: cast_nullable_to_non_nullable
              as int?,
      taskAssigned: freezed == taskAssigned
          ? _value.taskAssigned
          : taskAssigned // ignore: cast_nullable_to_non_nullable
              as int?,
      taskInProgress: freezed == taskInProgress
          ? _value.taskInProgress
          : taskInProgress // ignore: cast_nullable_to_non_nullable
              as int?,
      taskCancelled: freezed == taskCancelled
          ? _value.taskCancelled
          : taskCancelled // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Stats implements _Stats {
  const _$_Stats(
      {@JsonKey(name: 'success_rate') this.successRate,
      @JsonKey(name: 'happy_clients') this.happyClients,
      @JsonKey(name: 'task_completed') this.taskCompleted,
      @JsonKey(name: 'user_reviews') this.userReviews,
      @JsonKey(name: 'task_assigned') this.taskAssigned,
      @JsonKey(name: 'task_in_progress') this.taskInProgress,
      @JsonKey(name: 'task_cancelled') this.taskCancelled});

  factory _$_Stats.fromJson(Map<String, dynamic> json) =>
      _$$_StatsFromJson(json);

  @override
  @JsonKey(name: 'success_rate')
  final double? successRate;
  @override
  @JsonKey(name: 'happy_clients')
  final int? happyClients;
  @override
  @JsonKey(name: 'task_completed')
  final int? taskCompleted;
  @override
  @JsonKey(name: 'user_reviews')
  final int? userReviews;
  @override
  @JsonKey(name: 'task_assigned')
  final int? taskAssigned;
  @override
  @JsonKey(name: 'task_in_progress')
  final int? taskInProgress;
  @override
  @JsonKey(name: 'task_cancelled')
  final int? taskCancelled;

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
      {@JsonKey(name: 'success_rate') final double? successRate,
      @JsonKey(name: 'happy_clients') final int? happyClients,
      @JsonKey(name: 'task_completed') final int? taskCompleted,
      @JsonKey(name: 'user_reviews') final int? userReviews,
      @JsonKey(name: 'task_assigned') final int? taskAssigned,
      @JsonKey(name: 'task_in_progress') final int? taskInProgress,
      @JsonKey(name: 'task_cancelled') final int? taskCancelled}) = _$_Stats;

  factory _Stats.fromJson(Map<String, dynamic> json) = _$_Stats.fromJson;

  @override
  @JsonKey(name: 'success_rate')
  double? get successRate;
  @override
  @JsonKey(name: 'happy_clients')
  int? get happyClients;
  @override
  @JsonKey(name: 'task_completed')
  int? get taskCompleted;
  @override
  @JsonKey(name: 'user_reviews')
  int? get userReviews;
  @override
  @JsonKey(name: 'task_assigned')
  int? get taskAssigned;
  @override
  @JsonKey(name: 'task_in_progress')
  int? get taskInProgress;
  @override
  @JsonKey(name: 'task_cancelled')
  int? get taskCancelled;
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
  dynamic? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'middle_name')
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;

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
      dynamic? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'created_at') String? createdAt});
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
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      dynamic? phone,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'middle_name') String? middleName,
      @JsonKey(name: 'last_name') String? lastName,
      @JsonKey(name: 'created_at') String? createdAt});
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
    Object? phone = freezed,
    Object? fullName = freezed,
    Object? firstName = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
      this.phone,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'middle_name') this.middleName,
      @JsonKey(name: 'last_name') this.lastName,
      @JsonKey(name: 'created_at') this.createdAt});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final dynamic? phone;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'middle_name')
  final String? middleName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, createdAt: $createdAt)';
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
            const DeepCollectionEquality().equals(other.phone, phone) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
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
      const DeepCollectionEquality().hash(phone),
      fullName,
      firstName,
      middleName,
      lastName,
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
      final dynamic? phone,
      @JsonKey(name: 'full_name') final String? fullName,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'middle_name') final String? middleName,
      @JsonKey(name: 'last_name') final String? lastName,
      @JsonKey(name: 'created_at') final String? createdAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  dynamic? get phone;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'middle_name')
  String? get middleName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
