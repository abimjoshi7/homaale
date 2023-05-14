// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchRes _$SearchResFromJson(Map<String, dynamic> json) {
  return _SearchRes.fromJson(json);
}

/// @nodoc
mixin _$SearchRes {
  @JsonKey(name: "task")
  List<ServiceElement>? get task => throw _privateConstructorUsedError;
  @JsonKey(name: "service")
  List<ServiceElement>? get service => throw _privateConstructorUsedError;
  @JsonKey(name: "tasker")
  List<Tasker>? get tasker => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchResCopyWith<SearchRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchResCopyWith<$Res> {
  factory $SearchResCopyWith(SearchRes value, $Res Function(SearchRes) then) =
      _$SearchResCopyWithImpl<$Res, SearchRes>;
  @useResult
  $Res call(
      {@JsonKey(name: "task") List<ServiceElement>? task,
      @JsonKey(name: "service") List<ServiceElement>? service,
      @JsonKey(name: "tasker") List<Tasker>? tasker});
}

/// @nodoc
class _$SearchResCopyWithImpl<$Res, $Val extends SearchRes>
    implements $SearchResCopyWith<$Res> {
  _$SearchResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? service = freezed,
    Object? tasker = freezed,
  }) {
    return _then(_value.copyWith(
      task: freezed == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as List<ServiceElement>?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as List<ServiceElement>?,
      tasker: freezed == tasker
          ? _value.tasker
          : tasker // ignore: cast_nullable_to_non_nullable
              as List<Tasker>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchResCopyWith<$Res> implements $SearchResCopyWith<$Res> {
  factory _$$_SearchResCopyWith(
          _$_SearchRes value, $Res Function(_$_SearchRes) then) =
      __$$_SearchResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "task") List<ServiceElement>? task,
      @JsonKey(name: "service") List<ServiceElement>? service,
      @JsonKey(name: "tasker") List<Tasker>? tasker});
}

