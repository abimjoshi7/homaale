// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_booking_list_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyBookingListModel _$MyBookingListModelFromJson(Map<String, dynamic> json) {
  return _MyBookingListModel.fromJson(json);
}

/// @nodoc
mixin _$MyBookingListModel {
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyBookingListModelCopyWith<MyBookingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyBookingListModelCopyWith<$Res> {
  factory $MyBookingListModelCopyWith(
          MyBookingListModel value, $Res Function(MyBookingListModel) then) =
      _$MyBookingListModelCopyWithImpl<$Res, MyBookingListModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      List<Result>? result});
}

/// @nodoc
class _$MyBookingListModelCopyWithImpl<$Res, $Val extends MyBookingListModel>
    implements $MyBookingListModelCopyWith<$Res> {
  _$MyBookingListModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_MyBookingListModelCopyWith<$Res>
    implements $MyBookingListModelCopyWith<$Res> {
  factory _$$_MyBookingListModelCopyWith(_$_MyBookingListModel value,
          $Res Function(_$_MyBookingListModel) then) =
      __$$_MyBookingListModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      List<Result>? result});
}

/// @nodoc
class __$$_MyBookingListModelCopyWithImpl<$Res>
    extends _$MyBookingListModelCopyWithImpl<$Res, _$_MyBookingListModel>
    implements _$$_MyBookingListModelCopyWith<$Res> {
  __$$_MyBookingListModelCopyWithImpl(
      _$_MyBookingListModel _value, $Res Function(_$_MyBookingListModel) _then)
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
    return _then(_$_MyBookingListModel(
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
class _$_MyBookingListModel implements _MyBookingListModel {
  const _$_MyBookingListModel(
      {@JsonKey(name: "total_pages") this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: "page_size") this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_MyBookingListModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyBookingListModelFromJson(json);

  @override
  @JsonKey(name: "total_pages")
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
  @JsonKey(name: "page_size")
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
    return 'MyBookingListModel(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyBookingListModel &&
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
  _$$_MyBookingListModelCopyWith<_$_MyBookingListModel> get copyWith =>
      __$$_MyBookingListModelCopyWithImpl<_$_MyBookingListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyBookingListModelToJson(
      this,
    );
  }
}

abstract class _MyBookingListModel implements MyBookingListModel {
  const factory _MyBookingListModel(
      {@JsonKey(name: "total_pages") final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: "page_size") final int? pageSize,
      final List<Result>? result}) = _$_MyBookingListModel;

  factory _MyBookingListModel.fromJson(Map<String, dynamic> json) =
      _$_MyBookingListModel.fromJson;

  @override
  @JsonKey(name: "total_pages")
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
  @JsonKey(name: "page_size")
  int? get pageSize;
  @override
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_MyBookingListModelCopyWith<_$_MyBookingListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  ResultCreatedBy? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_service")
  EntityService? get entityService => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<Image>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: "progress_percent")
  double? get progressPercent => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get requirements => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_from")
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_to")
  String? get budgetTo => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  String? get endTime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  String? get status =>
      throw _privateConstructorUsedError; // @JsonKey(name: "extra_data") List<String>? extraData,
  @JsonKey(name: "is_accepted")
  bool? get isAccepted =>
      throw _privateConstructorUsedError; // @JsonKey(name: "booking_merchant") dynamic bookingMerchant,
  int? get city => throw _privateConstructorUsedError;

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
      @JsonKey(name: "created_by") ResultCreatedBy? createdBy,
      @JsonKey(name: "entity_service") EntityService? entityService,
      List<Image>? images,
      List<Image>? videos,
      @JsonKey(name: "progress_percent") double? progressPercent,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? description,
      List<String>? requirements,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      String? location,
      @JsonKey(name: "is_active") bool? isActive,
      String? status,
      @JsonKey(name: "is_accepted") bool? isAccepted,
      int? city});

  $ResultCreatedByCopyWith<$Res>? get createdBy;
  $EntityServiceCopyWith<$Res>? get entityService;
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
    Object? createdBy = freezed,
    Object? entityService = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? progressPercent = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? requirements = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? location = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? isAccepted = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ResultCreatedBy?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as EntityService?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      progressPercent: freezed == progressPercent
          ? _value.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requirements: freezed == requirements
          ? _value.requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ResultCreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $ResultCreatedByCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EntityServiceCopyWith<$Res>? get entityService {
    if (_value.entityService == null) {
      return null;
    }

    return $EntityServiceCopyWith<$Res>(_value.entityService!, (value) {
      return _then(_value.copyWith(entityService: value) as $Val);
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
      @JsonKey(name: "created_by") ResultCreatedBy? createdBy,
      @JsonKey(name: "entity_service") EntityService? entityService,
      List<Image>? images,
      List<Image>? videos,
      @JsonKey(name: "progress_percent") double? progressPercent,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? description,
      List<String>? requirements,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      String? location,
      @JsonKey(name: "is_active") bool? isActive,
      String? status,
      @JsonKey(name: "is_accepted") bool? isAccepted,
      int? city});

  @override
  $ResultCreatedByCopyWith<$Res>? get createdBy;
  @override
  $EntityServiceCopyWith<$Res>? get entityService;
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
    Object? createdBy = freezed,
    Object? entityService = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? progressPercent = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? requirements = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? location = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? isAccepted = freezed,
    Object? city = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as ResultCreatedBy?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as EntityService?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      progressPercent: freezed == progressPercent
          ? _value.progressPercent
          : progressPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      requirements: freezed == requirements
          ? _value._requirements
          : requirements // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isAccepted: freezed == isAccepted
          ? _value.isAccepted
          : isAccepted // ignore: cast_nullable_to_non_nullable
              as bool?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      @JsonKey(name: "created_by") this.createdBy,
      @JsonKey(name: "entity_service") this.entityService,
      final List<Image>? images,
      final List<Image>? videos,
      @JsonKey(name: "progress_percent") this.progressPercent,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.description,
      final List<String>? requirements,
      @JsonKey(name: "budget_from") this.budgetFrom,
      @JsonKey(name: "budget_to") this.budgetTo,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime,
      this.location,
      @JsonKey(name: "is_active") this.isActive,
      this.status,
      @JsonKey(name: "is_accepted") this.isAccepted,
      this.city})
      : _images = images,
        _videos = videos,
        _requirements = requirements;

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "created_by")
  final ResultCreatedBy? createdBy;
  @override
  @JsonKey(name: "entity_service")
  final EntityService? entityService;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  @JsonKey(name: "progress_percent")
  final double? progressPercent;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  final String? description;
  final List<String>? _requirements;
  @override
  List<String>? get requirements {
    final value = _requirements;
    if (value == null) return null;
    if (_requirements is EqualUnmodifiableListView) return _requirements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "budget_from")
  final String? budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  final String? budgetTo;
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
  @override
  final String? location;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String? status;
