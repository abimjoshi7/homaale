// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rewards_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RewardsResponseDto _$RewardsResponseDtoFromJson(Map<String, dynamic> json) {
  return _RewardsResponseDto.fromJson(json);
}

/// @nodoc
mixin _$RewardsResponseDto {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  List<Rewards>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardsResponseDtoCopyWith<RewardsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardsResponseDtoCopyWith<$Res> {
  factory $RewardsResponseDtoCopyWith(
          RewardsResponseDto value, $Res Function(RewardsResponseDto) then) =
      _$RewardsResponseDtoCopyWithImpl<$Res, RewardsResponseDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Rewards>? result});
}

/// @nodoc
class _$RewardsResponseDtoCopyWithImpl<$Res, $Val extends RewardsResponseDto>
    implements $RewardsResponseDtoCopyWith<$Res> {
  _$RewardsResponseDtoCopyWithImpl(this._value, this._then);

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
              as List<Rewards>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RewardsResponseDtoCopyWith<$Res>
    implements $RewardsResponseDtoCopyWith<$Res> {
  factory _$$_RewardsResponseDtoCopyWith(_$_RewardsResponseDto value,
          $Res Function(_$_RewardsResponseDto) then) =
      __$$_RewardsResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<Rewards>? result});
}

/// @nodoc
class __$$_RewardsResponseDtoCopyWithImpl<$Res>
    extends _$RewardsResponseDtoCopyWithImpl<$Res, _$_RewardsResponseDto>
    implements _$$_RewardsResponseDtoCopyWith<$Res> {
  __$$_RewardsResponseDtoCopyWithImpl(
      _$_RewardsResponseDto _value, $Res Function(_$_RewardsResponseDto) _then)
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
    return _then(_$_RewardsResponseDto(
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
              as List<Rewards>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RewardsResponseDto implements _RewardsResponseDto {
  const _$_RewardsResponseDto(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<Rewards>? result})
      : _result = result;

  factory _$_RewardsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_RewardsResponseDtoFromJson(json);

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
  final List<Rewards>? _result;
  @override
  List<Rewards>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RewardsResponseDto(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RewardsResponseDto &&
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
  _$$_RewardsResponseDtoCopyWith<_$_RewardsResponseDto> get copyWith =>
      __$$_RewardsResponseDtoCopyWithImpl<_$_RewardsResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardsResponseDtoToJson(
      this,
    );
  }
}

abstract class _RewardsResponseDto implements RewardsResponseDto {
  const factory _RewardsResponseDto(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      final List<Rewards>? result}) = _$_RewardsResponseDto;

  factory _RewardsResponseDto.fromJson(Map<String, dynamic> json) =
      _$_RewardsResponseDto.fromJson;

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
  List<Rewards>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_RewardsResponseDtoCopyWith<_$_RewardsResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Rewards _$RewardsFromJson(Map<String, dynamic> json) {
  return _Rewards.fromJson(json);
}

/// @nodoc
mixin _$Rewards {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'offer_type')
  String? get offerType => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'offer_rule')
  int? get offerRule => throw _privateConstructorUsedError;
  @JsonKey(name: 'redeem_points')
  int? get redeemPoints => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RewardsCopyWith<Rewards> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RewardsCopyWith<$Res> {
  factory $RewardsCopyWith(Rewards value, $Res Function(Rewards) then) =
      _$RewardsCopyWithImpl<$Res, Rewards>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? image,
      String? description,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'offer_type') String? offerType,
      String? code,
      @JsonKey(name: 'offer_rule') int? offerRule,
      @JsonKey(name: 'redeem_points') int? redeemPoints});
}

