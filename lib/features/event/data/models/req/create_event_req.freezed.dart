// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_event_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateEventReq _$CreateEventReqFromJson(Map<String, dynamic> json) {
  return _CreateEventReq.fromJson(json);
}

/// @nodoc
mixin _$CreateEventReq {
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_service")
  String? get entityService => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "is_flexible")
  bool? get isFlexible => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  @JsonKey(name: "guest_limit")
  int? get guestLimit => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  String? get merchant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateEventReqCopyWith<CreateEventReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateEventReqCopyWith<$Res> {
  factory $CreateEventReqCopyWith(
          CreateEventReq value, $Res Function(CreateEventReq) then) =
      _$CreateEventReqCopyWithImpl<$Res, CreateEventReq>;
  @useResult
  $Res call(
      {String? duration,
      @JsonKey(name: "entity_service") String? entityService,
      String? title,
      String? description,
      @JsonKey(name: "is_flexible") bool? isFlexible,
      DateTime? start,
      DateTime? end,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "is_active") bool? isActive,
      String? merchant});
}

/// @nodoc
class _$CreateEventReqCopyWithImpl<$Res, $Val extends CreateEventReq>
    implements $CreateEventReqCopyWith<$Res> {
  _$CreateEventReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? entityService = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isFlexible = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? guestLimit = freezed,
    Object? isActive = freezed,
    Object? merchant = freezed,
  }) {
    return _then(_value.copyWith(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateEventReqCopyWith<$Res>
    implements $CreateEventReqCopyWith<$Res> {
  factory _$$_CreateEventReqCopyWith(
          _$_CreateEventReq value, $Res Function(_$_CreateEventReq) then) =
      __$$_CreateEventReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? duration,
      @JsonKey(name: "entity_service") String? entityService,
      String? title,
      String? description,
      @JsonKey(name: "is_flexible") bool? isFlexible,
      DateTime? start,
      DateTime? end,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "is_active") bool? isActive,
      String? merchant});
}

/// @nodoc
class __$$_CreateEventReqCopyWithImpl<$Res>
    extends _$CreateEventReqCopyWithImpl<$Res, _$_CreateEventReq>
    implements _$$_CreateEventReqCopyWith<$Res> {
  __$$_CreateEventReqCopyWithImpl(
      _$_CreateEventReq _value, $Res Function(_$_CreateEventReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? entityService = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? isFlexible = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? guestLimit = freezed,
    Object? isActive = freezed,
    Object? merchant = freezed,
  }) {
    return _then(_$_CreateEventReq(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      entityService: freezed == entityService
          ? _value.entityService
          : entityService // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateEventReq implements _CreateEventReq {
  const _$_CreateEventReq(
      {this.duration,
      @JsonKey(name: "entity_service") this.entityService,
      this.title,
      this.description,
      @JsonKey(name: "is_flexible") this.isFlexible,
      this.start,
      this.end,
      @JsonKey(name: "guest_limit") this.guestLimit,
      @JsonKey(name: "is_active") this.isActive,
      this.merchant});

  factory _$_CreateEventReq.fromJson(Map<String, dynamic> json) =>
      _$$_CreateEventReqFromJson(json);

  @override
  final String? duration;
  @override
  @JsonKey(name: "entity_service")
  final String? entityService;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "is_flexible")
  final bool? isFlexible;
  @override
  final DateTime? start;
  @override
  final DateTime? end;
  @override
  @JsonKey(name: "guest_limit")
  final int? guestLimit;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String? merchant;

  @override
  String toString() {
    return 'CreateEventReq(duration: $duration, entityService: $entityService, title: $title, description: $description, isFlexible: $isFlexible, start: $start, end: $end, guestLimit: $guestLimit, isActive: $isActive, merchant: $merchant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateEventReq &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.entityService, entityService) ||
                other.entityService == entityService) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isFlexible, isFlexible) ||
                other.isFlexible == isFlexible) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.guestLimit, guestLimit) ||
                other.guestLimit == guestLimit) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, entityService, title,
      description, isFlexible, start, end, guestLimit, isActive, merchant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateEventReqCopyWith<_$_CreateEventReq> get copyWith =>
      __$$_CreateEventReqCopyWithImpl<_$_CreateEventReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateEventReqToJson(
      this,
    );
  }
}

abstract class _CreateEventReq implements CreateEventReq {
  const factory _CreateEventReq(
      {final String? duration,
      @JsonKey(name: "entity_service") final String? entityService,
      final String? title,
      final String? description,
      @JsonKey(name: "is_flexible") final bool? isFlexible,
      final DateTime? start,
      final DateTime? end,
      @JsonKey(name: "guest_limit") final int? guestLimit,
      @JsonKey(name: "is_active") final bool? isActive,
      final String? merchant}) = _$_CreateEventReq;

  factory _CreateEventReq.fromJson(Map<String, dynamic> json) =
      _$_CreateEventReq.fromJson;

  @override
  String? get duration;
  @override
  @JsonKey(name: "entity_service")
  String? get entityService;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "is_flexible")
  bool? get isFlexible;
  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  @JsonKey(name: "guest_limit")
  int? get guestLimit;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  String? get merchant;
  @override
  @JsonKey(ignore: true)
  _$$_CreateEventReqCopyWith<_$_CreateEventReq> get copyWith =>
      throw _privateConstructorUsedError;
}