// @JsonKey(name: "extra_data") List<String>? extraData,
  @override
  @JsonKey(name: "is_accepted")
  final bool? isAccepted;
// @JsonKey(name: "booking_merchant") dynamic bookingMerchant,
  @override
  final int? city;

  @override
  String toString() {
    return 'Result(id: $id, createdBy: $createdBy, entityService: $entityService, images: $images, videos: $videos, progressPercent: $progressPercent, createdAt: $createdAt, updatedAt: $updatedAt, description: $description, requirements: $requirements, budgetFrom: $budgetFrom, budgetTo: $budgetTo, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, location: $location, isActive: $isActive, status: $status, isAccepted: $isAccepted, city: $city)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.entityService, entityService) ||
                other.entityService == entityService) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.progressPercent, progressPercent) ||
                other.progressPercent == progressPercent) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._requirements, _requirements) &&
            (identical(other.budgetFrom, budgetFrom) ||
                other.budgetFrom == budgetFrom) &&
            (identical(other.budgetTo, budgetTo) ||
                other.budgetTo == budgetTo) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isAccepted, isAccepted) ||
                other.isAccepted == isAccepted) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdBy,
        entityService,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_videos),
        progressPercent,
        createdAt,
        updatedAt,
        description,
        const DeepCollectionEquality().hash(_requirements),
        budgetFrom,
        budgetTo,
        startDate,
        endDate,
        startTime,
        endTime,
        location,
        isActive,
        status,
        isAccepted,
        city
      ]);

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
      @JsonKey(name: "created_by") final ResultCreatedBy? createdBy,
      @JsonKey(name: "entity_service") final EntityService? entityService,
      final List<Image>? images,
      final List<Image>? videos,
      @JsonKey(name: "progress_percent") final double? progressPercent,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      final String? description,
      final List<String>? requirements,
      @JsonKey(name: "budget_from") final String? budgetFrom,
      @JsonKey(name: "budget_to") final String? budgetTo,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate,
      @JsonKey(name: "start_time") final String? startTime,
      @JsonKey(name: "end_time") final String? endTime,
      final String? location,
      @JsonKey(name: "is_active") final bool? isActive,
      final String? status,
      @JsonKey(name: "is_accepted") final bool? isAccepted,
      final int? city}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "created_by")
  ResultCreatedBy? get createdBy;
  @override
  @JsonKey(name: "entity_service")
  EntityService? get entityService;
  @override
  List<Image>? get images;
  @override
  List<Image>? get videos;
  @override
  @JsonKey(name: "progress_percent")
  double? get progressPercent;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  String? get description;
  @override
  List<String>? get requirements;
  @override
  @JsonKey(name: "budget_from")
  String? get budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  String? get budgetTo;
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
  String? get location;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  String? get status;
  @override // @JsonKey(name: "extra_data") List<String>? extraData,
  @JsonKey(name: "is_accepted")
  bool? get isAccepted;
  @override // @JsonKey(name: "booking_merchant") dynamic bookingMerchant,
  int? get city;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultCreatedBy _$ResultCreatedByFromJson(Map<String, dynamic> json) {
  return _ResultCreatedBy.fromJson(json);
}

/// @nodoc
mixin _$ResultCreatedBy {
  int? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "user_type")
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: "profile_image")
  String? get profileImage => throw _privateConstructorUsedError;
  Stats? get stats => throw _privateConstructorUsedError;
  String? get skill => throw _privateConstructorUsedError;
  @JsonKey(name: "charge_currency")
  Currency? get chargeCurrency => throw _privateConstructorUsedError;
  @JsonKey(name: "hourly_rate")
  double? get hourlyRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCreatedByCopyWith<ResultCreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCreatedByCopyWith<$Res> {
  factory $ResultCreatedByCopyWith(
          ResultCreatedBy value, $Res Function(ResultCreatedBy) then) =
      _$ResultCreatedByCopyWithImpl<$Res, ResultCreatedBy>;
  @useResult
  $Res call(
      {int? id,
      User? user,
      String? bio,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "profile_image") String? profileImage,
      Stats? stats,
      String? skill,
      @JsonKey(name: "charge_currency") Currency? chargeCurrency,
      @JsonKey(name: "hourly_rate") double? hourlyRate});

  $UserCopyWith<$Res>? get user;
  $StatsCopyWith<$Res>? get stats;
  $CurrencyCopyWith<$Res>? get chargeCurrency;
}

