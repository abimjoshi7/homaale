// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookings_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingsResponseDto _$BookingsResponseDtoFromJson(Map<String, dynamic> json) {
  return _BookingsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$BookingsResponseDto {
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
  $BookingsResponseDtoCopyWith<BookingsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingsResponseDtoCopyWith<$Res> {
  factory $BookingsResponseDtoCopyWith(
          BookingsResponseDto value, $Res Function(BookingsResponseDto) then) =
      _$BookingsResponseDtoCopyWithImpl<$Res, BookingsResponseDto>;
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
class _$BookingsResponseDtoCopyWithImpl<$Res, $Val extends BookingsResponseDto>
    implements $BookingsResponseDtoCopyWith<$Res> {
  _$BookingsResponseDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_BookingsResponseDtoCopyWith<$Res>
    implements $BookingsResponseDtoCopyWith<$Res> {
  factory _$$_BookingsResponseDtoCopyWith(_$_BookingsResponseDto value,
          $Res Function(_$_BookingsResponseDto) then) =
      __$$_BookingsResponseDtoCopyWithImpl<$Res>;
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
class __$$_BookingsResponseDtoCopyWithImpl<$Res>
    extends _$BookingsResponseDtoCopyWithImpl<$Res, _$_BookingsResponseDto>
    implements _$$_BookingsResponseDtoCopyWith<$Res> {
  __$$_BookingsResponseDtoCopyWithImpl(_$_BookingsResponseDto _value,
      $Res Function(_$_BookingsResponseDto) _then)
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
    return _then(_$_BookingsResponseDto(
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
class _$_BookingsResponseDto implements _BookingsResponseDto {
  const _$_BookingsResponseDto(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<Result>? result})
      : _result = result;

  factory _$_BookingsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_BookingsResponseDtoFromJson(json);

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
    return 'BookingsResponseDto(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingsResponseDto &&
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
  _$$_BookingsResponseDtoCopyWith<_$_BookingsResponseDto> get copyWith =>
      __$$_BookingsResponseDtoCopyWithImpl<_$_BookingsResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingsResponseDtoToJson(
      this,
    );
  }
}

abstract class _BookingsResponseDto implements BookingsResponseDto {
  const factory _BookingsResponseDto(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      final List<Result>? result}) = _$_BookingsResponseDto;

  factory _BookingsResponseDto.fromJson(Map<String, dynamic> json) =
      _$_BookingsResponseDto.fromJson;

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
  _$$_BookingsResponseDtoCopyWith<_$_BookingsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  String? get id => throw _privateConstructorUsedError;
  Assignee? get assigner => throw _privateConstructorUsedError;
  Assignee? get assignee => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_service')
  EntityService? get entityService => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_rated')
  bool? get isRated => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_reason')
  String? get cancellationReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_description')
  String? get cancellationDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancelled_by')
  Assignee? get cancelledBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  String? get earning => throw _privateConstructorUsedError;
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_on')
  DateTime? get completedOn => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'extra_data')
  dynamic get extraData => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_paid')
  bool? get isPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'approved_by')
  String? get approvedBy => throw _privateConstructorUsedError;
  int? get booking => throw _privateConstructorUsedError;

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
      {String? id,
      Assignee? assigner,
      Assignee? assignee,
      @JsonKey(name: 'entity_service')
          EntityService? entityService,
      Currency? currency,
      @JsonKey(name: 'is_rated')
          bool? isRated,
      @JsonKey(name: 'cancellation_reason')
          String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          String? cancellationDescription,
      @JsonKey(name: 'cancelled_by')
          Assignee? cancelledBy,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'is_active')
          bool? isActive,
      String? status,
      String? title,
      String? description,
      String? price,
      String? earning,
      @JsonKey(name: 'estimated_time')
          int? estimatedTime,
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @JsonKey(name: 'completed_on')
          DateTime? completedOn,
      @JsonKey(name: 'start_time')
          String? startTime,
      @JsonKey(name: 'end_time')
          String? endTime,
      @JsonKey(name: 'extra_data')
          dynamic extraData,
      @JsonKey(name: 'is_paid')
          bool? isPaid,
      @JsonKey(name: 'approved_by')
          String? approvedBy,
      int? booking});

  $AssigneeCopyWith<$Res>? get assigner;
  $AssigneeCopyWith<$Res>? get assignee;
  $EntityServiceCopyWith<$Res>? get entityService;
  $CurrencyCopyWith<$Res>? get currency;
  $AssigneeCopyWith<$Res>? get cancelledBy;
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
    Object? assigner = freezed,
    Object? assignee = freezed,
    Object? entityService = freezed,
    Object? currency = freezed,
    Object? isRated = freezed,
    Object? cancellationReason = freezed,
    Object? cancellationDescription = freezed,
    Object? cancelledBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? earning = freezed,
    Object? estimatedTime = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? completedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? extraData = freezed,
    Object? isPaid = freezed,
    Object? approvedBy = freezed,
    Object? booking = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as EntityService?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isRated: freezed == isRated
          ? _value.isRated
          : isRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDescription: freezed == cancellationDescription
          ? _value.cancellationDescription
          : cancellationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      earning: freezed == earning
          ? _value.earning
          : earning // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedOn: freezed == completedOn
          ? _value.completedOn
          : completedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssigneeCopyWith<$Res>? get assigner {
    if (_value.assigner == null) {
      return null;
    }

    return $AssigneeCopyWith<$Res>(_value.assigner!, (value) {
      return _then(_value.copyWith(assigner: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AssigneeCopyWith<$Res>? get assignee {
    if (_value.assignee == null) {
      return null;
    }

    return $AssigneeCopyWith<$Res>(_value.assignee!, (value) {
      return _then(_value.copyWith(assignee: value) as $Val);
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
  $AssigneeCopyWith<$Res>? get cancelledBy {
    if (_value.cancelledBy == null) {
      return null;
    }

    return $AssigneeCopyWith<$Res>(_value.cancelledBy!, (value) {
      return _then(_value.copyWith(cancelledBy: value) as $Val);
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
      {String? id,
      Assignee? assigner,
      Assignee? assignee,
      @JsonKey(name: 'entity_service')
          EntityService? entityService,
      Currency? currency,
      @JsonKey(name: 'is_rated')
          bool? isRated,
      @JsonKey(name: 'cancellation_reason')
          String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          String? cancellationDescription,
      @JsonKey(name: 'cancelled_by')
          Assignee? cancelledBy,
      @JsonKey(name: 'created_at')
          DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          DateTime? updatedAt,
      @JsonKey(name: 'is_active')
          bool? isActive,
      String? status,
      String? title,
      String? description,
      String? price,
      String? earning,
      @JsonKey(name: 'estimated_time')
          int? estimatedTime,
      @JsonKey(name: 'start_date')
          DateTime? startDate,
      @JsonKey(name: 'end_date')
          DateTime? endDate,
      @JsonKey(name: 'completed_on')
          DateTime? completedOn,
      @JsonKey(name: 'start_time')
          String? startTime,
      @JsonKey(name: 'end_time')
          String? endTime,
      @JsonKey(name: 'extra_data')
          dynamic extraData,
      @JsonKey(name: 'is_paid')
          bool? isPaid,
      @JsonKey(name: 'approved_by')
          String? approvedBy,
      int? booking});

  @override
  $AssigneeCopyWith<$Res>? get assigner;
  @override
  $AssigneeCopyWith<$Res>? get assignee;
  @override
  $EntityServiceCopyWith<$Res>? get entityService;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $AssigneeCopyWith<$Res>? get cancelledBy;
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
    Object? assigner = freezed,
    Object? assignee = freezed,
    Object? entityService = freezed,
    Object? currency = freezed,
    Object? isRated = freezed,
    Object? cancellationReason = freezed,
    Object? cancellationDescription = freezed,
    Object? cancelledBy = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? status = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? price = freezed,
    Object? earning = freezed,
    Object? estimatedTime = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? completedOn = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? extraData = freezed,
    Object? isPaid = freezed,
    Object? approvedBy = freezed,
    Object? booking = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      assigner: freezed == assigner
          ? _value.assigner
          : assigner // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      assignee: freezed == assignee
          ? _value.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as EntityService?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      isRated: freezed == isRated
          ? _value.isRated
          : isRated // ignore: cast_nullable_to_non_nullable
              as bool?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDescription: freezed == cancellationDescription
          ? _value.cancellationDescription
          : cancellationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      cancelledBy: freezed == cancelledBy
          ? _value.cancelledBy
          : cancelledBy // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      earning: freezed == earning
          ? _value.earning
          : earning // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedTime: freezed == estimatedTime
          ? _value.estimatedTime
          : estimatedTime // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      completedOn: freezed == completedOn
          ? _value.completedOn
          : completedOn // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      extraData: freezed == extraData
          ? _value.extraData
          : extraData // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isPaid: freezed == isPaid
          ? _value.isPaid
          : isPaid // ignore: cast_nullable_to_non_nullable
              as bool?,
      approvedBy: freezed == approvedBy
          ? _value.approvedBy
          : approvedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      booking: freezed == booking
          ? _value.booking
          : booking // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      this.assigner,
      this.assignee,
      @JsonKey(name: 'entity_service') this.entityService,
      this.currency,
      @JsonKey(name: 'is_rated') this.isRated,
      @JsonKey(name: 'cancellation_reason') this.cancellationReason,
      @JsonKey(name: 'cancellation_description') this.cancellationDescription,
      @JsonKey(name: 'cancelled_by') this.cancelledBy,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      @JsonKey(name: 'is_active') this.isActive,
      this.status,
      this.title,
      this.description,
      this.price,
      this.earning,
      @JsonKey(name: 'estimated_time') this.estimatedTime,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'completed_on') this.completedOn,
      @JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime,
      @JsonKey(name: 'extra_data') this.extraData,
      @JsonKey(name: 'is_paid') this.isPaid,
      @JsonKey(name: 'approved_by') this.approvedBy,
      this.booking});

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final String? id;
  @override
  final Assignee? assigner;
  @override
  final Assignee? assignee;
  @override
  @JsonKey(name: 'entity_service')
  final EntityService? entityService;
  @override
  final Currency? currency;
  @override
  @JsonKey(name: 'is_rated')
  final bool? isRated;
  @override
  @JsonKey(name: 'cancellation_reason')
  final String? cancellationReason;
  @override
  @JsonKey(name: 'cancellation_description')
  final String? cancellationDescription;
  @override
  @JsonKey(name: 'cancelled_by')
  final Assignee? cancelledBy;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  final String? status;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? price;
  @override
  final String? earning;
  @override
  @JsonKey(name: 'estimated_time')
  final int? estimatedTime;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'completed_on')
  final DateTime? completedOn;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;
  @override
  @JsonKey(name: 'extra_data')
  final dynamic extraData;
  @override
  @JsonKey(name: 'is_paid')
  final bool? isPaid;
  @override
  @JsonKey(name: 'approved_by')
  final String? approvedBy;
  @override
  final int? booking;

  @override
  String toString() {
    return 'Result(id: $id, assigner: $assigner, assignee: $assignee, entityService: $entityService, currency: $currency, isRated: $isRated, cancellationReason: $cancellationReason, cancellationDescription: $cancellationDescription, cancelledBy: $cancelledBy, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, status: $status, title: $title, description: $description, price: $price, earning: $earning, estimatedTime: $estimatedTime, startDate: $startDate, endDate: $endDate, completedOn: $completedOn, startTime: $startTime, endTime: $endTime, extraData: $extraData, isPaid: $isPaid, approvedBy: $approvedBy, booking: $booking)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.assigner, assigner) ||
                other.assigner == assigner) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.entityService, entityService) ||
                other.entityService == entityService) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.isRated, isRated) || other.isRated == isRated) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(
                    other.cancellationDescription, cancellationDescription) ||
                other.cancellationDescription == cancellationDescription) &&
            (identical(other.cancelledBy, cancelledBy) ||
                other.cancelledBy == cancelledBy) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.earning, earning) || other.earning == earning) &&
            (identical(other.estimatedTime, estimatedTime) ||
                other.estimatedTime == estimatedTime) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.completedOn, completedOn) ||
                other.completedOn == completedOn) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            const DeepCollectionEquality().equals(other.extraData, extraData) &&
            (identical(other.isPaid, isPaid) || other.isPaid == isPaid) &&
            (identical(other.approvedBy, approvedBy) ||
                other.approvedBy == approvedBy) &&
            (identical(other.booking, booking) || other.booking == booking));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        assigner,
        assignee,
        entityService,
        currency,
        isRated,
        cancellationReason,
        cancellationDescription,
        cancelledBy,
        createdAt,
        updatedAt,
        isActive,
        status,
        title,
        description,
        price,
        earning,
        estimatedTime,
        startDate,
        endDate,
        completedOn,
        startTime,
        endTime,
        const DeepCollectionEquality().hash(extraData),
        isPaid,
        approvedBy,
        booking
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
      {final String? id,
      final Assignee? assigner,
      final Assignee? assignee,
      @JsonKey(name: 'entity_service')
          final EntityService? entityService,
      final Currency? currency,
      @JsonKey(name: 'is_rated')
          final bool? isRated,
      @JsonKey(name: 'cancellation_reason')
          final String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          final String? cancellationDescription,
      @JsonKey(name: 'cancelled_by')
          final Assignee? cancelledBy,
      @JsonKey(name: 'created_at')
          final DateTime? createdAt,
      @JsonKey(name: 'updated_at')
          final DateTime? updatedAt,
      @JsonKey(name: 'is_active')
          final bool? isActive,
      final String? status,
      final String? title,
      final String? description,
      final String? price,
      final String? earning,
      @JsonKey(name: 'estimated_time')
          final int? estimatedTime,
      @JsonKey(name: 'start_date')
          final DateTime? startDate,
      @JsonKey(name: 'end_date')
          final DateTime? endDate,
      @JsonKey(name: 'completed_on')
          final DateTime? completedOn,
      @JsonKey(name: 'start_time')
          final String? startTime,
      @JsonKey(name: 'end_time')
          final String? endTime,
      @JsonKey(name: 'extra_data')
          final dynamic extraData,
      @JsonKey(name: 'is_paid')
          final bool? isPaid,
      @JsonKey(name: 'approved_by')
          final String? approvedBy,
      final int? booking}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  String? get id;
  @override
  Assignee? get assigner;
  @override
  Assignee? get assignee;
  @override
  @JsonKey(name: 'entity_service')
  EntityService? get entityService;
  @override
  Currency? get currency;
  @override
  @JsonKey(name: 'is_rated')
  bool? get isRated;
  @override
  @JsonKey(name: 'cancellation_reason')
  String? get cancellationReason;
  @override
  @JsonKey(name: 'cancellation_description')
  String? get cancellationDescription;
  @override
  @JsonKey(name: 'cancelled_by')
  Assignee? get cancelledBy;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  String? get status;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get price;
  @override
  String? get earning;
  @override
  @JsonKey(name: 'estimated_time')
  int? get estimatedTime;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'completed_on')
  DateTime? get completedOn;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;
  @override
  @JsonKey(name: 'extra_data')
  dynamic get extraData;
  @override
  @JsonKey(name: 'is_paid')
  bool? get isPaid;
  @override
  @JsonKey(name: 'approved_by')
  String? get approvedBy;
  @override
  int? get booking;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