/// @nodoc
class __$$_SearchResCopyWithImpl<$Res>
    extends _$SearchResCopyWithImpl<$Res, _$_SearchRes>
    implements _$$_SearchResCopyWith<$Res> {
  __$$_SearchResCopyWithImpl(
      _$_SearchRes _value, $Res Function(_$_SearchRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? task = freezed,
    Object? service = freezed,
    Object? tasker = freezed,
  }) {
    return _then(_$_SearchRes(
      task: freezed == task
          ? _value._task
          : task // ignore: cast_nullable_to_non_nullable
              as List<ServiceElement>?,
      service: freezed == service
          ? _value._service
          : service // ignore: cast_nullable_to_non_nullable
              as List<ServiceElement>?,
      tasker: freezed == tasker
          ? _value._tasker
          : tasker // ignore: cast_nullable_to_non_nullable
              as List<Tasker>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchRes implements _SearchRes {
  const _$_SearchRes(
      {@JsonKey(name: "task") final List<ServiceElement>? task,
      @JsonKey(name: "service") final List<ServiceElement>? service,
      @JsonKey(name: "tasker") final List<Tasker>? tasker})
      : _task = task,
        _service = service,
        _tasker = tasker;

  factory _$_SearchRes.fromJson(Map<String, dynamic> json) =>
      _$$_SearchResFromJson(json);

  final List<ServiceElement>? _task;
  @override
  @JsonKey(name: "task")
  List<ServiceElement>? get task {
    final value = _task;
    if (value == null) return null;
    if (_task is EqualUnmodifiableListView) return _task;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<ServiceElement>? _service;
  @override
  @JsonKey(name: "service")
  List<ServiceElement>? get service {
    final value = _service;
    if (value == null) return null;
    if (_service is EqualUnmodifiableListView) return _service;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Tasker>? _tasker;
  @override
  @JsonKey(name: "tasker")
  List<Tasker>? get tasker {
    final value = _tasker;
    if (value == null) return null;
    if (_tasker is EqualUnmodifiableListView) return _tasker;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'SearchRes(task: $task, service: $service, tasker: $tasker)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchRes &&
            const DeepCollectionEquality().equals(other._task, _task) &&
            const DeepCollectionEquality().equals(other._service, _service) &&
            const DeepCollectionEquality().equals(other._tasker, _tasker));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_task),
      const DeepCollectionEquality().hash(_service),
      const DeepCollectionEquality().hash(_tasker));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchResCopyWith<_$_SearchRes> get copyWith =>
      __$$_SearchResCopyWithImpl<_$_SearchRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchResToJson(
      this,
    );
  }
}

abstract class _SearchRes implements SearchRes {
  const factory _SearchRes(
      {@JsonKey(name: "task") final List<ServiceElement>? task,
      @JsonKey(name: "service") final List<ServiceElement>? service,
      @JsonKey(name: "tasker") final List<Tasker>? tasker}) = _$_SearchRes;

  factory _SearchRes.fromJson(Map<String, dynamic> json) =
      _$_SearchRes.fromJson;

  @override
  @JsonKey(name: "task")
  List<ServiceElement>? get task;
  @override
  @JsonKey(name: "service")
  List<ServiceElement>? get service;
  @override
  @JsonKey(name: "tasker")
  List<Tasker>? get tasker;
  @override
  @JsonKey(ignore: true)
  _$$_SearchResCopyWith<_$_SearchRes> get copyWith =>
      throw _privateConstructorUsedError;
}

ServiceElement _$ServiceElementFromJson(Map<String, dynamic> json) {
  return _ServiceElement.fromJson(json);
}

/// @nodoc
mixin _$ServiceElement {
  String? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "is_online")
  bool? get isOnline => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<Rating>? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_type")
  String? get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: "is_requested")
  bool? get isRequested => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_from")
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_to")
  String? get budgetTo => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  String? get endTime => throw _privateConstructorUsedError;
  List<Image>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ServiceElementCopyWith<ServiceElement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceElementCopyWith<$Res> {
  factory $ServiceElementCopyWith(
          ServiceElement value, $Res Function(ServiceElement) then) =
      _$ServiceElementCopyWithImpl<$Res, ServiceElement>;
  @useResult
  $Res call(
      {String? id,
      String? slug,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? title,
      Currency? currency,
      City? city,
      @JsonKey(name: "is_online") bool? isOnline,
      Service? service,
      List<Image>? images,
      List<Rating>? rating,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      List<Image>? videos,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked});

  $CreatedByCopyWith<$Res>? get createdBy;
  $CurrencyCopyWith<$Res>? get currency;
  $CityCopyWith<$Res>? get city;
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class _$ServiceElementCopyWithImpl<$Res, $Val extends ServiceElement>
    implements $ServiceElementCopyWith<$Res> {
  _$ServiceElementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? rating = freezed,
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
    Object? isBookmarked = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
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
              as List<Image>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
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
              as List<Image>?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
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
abstract class _$$_ServiceElementCopyWith<$Res>
    implements $ServiceElementCopyWith<$Res> {
  factory _$$_ServiceElementCopyWith(
          _$_ServiceElement value, $Res Function(_$_ServiceElement) then) =
      __$$_ServiceElementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? slug,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? title,
      Currency? currency,
      City? city,
      @JsonKey(name: "is_online") bool? isOnline,
      Service? service,
      List<Image>? images,
      List<Rating>? rating,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      List<Image>? videos,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class __$$_ServiceElementCopyWithImpl<$Res>
    extends _$ServiceElementCopyWithImpl<$Res, _$_ServiceElement>
    implements _$$_ServiceElementCopyWith<$Res> {
  __$$_ServiceElementCopyWithImpl(
      _$_ServiceElement _value, $Res Function(_$_ServiceElement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? rating = freezed,
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
    Object? isBookmarked = freezed,
  }) {
    return _then(_$_ServiceElement(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
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
              as List<Image>?,
      rating: freezed == rating
          ? _value._rating
          : rating // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
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
              as List<Image>?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ServiceElement implements _ServiceElement {
  const _$_ServiceElement(
      {this.id,
      this.slug,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "created_by") this.createdBy,
      this.title,
      this.currency,
      this.city,
      @JsonKey(name: "is_online") this.isOnline,
      this.service,
      final List<Image>? images,
      final List<Rating>? rating,
      @JsonKey(name: "budget_type") this.budgetType,
      @JsonKey(name: "is_requested") this.isRequested,
      @JsonKey(name: "budget_from") this.budgetFrom,
      @JsonKey(name: "budget_to") this.budgetTo,
      this.location,
      this.count,
      @JsonKey(name: "is_endorsed") this.isEndorsed,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime,
      final List<Image>? videos,
      @JsonKey(name: "is_bookmarked") this.isBookmarked})
      : _images = images,
        _rating = rating,
        _videos = videos;

  factory _$_ServiceElement.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceElementFromJson(json);

  @override
  final String? id;
  @override
  final String? slug;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @override
  final String? title;
  @override
  final Currency? currency;
  @override
  final City? city;
  @override
  @JsonKey(name: "is_online")
  final bool? isOnline;
  @override
  final Service? service;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Rating>? _rating;
  @override
  List<Rating>? get rating {
    final value = _rating;
    if (value == null) return null;
    if (_rating is EqualUnmodifiableListView) return _rating;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "budget_type")
  final String? budgetType;
  @override
  @JsonKey(name: "is_requested")
  final bool? isRequested;
  @override
  @JsonKey(name: "budget_from")
  final String? budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  final String? budgetTo;
  @override
  final String? location;
  @override
  final int? count;
  @override
  @JsonKey(name: "is_endorsed")
  final bool? isEndorsed;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;
  @override
  @JsonKey(name: "start_time")
  final String? startTime;
  @override
  @JsonKey(name: "end_time")
  final String? endTime;
  final List<Image>? _videos;
  @override
  List<Image>? get videos {
    final value = _videos;
    if (value == null) return null;
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "is_bookmarked")
  final bool? isBookmarked;

  @override
  String toString() {
    return 'ServiceElement(id: $id, slug: $slug, createdAt: $createdAt, createdBy: $createdBy, title: $title, currency: $currency, city: $city, isOnline: $isOnline, service: $service, images: $images, rating: $rating, budgetType: $budgetType, isRequested: $isRequested, budgetFrom: $budgetFrom, budgetTo: $budgetTo, location: $location, count: $count, isEndorsed: $isEndorsed, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, videos: $videos, isBookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ServiceElement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._rating, _rating) &&
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
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        slug,
        createdAt,
        createdBy,
        title,
        currency,
        city,
        isOnline,
        service,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_rating),
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
        const DeepCollectionEquality().hash(_videos),
        isBookmarked
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ServiceElementCopyWith<_$_ServiceElement> get copyWith =>
      __$$_ServiceElementCopyWithImpl<_$_ServiceElement>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ServiceElementToJson(
      this,
    );
  }
}

abstract class _ServiceElement implements ServiceElement {
  const factory _ServiceElement(
          {final String? id,
          final String? slug,
          @JsonKey(name: "created_at") final DateTime? createdAt,
          @JsonKey(name: "created_by") final CreatedBy? createdBy,
          final String? title,
          final Currency? currency,
          final City? city,
          @JsonKey(name: "is_online") final bool? isOnline,
          final Service? service,
          final List<Image>? images,
          final List<Rating>? rating,
          @JsonKey(name: "budget_type") final String? budgetType,
          @JsonKey(name: "is_requested") final bool? isRequested,
          @JsonKey(name: "budget_from") final String? budgetFrom,
          @JsonKey(name: "budget_to") final String? budgetTo,
          final String? location,
          final int? count,
          @JsonKey(name: "is_endorsed") final bool? isEndorsed,
          @JsonKey(name: "start_date") final DateTime? startDate,
          @JsonKey(name: "end_date") final DateTime? endDate,
          @JsonKey(name: "start_time") final String? startTime,
          @JsonKey(name: "end_time") final String? endTime,
          final List<Image>? videos,
          @JsonKey(name: "is_bookmarked") final bool? isBookmarked}) =
      _$_ServiceElement;

  factory _ServiceElement.fromJson(Map<String, dynamic> json) =
      _$_ServiceElement.fromJson;

  @override
  String? get id;
  @override
  String? get slug;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy;
  @override
  String? get title;
  @override
  Currency? get currency;
  @override
  City? get city;
  @override
  @JsonKey(name: "is_online")
  bool? get isOnline;
  @override
  Service? get service;
  @override
  List<Image>? get images;
  @override
  List<Rating>? get rating;
  @override
  @JsonKey(name: "budget_type")
  String? get budgetType;
  @override
  @JsonKey(name: "is_requested")
  bool? get isRequested;
  @override
  @JsonKey(name: "budget_from")
  String? get budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  String? get budgetTo;
  @override
  String? get location;
  @override
  int? get count;
  @override
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(name: "start_time")
  String? get startTime;
  @override
  @JsonKey(name: "end_time")
  String? get endTime;
  @override
  List<Image>? get videos;
  @override
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked;
  @override
  @JsonKey(ignore: true)
  _$$_ServiceElementCopyWith<_$_ServiceElement> get copyWith =>
      throw _privateConstructorUsedError;
}

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return _Rating.fromJson(json);
}

/// @nodoc
mixin _$Rating {
  num? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "rating_count")
  num? get ratingCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RatingCopyWith<Rating> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingCopyWith<$Res> {
  factory $RatingCopyWith(Rating value, $Res Function(Rating) then) =
      _$RatingCopyWithImpl<$Res, Rating>;
  @useResult
  $Res call({num? rating, @JsonKey(name: "rating_count") num? ratingCount});
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
    Object? rating = freezed,
    Object? ratingCount = freezed,
  }) {
    return _then(_value.copyWith(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
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
  $Res call({num? rating, @JsonKey(name: "rating_count") num? ratingCount});
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
    Object? rating = freezed,
    Object? ratingCount = freezed,
  }) {
    return _then(_$_Rating(
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as num?,
      ratingCount: freezed == ratingCount
          ? _value.ratingCount
          : ratingCount // ignore: cast_nullable_to_non_nullable
              as num?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rating implements _Rating {
  const _$_Rating(
      {this.rating, @JsonKey(name: "rating_count") this.ratingCount});

  factory _$_Rating.fromJson(Map<String, dynamic> json) =>
      _$$_RatingFromJson(json);

  @override
  final num? rating;
  @override
  @JsonKey(name: "rating_count")
  final num? ratingCount;

  @override
  String toString() {
    return 'Rating(rating: $rating, ratingCount: $ratingCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rating &&
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
      {final num? rating,
      @JsonKey(name: "rating_count") final num? ratingCount}) = _$_Rating;

  factory _Rating.fromJson(Map<String, dynamic> json) = _$_Rating.fromJson;

  @override
  num? get rating;
  @override
  @JsonKey(name: "rating_count")
  num? get ratingCount;
  @override
  @JsonKey(ignore: true)
  _$$_RatingCopyWith<_$_Rating> get copyWith =>
      throw _privateConstructorUsedError;
}

Tasker _$TaskerFromJson(Map<String, dynamic> json) {
  return _Tasker.fromJson(json);
}

/// @nodoc
mixin _$Tasker {
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
  String? get skill => throw _privateConstructorUsedError;
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
  @JsonKey(name: "security_questions")
  List<dynamic>? get securityQuestions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskerCopyWith<Tasker> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskerCopyWith<$Res> {
  factory $TaskerCopyWith(Tasker value, $Res Function(Tasker) then) =
      _$TaskerCopyWithImpl<$Res, Tasker>;
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
      String? skill,
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
      @JsonKey(name: "security_questions") List<dynamic>? securityQuestions});

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
class _$TaskerCopyWithImpl<$Res, $Val extends Tasker>
    implements $TaskerCopyWith<$Res> {
  _$TaskerCopyWithImpl(this._value, this._then);

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
abstract class _$$_TaskerCopyWith<$Res> implements $TaskerCopyWith<$Res> {
  factory _$$_TaskerCopyWith(_$_Tasker value, $Res Function(_$_Tasker) then) =
      __$$_TaskerCopyWithImpl<$Res>;
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
      String? skill,
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
      @JsonKey(name: "security_questions") List<dynamic>? securityQuestions});

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
class __$$_TaskerCopyWithImpl<$Res>
    extends _$TaskerCopyWithImpl<$Res, _$_Tasker>
    implements _$$_TaskerCopyWith<$Res> {
  __$$_TaskerCopyWithImpl(_$_Tasker _value, $Res Function(_$_Tasker) _then)
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
  }) {
    return _then(_$_Tasker(
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
class _$_Tasker implements _Tasker {
  const _$_Tasker(
      {this.id,
      @JsonKey(name: "profile_image")
          this.profileImage,
      @JsonKey(name: "full_name")
          this.fullName,
      @JsonKey(name: "charge_currency")
          this.chargeCurrency,
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
      @JsonKey(name: "is_followed")
          this.isFollowed,
      this.badge,
      @JsonKey(name: "is_bookmarked")
          this.isBookmarked,
      this.status,
      this.bio,
      this.gender,
      @JsonKey(name: "date_of_birth")
          this.dateOfBirth,
      this.skill,
      @JsonKey(name: "active_hour_start")
          this.activeHourStart,
      @JsonKey(name: "active_hour_end")
          this.activeHourEnd,
      @JsonKey(name: "experience_level")
          this.experienceLevel,
      @JsonKey(name: "profile_visibility")
          this.profileVisibility,
      @JsonKey(name: "task_preferences")
          this.taskPreferences,
      @JsonKey(name: "address_line1")
          this.addressLine1,
      @JsonKey(name: "address_line2")
          this.addressLine2,
      @JsonKey(name: "is_profile_verified")
          this.isProfileVerified,
      this.designation,
      this.points,
      @JsonKey(name: "remaining_points")
          this.remainingPoints,
      @JsonKey(name: "followers_count")
          this.followersCount,
      @JsonKey(name: "following_count")
          this.followingCount,
      this.avatar,
      final List<dynamic>? subscription,
      @JsonKey(name: "security_questions")
          final List<dynamic>? securityQuestions})
      : _portfolio = portfolio,
        _experience = experience,
        _education = education,
        _certificates = certificates,
        _interests = interests,
        _subscription = subscription,
        _securityQuestions = securityQuestions;

  factory _$_Tasker.fromJson(Map<String, dynamic> json) =>
      _$$_TaskerFromJson(json);

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
  @override
  final String? skill;
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
  @JsonKey(name: "security_questions")
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
    return 'Tasker(id: $id, profileImage: $profileImage, fullName: $fullName, chargeCurrency: $chargeCurrency, user: $user, portfolio: $portfolio, experience: $experience, education: $education, certificates: $certificates, stats: $stats, rating: $rating, country: $country, language: $language, city: $city, interests: $interests, isFollowed: $isFollowed, badge: $badge, isBookmarked: $isBookmarked, status: $status, bio: $bio, gender: $gender, dateOfBirth: $dateOfBirth, skill: $skill, activeHourStart: $activeHourStart, activeHourEnd: $activeHourEnd, experienceLevel: $experienceLevel, profileVisibility: $profileVisibility, taskPreferences: $taskPreferences, addressLine1: $addressLine1, addressLine2: $addressLine2, isProfileVerified: $isProfileVerified, designation: $designation, points: $points, remainingPoints: $remainingPoints, followersCount: $followersCount, followingCount: $followingCount, avatar: $avatar, subscription: $subscription, securityQuestions: $securityQuestions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tasker &&
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
        const DeepCollectionEquality().hash(avatar),
        const DeepCollectionEquality().hash(_subscription),
        const DeepCollectionEquality().hash(_securityQuestions)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskerCopyWith<_$_Tasker> get copyWith =>
      __$$_TaskerCopyWithImpl<_$_Tasker>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskerToJson(
      this,
    );
  }
}

abstract class _Tasker implements Tasker {
  const factory _Tasker(
      {final int? id,
      @JsonKey(name: "profile_image")
          final String? profileImage,
      @JsonKey(name: "full_name")
          final String? fullName,
      @JsonKey(name: "charge_currency")
          final Currency? chargeCurrency,
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
      @JsonKey(name: "is_followed")
          final bool? isFollowed,
      final Badge? badge,
      @JsonKey(name: "is_bookmarked")
          final bool? isBookmarked,
      final String? status,
      final String? bio,
      final String? gender,
      @JsonKey(name: "date_of_birth")
          final DateTime? dateOfBirth,
      final String? skill,
      @JsonKey(name: "active_hour_start")
          final String? activeHourStart,
      @JsonKey(name: "active_hour_end")
          final String? activeHourEnd,
      @JsonKey(name: "experience_level")
          final String? experienceLevel,
      @JsonKey(name: "profile_visibility")
          final String? profileVisibility,
      @JsonKey(name: "task_preferences")
          final String? taskPreferences,
      @JsonKey(name: "address_line1")
          final String? addressLine1,
      @JsonKey(name: "address_line2")
          final String? addressLine2,
      @JsonKey(name: "is_profile_verified")
          final bool? isProfileVerified,
      final String? designation,
      final int? points,
      @JsonKey(name: "remaining_points")
          final int? remainingPoints,
      @JsonKey(name: "followers_count")
          final int? followersCount,
      @JsonKey(name: "following_count")
          final int? followingCount,
      final dynamic avatar,
      final List<dynamic>? subscription,
      @JsonKey(name: "security_questions")
          final List<dynamic>? securityQuestions}) = _$_Tasker;

  factory _Tasker.fromJson(Map<String, dynamic> json) = _$_Tasker.fromJson;

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
  String? get skill;
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
  @JsonKey(name: "security_questions")
  List<dynamic>? get securityQuestions;
  @override
  @JsonKey(ignore: true)
  _$$_TaskerCopyWith<_$_Tasker> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  num? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  num? get latitude => throw _privateConstructorUsedError;
  num? get longitude => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;

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
      {num? id, String? name, num? latitude, num? longitude, dynamic country});
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
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
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {num? id, String? name, num? latitude, num? longitude, dynamic country});
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
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_City(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as num?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as num?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_City implements _City {
  const _$_City(
      {this.id, this.name, this.latitude, this.longitude, this.country});

  factory _$_City.fromJson(Map<String, dynamic> json) => _$$_CityFromJson(json);

  @override
  final num? id;
  @override
  final String? name;
  @override
  final num? latitude;
  @override
  final num? longitude;
  @override
  final dynamic country;

  @override
  String toString() {
    return 'City(id: $id, name: $name, latitude: $latitude, longitude: $longitude, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_City &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, latitude, longitude,
      const DeepCollectionEquality().hash(country));

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
      {final num? id,
      final String? name,
      final num? latitude,
      final num? longitude,
      final dynamic country}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  num? get id;
  @override
  String? get name;
  @override
  num? get latitude;
  @override
  num? get longitude;
  @override
  dynamic get country;
  @override
  @JsonKey(ignore: true)
  _$$_CityCopyWith<_$_City> get copyWith => throw _privateConstructorUsedError;
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

Country _$CountryFromJson(Map<String, dynamic> json) {
  return _Country.fromJson(json);
}

/// @nodoc
mixin _$Country {
  String? get name => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CountryCopyWith<Country> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryCopyWith<$Res> {
  factory $CountryCopyWith(Country value, $Res Function(Country) then) =
      _$CountryCopyWithImpl<$Res, Country>;
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class _$CountryCopyWithImpl<$Res, $Val extends Country>
    implements $CountryCopyWith<$Res> {
  _$CountryCopyWithImpl(this._value, this._then);

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
abstract class _$$_CountryCopyWith<$Res> implements $CountryCopyWith<$Res> {
  factory _$$_CountryCopyWith(
          _$_Country value, $Res Function(_$_Country) then) =
      __$$_CountryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? name, String? code});
}

/// @nodoc
class __$$_CountryCopyWithImpl<$Res>
    extends _$CountryCopyWithImpl<$Res, _$_Country>
    implements _$$_CountryCopyWith<$Res> {
  __$$_CountryCopyWithImpl(_$_Country _value, $Res Function(_$_Country) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? code = freezed,
  }) {
    return _then(_$_Country(
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
class _$_Country implements _Country {
  const _$_Country({this.name, this.code});

  factory _$_Country.fromJson(Map<String, dynamic> json) =>
      _$$_CountryFromJson(json);

  @override
  final String? name;
  @override
  final String? code;

  @override
  String toString() {
    return 'Country(name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Country &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      __$$_CountryCopyWithImpl<_$_Country>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CountryToJson(
      this,
    );
  }
}

abstract class _Country implements Country {
  const factory _Country({final String? name, final String? code}) = _$_Country;

  factory _Country.fromJson(Map<String, dynamic> json) = _$_Country.fromJson;

  @override
  String? get name;
  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$_CountryCopyWith<_$_Country> get copyWith =>
      throw _privateConstructorUsedError;
}

Badge _$BadgeFromJson(Map<String, dynamic> json) {
  return _Badge.fromJson(json);
}

/// @nodoc
mixin _$Badge {
  int? get id => throw _privateConstructorUsedError;
  dynamic get next => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "progress_level_start")
  int? get progressLevelStart => throw _privateConstructorUsedError;
  @JsonKey(name: "progress_level_end")
  int? get progressLevelEnd => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BadgeCopyWith<Badge> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgeCopyWith<$Res> {
  factory $BadgeCopyWith(Badge value, $Res Function(Badge) then) =
      _$BadgeCopyWithImpl<$Res, Badge>;
  @useResult
  $Res call(
      {int? id,
      dynamic next,
      String? image,
      String? title,
      @JsonKey(name: "progress_level_start") int? progressLevelStart,
      @JsonKey(name: "progress_level_end") int? progressLevelEnd});
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
              as dynamic,
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
}

/// @nodoc
abstract class _$$_BadgeCopyWith<$Res> implements $BadgeCopyWith<$Res> {
  factory _$$_BadgeCopyWith(_$_Badge value, $Res Function(_$_Badge) then) =
      __$$_BadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      dynamic next,
      String? image,
      String? title,
      @JsonKey(name: "progress_level_start") int? progressLevelStart,
      @JsonKey(name: "progress_level_end") int? progressLevelEnd});
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
    Object? next = freezed,
    Object? image = freezed,
    Object? title = freezed,
    Object? progressLevelStart = freezed,
    Object? progressLevelEnd = freezed,
  }) {
    return _then(_$_Badge(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
class _$_Badge implements _Badge {
  const _$_Badge(
      {this.id,
      this.next,
      this.image,
      this.title,
      @JsonKey(name: "progress_level_start") this.progressLevelStart,
      @JsonKey(name: "progress_level_end") this.progressLevelEnd});

  factory _$_Badge.fromJson(Map<String, dynamic> json) =>
      _$$_BadgeFromJson(json);

  @override
  final int? id;
  @override
  final dynamic next;
  @override
  final String? image;
  @override
  final String? title;
  @override
  @JsonKey(name: "progress_level_start")
  final int? progressLevelStart;
  @override
  @JsonKey(name: "progress_level_end")
  final int? progressLevelEnd;

  @override
  String toString() {
    return 'Badge(id: $id, next: $next, image: $image, title: $title, progressLevelStart: $progressLevelStart, progressLevelEnd: $progressLevelEnd)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Badge &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.progressLevelStart, progressLevelStart) ||
                other.progressLevelStart == progressLevelStart) &&
            (identical(other.progressLevelEnd, progressLevelEnd) ||
                other.progressLevelEnd == progressLevelEnd));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(next),
      image,
      title,
      progressLevelStart,
      progressLevelEnd);

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
          {final int? id,
          final dynamic next,
          final String? image,
          final String? title,
          @JsonKey(name: "progress_level_start") final int? progressLevelStart,
          @JsonKey(name: "progress_level_end") final int? progressLevelEnd}) =
      _$_Badge;

  factory _Badge.fromJson(Map<String, dynamic> json) = _$_Badge.fromJson;

  @override
  int? get id;
  @override
  dynamic get next;
  @override
  String? get image;
  @override
  String? get title;
  @override
  @JsonKey(name: "progress_level_start")
  int? get progressLevelStart;
  @override
  @JsonKey(name: "progress_level_end")
  int? get progressLevelEnd;
  @override
  @JsonKey(ignore: true)
  _$$_BadgeCopyWith<_$_Badge> get copyWith =>
      throw _privateConstructorUsedError;
}