/// @nodoc
class _$ResultCreatedByCopyWithImpl<$Res, $Val extends ResultCreatedBy>
    implements $ResultCreatedByCopyWith<$Res> {
  _$ResultCreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? bio = freezed,
    Object? userType = freezed,
    Object? profileImage = freezed,
    Object? stats = freezed,
    Object? skill = freezed,
    Object? chargeCurrency = freezed,
    Object? hourlyRate = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeCurrency: freezed == chargeCurrency
          ? _value.chargeCurrency
          : chargeCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
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
  $CurrencyCopyWith<$Res>? get chargeCurrency {
    if (_value.chargeCurrency == null) {
      return null;
    }

    return $CurrencyCopyWith<$Res>(_value.chargeCurrency!, (value) {
      return _then(_value.copyWith(chargeCurrency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResultCreatedByCopyWith<$Res>
    implements $ResultCreatedByCopyWith<$Res> {
  factory _$$_ResultCreatedByCopyWith(
          _$_ResultCreatedBy value, $Res Function(_$_ResultCreatedBy) then) =
      __$$_ResultCreatedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      User? user,
      String? bio,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "profile_image") String? profileImage,
      Stats? stats,
      String? skill,
      @JsonKey(name: "charge_currency") Currency? chargeCurrency,
      @JsonKey(name: "hourly_rate") double? hourlyRate});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $StatsCopyWith<$Res>? get stats;
  @override
  $CurrencyCopyWith<$Res>? get chargeCurrency;
}

/// @nodoc
class __$$_ResultCreatedByCopyWithImpl<$Res>
    extends _$ResultCreatedByCopyWithImpl<$Res, _$_ResultCreatedBy>
    implements _$$_ResultCreatedByCopyWith<$Res> {
  __$$_ResultCreatedByCopyWithImpl(
      _$_ResultCreatedBy _value, $Res Function(_$_ResultCreatedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? bio = freezed,
    Object? userType = freezed,
    Object? profileImage = freezed,
    Object? stats = freezed,
    Object? skill = freezed,
    Object? chargeCurrency = freezed,
    Object? hourlyRate = freezed,
  }) {
    return _then(_$_ResultCreatedBy(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      stats: freezed == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as Stats?,
      skill: freezed == skill
          ? _value.skill
          : skill // ignore: cast_nullable_to_non_nullable
              as String?,
      chargeCurrency: freezed == chargeCurrency
          ? _value.chargeCurrency
          : chargeCurrency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      hourlyRate: freezed == hourlyRate
          ? _value.hourlyRate
          : hourlyRate // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultCreatedBy implements _ResultCreatedBy {
  const _$_ResultCreatedBy(
      {this.id,
      this.user,
      this.bio,
      @JsonKey(name: "user_type") this.userType,
      @JsonKey(name: "profile_image") this.profileImage,
      this.stats,
      this.skill,
      @JsonKey(name: "charge_currency") this.chargeCurrency,
      @JsonKey(name: "hourly_rate") this.hourlyRate});

  factory _$_ResultCreatedBy.fromJson(Map<String, dynamic> json) =>
      _$$_ResultCreatedByFromJson(json);

  @override
  final int? id;
  @override
  final User? user;
  @override
  final String? bio;
  @override
  @JsonKey(name: "user_type")
  final String? userType;
  @override
  @JsonKey(name: "profile_image")
  final String? profileImage;
  @override
  final Stats? stats;
  @override
  final String? skill;
  @override
  @JsonKey(name: "charge_currency")
  final Currency? chargeCurrency;
  @override
  @JsonKey(name: "hourly_rate")
  final double? hourlyRate;

  @override
  String toString() {
    return 'ResultCreatedBy(id: $id, user: $user, bio: $bio, userType: $userType, profileImage: $profileImage, stats: $stats, skill: $skill, chargeCurrency: $chargeCurrency, hourlyRate: $hourlyRate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultCreatedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            (identical(other.skill, skill) || other.skill == skill) &&
            (identical(other.chargeCurrency, chargeCurrency) ||
                other.chargeCurrency == chargeCurrency) &&
            (identical(other.hourlyRate, hourlyRate) ||
                other.hourlyRate == hourlyRate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, bio, userType,
      profileImage, stats, skill, chargeCurrency, hourlyRate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCreatedByCopyWith<_$_ResultCreatedBy> get copyWith =>
      __$$_ResultCreatedByCopyWithImpl<_$_ResultCreatedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultCreatedByToJson(
      this,
    );
  }
}

abstract class _ResultCreatedBy implements ResultCreatedBy {
  const factory _ResultCreatedBy(
          {final int? id,
          final User? user,
          final String? bio,
          @JsonKey(name: "user_type") final String? userType,
          @JsonKey(name: "profile_image") final String? profileImage,
          final Stats? stats,
          final String? skill,
          @JsonKey(name: "charge_currency") final Currency? chargeCurrency,
          @JsonKey(name: "hourly_rate") final double? hourlyRate}) =
      _$_ResultCreatedBy;

  factory _ResultCreatedBy.fromJson(Map<String, dynamic> json) =
      _$_ResultCreatedBy.fromJson;

  @override
  int? get id;
  @override
  User? get user;
  @override
  String? get bio;
  @override
  @JsonKey(name: "user_type")
  String? get userType;
  @override
  @JsonKey(name: "profile_image")
  String? get profileImage;
  @override
  Stats? get stats;
  @override
  String? get skill;
  @override
  @JsonKey(name: "charge_currency")
  Currency? get chargeCurrency;
  @override
  @JsonKey(name: "hourly_rate")
  double? get hourlyRate;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCreatedByCopyWith<_$_ResultCreatedBy> get copyWith =>
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
  @JsonKey(name: "task_in_progress")
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
      @JsonKey(name: "task_in_progress") double? taskInProgress,
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
      @JsonKey(name: "task_in_progress") double? taskInProgress,
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
      @JsonKey(name: "task_in_progress") this.taskInProgress,
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
  @JsonKey(name: "task_in_progress")
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
      @JsonKey(name: "task_in_progress") final double? taskInProgress,
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
  @JsonKey(name: "task_in_progress")
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
  String? get phone => throw _privateConstructorUsedError;
  @JsonKey(name: "full_name")
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: "first_name")
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: "middle_name")
  String? get middleName => throw _privateConstructorUsedError;
  @JsonKey(name: "last_name")
  String? get lastName => throw _privateConstructorUsedError;
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
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
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
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
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
      this.phone,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "middle_name") this.middleName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "created_at") this.createdAt});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
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
  @JsonKey(name: "created_at")
  final DateTime? createdAt;

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
            (identical(other.phone, phone) || other.phone == phone) &&
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
  int get hashCode => Object.hash(runtimeType, id, username, email, phone,
      fullName, firstName, middleName, lastName, createdAt);

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
      final String? phone,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "middle_name") final String? middleName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "created_at") final DateTime? createdAt}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
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
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}