Assignee _$AssigneeFromJson(Map<String, dynamic> json) {
  return _Assignee.fromJson(json);
}

/// @nodoc
mixin _$Assignee {
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
  DateTime? get createdAt => throw _privateConstructorUsedError;
  String? get designation => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_profile_verified')
  bool? get isProfileVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_followed')
  bool? get isFollowed => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_following')
  bool? get isFollowing => throw _privateConstructorUsedError;
  Badge? get badge => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AssigneeCopyWith<Assignee> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssigneeCopyWith<$Res> {
  factory $AssigneeCopyWith(Assignee value, $Res Function(Assignee) then) =
      _$AssigneeCopyWithImpl<$Res, Assignee>;
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
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String? designation,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      Badge? badge});

  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class _$AssigneeCopyWithImpl<$Res, $Val extends Assignee>
    implements $AssigneeCopyWith<$Res> {
  _$AssigneeCopyWithImpl(this._value, this._then);

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
              as DateTime?,
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
abstract class _$$_AssigneeCopyWith<$Res> implements $AssigneeCopyWith<$Res> {
  factory _$$_AssigneeCopyWith(
          _$_Assignee value, $Res Function(_$_Assignee) then) =
      __$$_AssigneeCopyWithImpl<$Res>;
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
      @JsonKey(name: 'created_at') DateTime? createdAt,
      String? designation,
      @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
      @JsonKey(name: 'is_followed') bool? isFollowed,
      @JsonKey(name: 'is_following') bool? isFollowing,
      Badge? badge});

  @override
  $BadgeCopyWith<$Res>? get badge;
}