/// @nodoc
class _$RewardsCopyWithImpl<$Res, $Val extends Rewards>
    implements $RewardsCopyWith<$Res> {
  _$RewardsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? offerType = freezed,
    Object? code = freezed,
    Object? offerRule = freezed,
    Object? redeemPoints = freezed,
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
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as int?,
      redeemPoints: freezed == redeemPoints
          ? _value.redeemPoints
          : redeemPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RewardsCopyWith<$Res> implements $RewardsCopyWith<$Res> {
  factory _$$_RewardsCopyWith(
          _$_Rewards value, $Res Function(_$_Rewards) then) =
      __$$_RewardsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? image,
      String? description,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'offer_type') String? offerType,
      String? code,
      @JsonKey(name: 'offer_rule') int? offerRule,
      @JsonKey(name: 'redeem_points') int? redeemPoints});
}

/// @nodoc
class __$$_RewardsCopyWithImpl<$Res>
    extends _$RewardsCopyWithImpl<$Res, _$_Rewards>
    implements _$$_RewardsCopyWith<$Res> {
  __$$_RewardsCopyWithImpl(_$_Rewards _value, $Res Function(_$_Rewards) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? image = freezed,
    Object? description = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? offerType = freezed,
    Object? code = freezed,
    Object? offerRule = freezed,
    Object? redeemPoints = freezed,
  }) {
    return _then(_$_Rewards(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as int?,
      redeemPoints: freezed == redeemPoints
          ? _value.redeemPoints
          : redeemPoints // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Rewards implements _Rewards {
  const _$_Rewards(
      {this.id,
      this.title,
      this.image,
      this.description,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'offer_type') this.offerType,
      this.code,
      @JsonKey(name: 'offer_rule') this.offerRule,
      @JsonKey(name: 'redeem_points') this.redeemPoints});

  factory _$_Rewards.fromJson(Map<String, dynamic> json) =>
      _$$_RewardsFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? image;
  @override
  final String? description;
  @override
  @JsonKey(name: 'start_date')
  final DateTime? startDate;
  @override
  @JsonKey(name: 'end_date')
  final DateTime? endDate;
  @override
  @JsonKey(name: 'offer_type')
  final String? offerType;
  @override
  final String? code;
  @override
  @JsonKey(name: 'offer_rule')
  final int? offerRule;
  @override
  @JsonKey(name: 'redeem_points')
  final int? redeemPoints;

  @override
  String toString() {
    return 'Rewards(id: $id, title: $title, image: $image, description: $description, startDate: $startDate, endDate: $endDate, offerType: $offerType, code: $code, offerRule: $offerRule, redeemPoints: $redeemPoints)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Rewards &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.offerRule, offerRule) ||
                other.offerRule == offerRule) &&
            (identical(other.redeemPoints, redeemPoints) ||
                other.redeemPoints == redeemPoints));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, image, description,
      startDate, endDate, offerType, code, offerRule, redeemPoints);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RewardsCopyWith<_$_Rewards> get copyWith =>
      __$$_RewardsCopyWithImpl<_$_Rewards>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RewardsToJson(
      this,
    );
  }
}

abstract class _Rewards implements Rewards {
  const factory _Rewards(
      {final int? id,
      final String? title,
      final String? image,
      final String? description,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate,
      @JsonKey(name: 'offer_type') final String? offerType,
      final String? code,
      @JsonKey(name: 'offer_rule') final int? offerRule,
      @JsonKey(name: 'redeem_points') final int? redeemPoints}) = _$_Rewards;

  factory _Rewards.fromJson(Map<String, dynamic> json) = _$_Rewards.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get image;
  @override
  String? get description;
  @override
  @JsonKey(name: 'start_date')
  DateTime? get startDate;
  @override
  @JsonKey(name: 'end_date')
  DateTime? get endDate;
  @override
  @JsonKey(name: 'offer_type')
  String? get offerType;
  @override
  String? get code;
  @override
  @JsonKey(name: 'offer_rule')
  int? get offerRule;
  @override
  @JsonKey(name: 'redeem_points')
  int? get redeemPoints;
  @override
  @JsonKey(ignore: true)
  _$$_RewardsCopyWith<_$_Rewards> get copyWith =>
      throw _privateConstructorUsedError;
}