EntityService _$EntityServiceFromJson(Map<String, dynamic> json) {
  return _EntityService.fromJson(json);
}

/// @nodoc
mixin _$EntityService {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  EntityServiceCreatedBy? get createdBy => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<Image>? get videos => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String>? get highlights => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_type")
  String? get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_from")
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_to")
  String? get budgetTo => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: "share_location")
  bool? get shareLocation => throw _privateConstructorUsedError;
  @JsonKey(name: "is_negotiable")
  bool? get isNegotiable => throw _privateConstructorUsedError;
  int? get revisions =>
      throw _privateConstructorUsedError; // @JsonKey(name: "recursion_type") String? recursionType,
  @JsonKey(name: "view_count")
  int? get viewsCount => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: "is_professional")
  bool? get isProfessional => throw _privateConstructorUsedError;
  @JsonKey(name: "is_online")
  bool? get isOnline => throw _privateConstructorUsedError;
  @JsonKey(name: "is_requested")
  bool? get isRequested => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_type")
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_value")
  String? get discountValue =>
      throw _privateConstructorUsedError; // @JsonKey(name: "extra_data") List<String>? extraData,
  @JsonKey(name: "no_of_reservation")
  int? get noOfReservation => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "needs_approval")
  bool? get needsApproval => throw _privateConstructorUsedError;
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed =>
      throw _privateConstructorUsedError; // dynamic? merchant,
  Event? get event => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityServiceCopyWith<EntityService> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityServiceCopyWith<$Res> {
  factory $EntityServiceCopyWith(
          EntityService value, $Res Function(EntityService) then) =
      _$EntityServiceCopyWithImpl<$Res, EntityService>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "created_by") EntityServiceCreatedBy? createdBy,
      Currency? currency,
      City? city,
      List<Image>? images,
      List<Image>? videos,
      Service? service,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? title,
      String? description,
      List<String>? highlights,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      @JsonKey(name: "share_location") bool? shareLocation,
      @JsonKey(name: "is_negotiable") bool? isNegotiable,
      int? revisions,
      @JsonKey(name: "view_count") int? viewsCount,
      String? location,
      @JsonKey(name: "is_professional") bool? isProfessional,
      @JsonKey(name: "is_online") bool? isOnline,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "discount_value") String? discountValue,
      @JsonKey(name: "no_of_reservation") int? noOfReservation,
      String? slug,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "needs_approval") bool? needsApproval,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      Event? event});

  $EntityServiceCreatedByCopyWith<$Res>? get createdBy;
  $CurrencyCopyWith<$Res>? get currency;
  $CityCopyWith<$Res>? get city;
  $ServiceCopyWith<$Res>? get service;
  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class _$EntityServiceCopyWithImpl<$Res, $Val extends EntityService>
    implements $EntityServiceCopyWith<$Res> {
  _$EntityServiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? service = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? highlights = freezed,
    Object? budgetType = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? shareLocation = freezed,
    Object? isNegotiable = freezed,
    Object? revisions = freezed,
    Object? viewsCount = freezed,
    Object? location = freezed,
    Object? isProfessional = freezed,
    Object? isOnline = freezed,
    Object? isRequested = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? noOfReservation = freezed,
    Object? slug = freezed,
    Object? isActive = freezed,
    Object? needsApproval = freezed,
    Object? isEndorsed = freezed,
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as EntityServiceCreatedBy?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      highlights: freezed == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      shareLocation: freezed == shareLocation
          ? _value.shareLocation
          : shareLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNegotiable: freezed == isNegotiable
          ? _value.isNegotiable
          : isNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      revisions: freezed == revisions
          ? _value.revisions
          : revisions // ignore: cast_nullable_to_non_nullable
              as int?,
      viewsCount: freezed == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfessional: freezed == isProfessional
          ? _value.isProfessional
          : isProfessional // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfReservation: freezed == noOfReservation
          ? _value.noOfReservation
          : noOfReservation // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      needsApproval: freezed == needsApproval
          ? _value.needsApproval
          : needsApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $EntityServiceCreatedByCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $EntityServiceCreatedByCopyWith<$Res>(_value.createdBy!, (value) {
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

  @override
  @pragma('vm:prefer-inline')
  $EventCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_EntityServiceCopyWith<$Res>
    implements $EntityServiceCopyWith<$Res> {
  factory _$$_EntityServiceCopyWith(
          _$_EntityService value, $Res Function(_$_EntityService) then) =
      __$$_EntityServiceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: "created_by") EntityServiceCreatedBy? createdBy,
      Currency? currency,
      City? city,
      List<Image>? images,
      List<Image>? videos,
      Service? service,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      String? title,
      String? description,
      List<String>? highlights,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "start_time") String? startTime,
      @JsonKey(name: "end_time") String? endTime,
      @JsonKey(name: "share_location") bool? shareLocation,
      @JsonKey(name: "is_negotiable") bool? isNegotiable,
      int? revisions,
      @JsonKey(name: "view_count") int? viewsCount,
      String? location,
      @JsonKey(name: "is_professional") bool? isProfessional,
      @JsonKey(name: "is_online") bool? isOnline,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "discount_value") String? discountValue,
      @JsonKey(name: "no_of_reservation") int? noOfReservation,
      String? slug,
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "needs_approval") bool? needsApproval,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      Event? event});

  @override
  $EntityServiceCreatedByCopyWith<$Res>? get createdBy;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $ServiceCopyWith<$Res>? get service;
  @override
  $EventCopyWith<$Res>? get event;
}