/// @nodoc
class __$$_AssigneeCopyWithImpl<$Res>
    extends _$AssigneeCopyWithImpl<$Res, _$_Assignee>
    implements _$$_AssigneeCopyWith<$Res> {
  __$$_AssigneeCopyWithImpl(
      _$_Assignee _value, $Res Function(_$_Assignee) _then)
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
    return _then(_$_Assignee(
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
class _$_Assignee implements _Assignee {
  const _$_Assignee(
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

  factory _$_Assignee.fromJson(Map<String, dynamic> json) =>
      _$$_AssigneeFromJson(json);

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
  final DateTime? createdAt;
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
  final Badge? badge;

  @override
  String toString() {
    return 'Assignee(id: $id, username: $username, email: $email, phone: $phone, fullName: $fullName, firstName: $firstName, middleName: $middleName, lastName: $lastName, profileImage: $profileImage, bio: $bio, createdAt: $createdAt, designation: $designation, isProfileVerified: $isProfileVerified, isFollowed: $isFollowed, isFollowing: $isFollowing, badge: $badge)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Assignee &&
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
  _$$_AssigneeCopyWith<_$_Assignee> get copyWith =>
      __$$_AssigneeCopyWithImpl<_$_Assignee>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AssigneeToJson(
      this,
    );
  }
}

abstract class _Assignee implements Assignee {
  const factory _Assignee(
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
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      final String? designation,
      @JsonKey(name: 'is_profile_verified') final bool? isProfileVerified,
      @JsonKey(name: 'is_followed') final bool? isFollowed,
      @JsonKey(name: 'is_following') final bool? isFollowing,
      final Badge? badge}) = _$_Assignee;

  factory _Assignee.fromJson(Map<String, dynamic> json) = _$_Assignee.fromJson;

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
  DateTime? get createdAt;
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
  Badge? get badge;
  @override
  @JsonKey(ignore: true)
  _$$_AssigneeCopyWith<_$_Assignee> get copyWith =>
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

EntityService _$EntityServiceFromJson(Map<String, dynamic> json) {
  return _EntityService.fromJson(json);
}

/// @nodoc
mixin _$EntityService {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_type')
  String? get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_from')
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget_to')
  String? get budgetTo => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<Image>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  Assignee? get createdBy => throw _privateConstructorUsedError;
  List<String>? get highlights => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_requested')
  bool? get isRequested => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'budget_type') String? budgetType,
      @JsonKey(name: 'budget_from') String? budgetFrom,
      @JsonKey(name: 'budget_to') String? budgetTo,
      List<Image>? images,
      List<Image>? videos,
      @JsonKey(name: 'created_by') Assignee? createdBy,
      List<String>? highlights,
      String? location,
      @JsonKey(name: 'is_requested') bool? isRequested});

  $AssigneeCopyWith<$Res>? get createdBy;
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
    Object? budgetType = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? createdBy = freezed,
    Object? highlights = freezed,
    Object? location = freezed,
    Object? isRequested = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      highlights: freezed == highlights
          ? _value.highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AssigneeCopyWith<$Res>? get createdBy {
    if (_value.createdBy == null) {
      return null;
    }

    return $AssigneeCopyWith<$Res>(_value.createdBy!, (value) {
      return _then(_value.copyWith(createdBy: value) as $Val);
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
      @JsonKey(name: 'budget_type') String? budgetType,
      @JsonKey(name: 'budget_from') String? budgetFrom,
      @JsonKey(name: 'budget_to') String? budgetTo,
      List<Image>? images,
      List<Image>? videos,
      @JsonKey(name: 'created_by') Assignee? createdBy,
      List<String>? highlights,
      String? location,
      @JsonKey(name: 'is_requested') bool? isRequested});

  @override
  $AssigneeCopyWith<$Res>? get createdBy;
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
    Object? budgetType = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? images = freezed,
    Object? videos = freezed,
    Object? createdBy = freezed,
    Object? highlights = freezed,
    Object? location = freezed,
    Object? isRequested = freezed,
  }) {
    return _then(_$_EntityService(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as Assignee?,
      highlights: freezed == highlights
          ? _value._highlights
          : highlights // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityService implements _EntityService {
  const _$_EntityService(
      {this.id,
      @JsonKey(name: 'budget_type') this.budgetType,
      @JsonKey(name: 'budget_from') this.budgetFrom,
      @JsonKey(name: 'budget_to') this.budgetTo,
      final List<Image>? images,
      final List<Image>? videos,
      @JsonKey(name: 'created_by') this.createdBy,
      final List<String>? highlights,
      this.location,
      @JsonKey(name: 'is_requested') this.isRequested})
      : _images = images,
        _videos = videos,
        _highlights = highlights;

  factory _$_EntityService.fromJson(Map<String, dynamic> json) =>
      _$$_EntityServiceFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'budget_type')
  final String? budgetType;
  @override
  @JsonKey(name: 'budget_from')
  final String? budgetFrom;
  @override
  @JsonKey(name: 'budget_to')
  final String? budgetTo;
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
  @JsonKey(name: 'created_by')
  final Assignee? createdBy;
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
  final String? location;
  @override
  @JsonKey(name: 'is_requested')
  final bool? isRequested;

  @override
  String toString() {
    return 'EntityService(id: $id, budgetType: $budgetType, budgetFrom: $budgetFrom, budgetTo: $budgetTo, images: $images, videos: $videos, createdBy: $createdBy, highlights: $highlights, location: $location, isRequested: $isRequested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.budgetFrom, budgetFrom) ||
                other.budgetFrom == budgetFrom) &&
            (identical(other.budgetTo, budgetTo) ||
                other.budgetTo == budgetTo) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality()
                .equals(other._highlights, _highlights) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isRequested, isRequested) ||
                other.isRequested == isRequested));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      budgetType,
      budgetFrom,
      budgetTo,
      const DeepCollectionEquality().hash(_images),
      const DeepCollectionEquality().hash(_videos),
      createdBy,
      const DeepCollectionEquality().hash(_highlights),
      location,
      isRequested);

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
          @JsonKey(name: 'budget_type') final String? budgetType,
          @JsonKey(name: 'budget_from') final String? budgetFrom,
          @JsonKey(name: 'budget_to') final String? budgetTo,
          final List<Image>? images,
          final List<Image>? videos,
          @JsonKey(name: 'created_by') final Assignee? createdBy,
          final List<String>? highlights,
          final String? location,
          @JsonKey(name: 'is_requested') final bool? isRequested}) =
      _$_EntityService;

  factory _EntityService.fromJson(Map<String, dynamic> json) =
      _$_EntityService.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'budget_type')
  String? get budgetType;
  @override
  @JsonKey(name: 'budget_from')
  String? get budgetFrom;
  @override
  @JsonKey(name: 'budget_to')
  String? get budgetTo;
  @override
  List<Image>? get images;
  @override
  List<Image>? get videos;
  @override
  @JsonKey(name: 'created_by')
  Assignee? get createdBy;
  @override
  List<String>? get highlights;
  @override
  String? get location;
  @override
  @JsonKey(name: 'is_requested')
  bool? get isRequested;
  @override
  @JsonKey(ignore: true)
  _$$_EntityServiceCopyWith<_$_EntityService> get copyWith =>
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

ExtraDataClass _$ExtraDataClassFromJson(Map<String, dynamic> json) {
  return _ExtraDataClass.fromJson(json);
}

/// @nodoc
mixin _$ExtraDataClass {
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtraDataClassCopyWith<$Res> {
  factory $ExtraDataClassCopyWith(
          ExtraDataClass value, $Res Function(ExtraDataClass) then) =
      _$ExtraDataClassCopyWithImpl<$Res, ExtraDataClass>;
}

/// @nodoc
class _$ExtraDataClassCopyWithImpl<$Res, $Val extends ExtraDataClass>
    implements $ExtraDataClassCopyWith<$Res> {
  _$ExtraDataClassCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ExtraDataClassCopyWith<$Res> {
  factory _$$_ExtraDataClassCopyWith(
          _$_ExtraDataClass value, $Res Function(_$_ExtraDataClass) then) =
      __$$_ExtraDataClassCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ExtraDataClassCopyWithImpl<$Res>
    extends _$ExtraDataClassCopyWithImpl<$Res, _$_ExtraDataClass>
    implements _$$_ExtraDataClassCopyWith<$Res> {
  __$$_ExtraDataClassCopyWithImpl(
      _$_ExtraDataClass _value, $Res Function(_$_ExtraDataClass) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_ExtraDataClass implements _ExtraDataClass {
  const _$_ExtraDataClass();

  factory _$_ExtraDataClass.fromJson(Map<String, dynamic> json) =>
      _$$_ExtraDataClassFromJson(json);

  @override
  String toString() {
    return 'ExtraDataClass()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ExtraDataClass);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExtraDataClassToJson(
      this,
    );
  }
}

abstract class _ExtraDataClass implements ExtraDataClass {
  const factory _ExtraDataClass() = _$_ExtraDataClass;

  factory _ExtraDataClass.fromJson(Map<String, dynamic> json) =
      _$_ExtraDataClass.fromJson;
}