/// @nodoc
class __$$_EntityServiceCopyWithImpl<$Res>
    extends _$EntityServiceCopyWithImpl<$Res, _$_EntityService>
    implements _$$_EntityServiceCopyWith<$Res> {
  __$$_EntityServiceCopyWithImpl(
      _$_EntityService _value, $Res Function(_$_EntityService) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdBy = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? service = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? highlights = freezed,
    Object? budgetType = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? shareLocation = freezed,
    Object? isNegotiable = freezed,
    Object? revisions = freezed,
    Object? viewsCount = freezed,
    Object? location = freezed,
    Object? isProfessional = freezed,
    Object? isOnline = freezed,
    Object? isRequested = freezed,
    Object? discountType = freezed,
    Object? discountValue = freezed,
    Object? noOfReservation = freezed,
    Object? slug = freezed,
    Object? isActive = freezed,
    Object? needsApproval = freezed,
    Object? isEndorsed = freezed,
    Object? event = freezed,
  }) {
    return _then(_$_EntityService(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as EntityServiceCreatedBy?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      highlights: freezed == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
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
      shareLocation: freezed == shareLocation
          ? _value.shareLocation
          : shareLocation // ignore: cast_nullable_to_non_nullable
              as bool?,
      isNegotiable: freezed == isNegotiable
          ? _value.isNegotiable
          : isNegotiable // ignore: cast_nullable_to_non_nullable
              as bool?,
      revisions: freezed == revisions
          ? _value.revisions
          : revisions // ignore: cast_nullable_to_non_nullable
              as int?,
      viewsCount: freezed == viewsCount
          ? _value.viewsCount
          : viewsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isProfessional: freezed == isProfessional
          ? _value.isProfessional
          : isProfessional // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as String?,
      noOfReservation: freezed == noOfReservation
          ? _value.noOfReservation
          : noOfReservation // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      needsApproval: freezed == needsApproval
          ? _value.needsApproval
          : needsApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as Event?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityService implements _EntityService {
  const _$_EntityService(
      {this.id,
      @JsonKey(name: "created_by") this.createdBy,
      this.currency,
      this.city,
      final List<Image>? images,
      final List<Image>? videos,
      this.service,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "updated_at") this.updatedAt,
      this.title,
      this.description,
      final List<String>? highlights,
      @JsonKey(name: "budget_type") this.budgetType,
      @JsonKey(name: "budget_from") this.budgetFrom,
      @JsonKey(name: "budget_to") this.budgetTo,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime,
      @JsonKey(name: "share_location") this.shareLocation,
      @JsonKey(name: "is_negotiable") this.isNegotiable,
      this.revisions,
      @JsonKey(name: "view_count") this.viewsCount,
      this.location,
      @JsonKey(name: "is_professional") this.isProfessional,
      @JsonKey(name: "is_online") this.isOnline,
      @JsonKey(name: "is_requested") this.isRequested,
      @JsonKey(name: "discount_type") this.discountType,
      @JsonKey(name: "discount_value") this.discountValue,
      @JsonKey(name: "no_of_reservation") this.noOfReservation,
      this.slug,
      @JsonKey(name: "is_active") this.isActive,
      @JsonKey(name: "needs_approval") this.needsApproval,
      @JsonKey(name: "is_endorsed") this.isEndorsed,
      this.event})
      : _images = images,
        _videos = videos,
        _highlights = highlights;

  factory _$_EntityService.fromJson(Map<String, dynamic> json) =>
      _$$_EntityServiceFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: "created_by")
  final EntityServiceCreatedBy? createdBy;
  @override
  final Currency? currency;
  @override
  final City? city;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

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
  final Service? service;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  final String? title;
  @override
  final String? description;
  final List<String>? _highlights;
  @override
  List<String>? get highlights {
    final value = _highlights;
    if (value == null) return null;
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "budget_type")
  final String? budgetType;
  @override
  @JsonKey(name: "budget_from")
  final String? budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  final String? budgetTo;
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
  @override
  @JsonKey(name: "share_location")
  final bool? shareLocation;
  @override
  @JsonKey(name: "is_negotiable")
  final bool? isNegotiable;
  @override
  final int? revisions;
// @JsonKey(name: "recursion_type") String? recursionType,
  @override
  @JsonKey(name: "view_count")
  final int? viewsCount;
  @override
  final String? location;
  @override
  @JsonKey(name: "is_professional")
  final bool? isProfessional;
  @override
  @JsonKey(name: "is_online")
  final bool? isOnline;
  @override
  @JsonKey(name: "is_requested")
  final bool? isRequested;
  @override
  @JsonKey(name: "discount_type")
  final String? discountType;
  @override
  @JsonKey(name: "discount_value")
  final String? discountValue;
// @JsonKey(name: "extra_data") List<String>? extraData,
  @override
  @JsonKey(name: "no_of_reservation")
  final int? noOfReservation;
  @override
  final String? slug;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "needs_approval")
  final bool? needsApproval;
  @override
  @JsonKey(name: "is_endorsed")
  final bool? isEndorsed;
// dynamic? merchant,
  @override
  final Event? event;

  @override
  String toString() {
    return 'EntityService(id: $id, createdBy: $createdBy, currency: $currency, city: $city, images: $images, videos: $videos, service: $service, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, highlights: $highlights, budgetType: $budgetType, budgetFrom: $budgetFrom, budgetTo: $budgetTo, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, shareLocation: $shareLocation, isNegotiable: $isNegotiable, revisions: $revisions, viewsCount: $viewsCount, location: $location, isProfessional: $isProfessional, isOnline: $isOnline, isRequested: $isRequested, discountType: $discountType, discountValue: $discountValue, noOfReservation: $noOfReservation, slug: $slug, isActive: $isActive, needsApproval: $needsApproval, isEndorsed: $isEndorsed, event: $event)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.service, service) || other.service == service) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.budgetFrom, budgetFrom) ||
                other.budgetFrom == budgetFrom) &&
            (identical(other.budgetTo, budgetTo) ||
                other.budgetTo == budgetTo) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.shareLocation, shareLocation) ||
                other.shareLocation == shareLocation) &&
            (identical(other.isNegotiable, isNegotiable) ||
                other.isNegotiable == isNegotiable) &&
            (identical(other.revisions, revisions) ||
                other.revisions == revisions) &&
            (identical(other.viewsCount, viewsCount) ||
                other.viewsCount == viewsCount) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isProfessional, isProfessional) ||
                other.isProfessional == isProfessional) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.isRequested, isRequested) ||
                other.isRequested == isRequested) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.noOfReservation, noOfReservation) ||
                other.noOfReservation == noOfReservation) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.needsApproval, needsApproval) ||
                other.needsApproval == needsApproval) &&
            (identical(other.isEndorsed, isEndorsed) ||
                other.isEndorsed == isEndorsed) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdBy,
        currency,
        city,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_videos),
        service,
        createdAt,
        updatedAt,
        title,
        description,
        const DeepCollectionEquality().hash(_highlights),
        budgetType,
        budgetFrom,
        budgetTo,
        startDate,
        endDate,
        startTime,
        endTime,
        shareLocation,
        isNegotiable,
        revisions,
        viewsCount,
        location,
        isProfessional,
        isOnline,
        isRequested,
        discountType,
        discountValue,
        noOfReservation,
        slug,
        isActive,
        needsApproval,
        isEndorsed,
        event
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntityServiceCopyWith<_$_EntityService> get copyWith =>
      __$$_EntityServiceCopyWithImpl<_$_EntityService>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityServiceToJson(
      this,
    );
  }
}

abstract class _EntityService implements EntityService {
  const factory _EntityService(
      {final String? id,
      @JsonKey(name: "created_by") final EntityServiceCreatedBy? createdBy,
      final Currency? currency,
      final City? city,
      final List<Image>? images,
      final List<Image>? videos,
      final Service? service,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "updated_at") final DateTime? updatedAt,
      final String? title,
      final String? description,
      final List<String>? highlights,
      @JsonKey(name: "budget_type") final String? budgetType,
      @JsonKey(name: "budget_from") final String? budgetFrom,
      @JsonKey(name: "budget_to") final String? budgetTo,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate,
      @JsonKey(name: "start_time") final String? startTime,
      @JsonKey(name: "end_time") final String? endTime,
      @JsonKey(name: "share_location") final bool? shareLocation,
      @JsonKey(name: "is_negotiable") final bool? isNegotiable,
      final int? revisions,
      @JsonKey(name: "view_count") final int? viewsCount,
      final String? location,
      @JsonKey(name: "is_professional") final bool? isProfessional,
      @JsonKey(name: "is_online") final bool? isOnline,
      @JsonKey(name: "is_requested") final bool? isRequested,
      @JsonKey(name: "discount_type") final String? discountType,
      @JsonKey(name: "discount_value") final String? discountValue,
      @JsonKey(name: "no_of_reservation") final int? noOfReservation,
      final String? slug,
      @JsonKey(name: "is_active") final bool? isActive,
      @JsonKey(name: "needs_approval") final bool? needsApproval,
      @JsonKey(name: "is_endorsed") final bool? isEndorsed,
      final Event? event}) = _$_EntityService;

  factory _EntityService.fromJson(Map<String, dynamic> json) =
      _$_EntityService.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: "created_by")
  EntityServiceCreatedBy? get createdBy;
  @override
  Currency? get currency;
  @override
  City? get city;
  @override
  List<Image>? get images;
  @override
  List<Image>? get videos;
  @override
  Service? get service;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  String? get title;
  @override
  String? get description;
  @override
  List<String>? get highlights;
  @override
  @JsonKey(name: "budget_type")
  String? get budgetType;
  @override
  @JsonKey(name: "budget_from")
  String? get budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  String? get budgetTo;
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
  @JsonKey(name: "share_location")
  bool? get shareLocation;
  @override
  @JsonKey(name: "is_negotiable")
  bool? get isNegotiable;
  @override
  int? get revisions;
  @override // @JsonKey(name: "recursion_type") String? recursionType,
  @JsonKey(name: "view_count")
  int? get viewsCount;
  @override
  String? get location;
  @override
  @JsonKey(name: "is_professional")
  bool? get isProfessional;
  @override
  @JsonKey(name: "is_online")
  bool? get isOnline;
  @override
  @JsonKey(name: "is_requested")
  bool? get isRequested;
  @override
  @JsonKey(name: "discount_type")
  String? get discountType;
  @override
  @JsonKey(name: "discount_value")
  String? get discountValue;
  @override // @JsonKey(name: "extra_data") List<String>? extraData,
  @JsonKey(name: "no_of_reservation")
  int? get noOfReservation;
  @override
  String? get slug;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  @JsonKey(name: "needs_approval")
  bool? get needsApproval;
  @override
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed;
  @override // dynamic? merchant,
  Event? get event;
  @override
  @JsonKey(ignore: true)
  _$$_EntityServiceCopyWith<_$_EntityService> get copyWith =>
      throw _privateConstructorUsedError;
}

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  bool? get isFlexible => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  List<DateTime>? get activeDates => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      DateTime? start,
      DateTime? end,
      String? duration,
      bool? isFlexible,
      bool? isActive,
      List<DateTime>? activeDates});
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? duration = freezed,
    Object? isFlexible = freezed,
    Object? isActive = freezed,
    Object? activeDates = freezed,
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
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeDates: freezed == activeDates
          ? _value.activeDates
          : activeDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$_EventCopyWith(_$_Event value, $Res Function(_$_Event) then) =
      __$$_EventCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      DateTime? start,
      DateTime? end,
      String? duration,
      bool? isFlexible,
      bool? isActive,
      List<DateTime>? activeDates});
}

/// @nodoc
class __$$_EventCopyWithImpl<$Res> extends _$EventCopyWithImpl<$Res, _$_Event>
    implements _$$_EventCopyWith<$Res> {
  __$$_EventCopyWithImpl(_$_Event _value, $Res Function(_$_Event) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? duration = freezed,
    Object? isFlexible = freezed,
    Object? isActive = freezed,
    Object? activeDates = freezed,
  }) {
    return _then(_$_Event(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      activeDates: freezed == activeDates
          ? _value._activeDates
          : activeDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Event implements _Event {
  const _$_Event(
      {this.id,
      this.title,
      this.start,
      this.end,
      this.duration,
      this.isFlexible,
      this.isActive,
      final List<DateTime>? activeDates})
      : _activeDates = activeDates;

  factory _$_Event.fromJson(Map<String, dynamic> json) =>
      _$$_EventFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  final DateTime? start;
  @override
  final DateTime? end;
  @override
  final String? duration;
  @override
  final bool? isFlexible;
  @override
  final bool? isActive;
  final List<DateTime>? _activeDates;
  @override
  List<DateTime>? get activeDates {
    final value = _activeDates;
    if (value == null) return null;
    if (_activeDates is EqualUnmodifiableListView) return _activeDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Event(id: $id, title: $title, start: $start, end: $end, duration: $duration, isFlexible: $isFlexible, isActive: $isActive, activeDates: $activeDates)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.isFlexible, isFlexible) ||
                other.isFlexible == isFlexible) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._activeDates, _activeDates));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, start, end, duration,
      isFlexible, isActive, const DeepCollectionEquality().hash(_activeDates));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<_$_Event> get copyWith =>
      __$$_EventCopyWithImpl<_$_Event>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EventToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {final String? id,
      final String? title,
      final DateTime? start,
      final DateTime? end,
      final String? duration,
      final bool? isFlexible,
      final bool? isActive,
      final List<DateTime>? activeDates}) = _$_Event;

  factory _Event.fromJson(Map<String, dynamic> json) = _$_Event.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  String? get duration;
  @override
  bool? get isFlexible;
  @override
  bool? get isActive;
  @override
  List<DateTime>? get activeDates;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

City _$CityFromJson(Map<String, dynamic> json) {
  return _City.fromJson(json);
}

/// @nodoc
mixin _$City {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;

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
      double? latitude,
      double? longitude,
      Country? country});

  $CountryCopyWith<$Res>? get country;
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
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
              as Country?,
    ) as $Val);
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
      double? latitude,
      double? longitude,
      Country? country});

  @override
  $CountryCopyWith<$Res>? get country;
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
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
              as Country?,
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
  final int? id;
  @override
  final String? name;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final Country? country;

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
            (identical(other.country, country) || other.country == country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, latitude, longitude, country);

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
      final double? latitude,
      final double? longitude,
      final Country? country}) = _$_City;

  factory _City.fromJson(Map<String, dynamic> json) = _$_City.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  Country? get country;
  @override
  @JsonKey(ignore: true)
  _$$_CityCopyWith<_$_City> get copyWith => throw _privateConstructorUsedError;
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

EntityServiceCreatedBy _$EntityServiceCreatedByFromJson(
    Map<String, dynamic> json) {
  return _EntityServiceCreatedBy.fromJson(json);
}

/// @nodoc
mixin _$EntityServiceCreatedBy {
  String? get id => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
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
  String? get bio => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: "user_type")
  String? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: "is_followed")
  bool? get isFollowed => throw _privateConstructorUsedError;
  @JsonKey(name: "is_following")
  bool? get isFollowing => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntityServiceCreatedByCopyWith<EntityServiceCreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityServiceCreatedByCopyWith<$Res> {
  factory $EntityServiceCreatedByCopyWith(EntityServiceCreatedBy value,
          $Res Function(EntityServiceCreatedBy) then) =
      _$EntityServiceCreatedByCopyWithImpl<$Res, EntityServiceCreatedBy>;
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      String? bio,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? designation,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      @JsonKey(name: "is_followed") bool? isFollowed,
      @JsonKey(name: "is_following") bool? isFollowing,
      Badge? badge});

  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$EntityServiceCreatedByCopyWithImpl<$Res,
        $Val extends EntityServiceCreatedBy>
    implements $EntityServiceCreatedByCopyWith<$Res> {
  _$EntityServiceCreatedByCopyWithImpl(this._value, this._then);

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
              as Badge?,
    ) as $Val);
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
abstract class _$$_EntityServiceCreatedByCopyWith<$Res>
    implements $EntityServiceCreatedByCopyWith<$Res> {
  factory _$$_EntityServiceCreatedByCopyWith(_$_EntityServiceCreatedBy value,
          $Res Function(_$_EntityServiceCreatedBy) then) =
      __$$_EntityServiceCreatedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? username,
      String? email,
      String? phone,
      @JsonKey(name: "full_name") String? fullName,
      @JsonKey(name: "first_name") String? firstName,
      @JsonKey(name: "middle_name") String? middleName,
      @JsonKey(name: "last_name") String? lastName,
      @JsonKey(name: "profile_image") String? profileImage,
      String? bio,
      @JsonKey(name: "created_at") DateTime? createdAt,
      String? designation,
      @JsonKey(name: "user_type") String? userType,
      @JsonKey(name: "is_profile_verified") bool? isProfileVerified,
      @JsonKey(name: "is_followed") bool? isFollowed,
      @JsonKey(name: "is_following") bool? isFollowing,
      Badge? badge});

  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_EntityServiceCreatedByCopyWithImpl<$Res>
    extends _$EntityServiceCreatedByCopyWithImpl<$Res,
        _$_EntityServiceCreatedBy>
    implements _$$_EntityServiceCreatedByCopyWith<$Res> {
  __$$_EntityServiceCreatedByCopyWithImpl(_$_EntityServiceCreatedBy _value,
      $Res Function(_$_EntityServiceCreatedBy) _then)
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
    Object? badge = freezed,
  }) {
    return _then(_$_EntityServiceCreatedBy(
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
              as Badge?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityServiceCreatedBy implements _EntityServiceCreatedBy {
  const _$_EntityServiceCreatedBy(
      {this.id,
      this.username,
      this.email,
      this.phone,
      @JsonKey(name: "full_name") this.fullName,
      @JsonKey(name: "first_name") this.firstName,
      @JsonKey(name: "middle_name") this.middleName,
      @JsonKey(name: "last_name") this.lastName,
      @JsonKey(name: "profile_image") this.profileImage,
      this.bio,
      @JsonKey(name: "created_at") this.createdAt,
      this.designation,
      @JsonKey(name: "user_type") this.userType,
      @JsonKey(name: "is_profile_verified") this.isProfileVerified,
      @JsonKey(name: "is_followed") this.isFollowed,
      @JsonKey(name: "is_following") this.isFollowing,
      this.badge});

  factory _$_EntityServiceCreatedBy.fromJson(Map<String, dynamic> json) =>
      _$$_EntityServiceCreatedByFromJson(json);

  @override
  final String? id;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phone;
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
  final String? bio;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  final String? designation;
  @override
  @JsonKey(name: "user_type")
  final String? userType;
  @override
  @JsonKey(name: "is_profile_verified")
  final bool? isProfileVerified;
  @override
  @JsonKey(name: "is_followed")
  final bool? isFollowed;
  @override
  @JsonKey(name: "is_following")
  final bool? isFollowing;
  @override
  final Badge? badge;

  @override
  String toString() {
    return 'EntityServiceCreatedBy(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, userType: $userType, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityServiceCreatedBy &&
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
            (identical(other.userType, userType) ||
                other.userType == userType) &&
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
      userType,
      isProfileVerified,
      isFollowed,
      isFollowing,
      badge);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EntityServiceCreatedByCopyWith<_$_EntityServiceCreatedBy> get copyWith =>
      __$$_EntityServiceCreatedByCopyWithImpl<_$_EntityServiceCreatedBy>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_EntityServiceCreatedByToJson(
      this,
    );
  }
}

abstract class _EntityServiceCreatedBy implements EntityServiceCreatedBy {
  const factory _EntityServiceCreatedBy(
      {final String? id,
      final String? username,
      final String? email,
      final String? phone,
      @JsonKey(name: "full_name") final String? fullName,
      @JsonKey(name: "first_name") final String? firstName,
      @JsonKey(name: "middle_name") final String? middleName,
      @JsonKey(name: "last_name") final String? lastName,
      @JsonKey(name: "profile_image") final String? profileImage,
      final String? bio,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      final String? designation,
      @JsonKey(name: "user_type") final String? userType,
      @JsonKey(name: "is_profile_verified") final bool? isProfileVerified,
      @JsonKey(name: "is_followed") final bool? isFollowed,
      @JsonKey(name: "is_following") final bool? isFollowing,
      final Badge? badge}) = _$_EntityServiceCreatedBy;

  factory _EntityServiceCreatedBy.fromJson(Map<String, dynamic> json) =
      _$_EntityServiceCreatedBy.fromJson;

  @override
  String? get id;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phone;
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
  String? get bio;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  String? get designation;
  @override
  @JsonKey(name: "user_type")
  String? get userType;
  @override
  @JsonKey(name: "is_profile_verified")
  bool? get isProfileVerified;
  @override
  @JsonKey(name: "is_followed")
  bool? get isFollowed;
  @override
  @JsonKey(name: "is_following")
  bool? get isFollowing;
  @override
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_EntityServiceCreatedByCopyWith<_$_EntityServiceCreatedBy> get copyWith =>
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

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  int? get id => throw _privateConstructorUsedError;
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
      {int? id,
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
      @JsonKey(name: "media_type") this.mediaType,
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
      {final int? id,
      final String? name,
      final String? size,
      @JsonKey(name: "media_type") final String? mediaType,
      final String? media}) = _$_Image;

  factory _Image.fromJson(Map<String, dynamic> json) = _$_Image.fromJson;

  @override
  int? get id;
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

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return _Service.fromJson(json);
}

/// @nodoc
mixin _$Service {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: "is_verified")
  bool? get isVerified => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;

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
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "is_verified") bool? isVerified,
      Category? category,
      List<Image>? images});

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
      @JsonKey(name: "is_active") bool? isActive,
      @JsonKey(name: "is_verified") bool? isVerified,
      Category? category,
      List<Image>? images});

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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Service implements _Service {
  const _$_Service(
      {this.id,
      this.title,
      @JsonKey(name: "is_active") this.isActive,
      @JsonKey(name: "is_verified") this.isVerified,
      this.category,
      final List<Image>? images})
      : _images = images;

  factory _$_Service.fromJson(Map<String, dynamic> json) =>
      _$$_ServiceFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  @JsonKey(name: "is_verified")
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

  @override
  String toString() {
    return 'Service(id: $id, title: $title, isActive: $isActive, isVerified: $isVerified, category: $category, images: $images)';
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
            const DeepCollectionEquality().equals(other._images, _images));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, isActive, isVerified,
      category, const DeepCollectionEquality().hash(_images));

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
      @JsonKey(name: "is_active") final bool? isActive,
      @JsonKey(name: "is_verified") final bool? isVerified,
      final Category? category,
      final List<Image>? images}) = _$_Service;

  factory _Service.fromJson(Map<String, dynamic> json) = _$_Service.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  @JsonKey(name: "is_verified")
  bool? get isVerified;
  @override
  Category? get category;
  @override
  List<Image>? get images;
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
