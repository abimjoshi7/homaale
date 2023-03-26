// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_schedule_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateScheduleReq _$CreateScheduleReqFromJson(Map<String, dynamic> json) {
  return _CreateScheduleReq.fromJson(json);
}

/// @nodoc
mixin _$CreateScheduleReq {
  String? get id => throw _privateConstructorUsedError;
  String? get event => throw _privateConstructorUsedError;
  @JsonKey(name: "repeat_type")
  int? get repeatType => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "guest_limit")
  int? get guestLimit => throw _privateConstructorUsedError;
  @JsonKey(name: "")
  bool? get isActive => throw _privateConstructorUsedError;
  List<Slot>? get slots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateScheduleReqCopyWith<CreateScheduleReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateScheduleReqCopyWith<$Res> {
  factory $CreateScheduleReqCopyWith(
          CreateScheduleReq value, $Res Function(CreateScheduleReq) then) =
      _$CreateScheduleReqCopyWithImpl<$Res, CreateScheduleReq>;
  @useResult
  $Res call(
      {String? id,
      String? event,
      @JsonKey(name: "repeat_type") int? repeatType,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "") bool? isActive,
      List<Slot>? slots});
}

/// @nodoc
class _$CreateScheduleReqCopyWithImpl<$Res, $Val extends CreateScheduleReq>
    implements $CreateScheduleReqCopyWith<$Res> {
  _$CreateScheduleReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeatType = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? guestLimit = freezed,
    Object? isActive = freezed,
    Object? slots = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      slots: freezed == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateScheduleReqCopyWith<$Res>
    implements $CreateScheduleReqCopyWith<$Res> {
  factory _$$_CreateScheduleReqCopyWith(_$_CreateScheduleReq value,
          $Res Function(_$_CreateScheduleReq) then) =
      __$$_CreateScheduleReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? event,
      @JsonKey(name: "repeat_type") int? repeatType,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "") bool? isActive,
      List<Slot>? slots});
}

/// @nodoc
class __$$_CreateScheduleReqCopyWithImpl<$Res>
    extends _$CreateScheduleReqCopyWithImpl<$Res, _$_CreateScheduleReq>
    implements _$$_CreateScheduleReqCopyWith<$Res> {
  __$$_CreateScheduleReqCopyWithImpl(
      _$_CreateScheduleReq _value, $Res Function(_$_CreateScheduleReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? event = freezed,
    Object? repeatType = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? guestLimit = freezed,
    Object? isActive = freezed,
    Object? slots = freezed,
  }) {
    return _then(_$_CreateScheduleReq(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      slots: freezed == slots
          ? _value._slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateScheduleReq implements _CreateScheduleReq {
  const _$_CreateScheduleReq(
      {this.id,
      this.event,
      @JsonKey(name: "repeat_type") this.repeatType,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "guest_limit") this.guestLimit,
      @JsonKey(name: "") this.isActive,
      final List<Slot>? slots})
      : _slots = slots;

  factory _$_CreateScheduleReq.fromJson(Map<String, dynamic> json) =>
      _$$_CreateScheduleReqFromJson(json);

  @override
  final String? id;
  @override
  final String? event;
  @override
  @JsonKey(name: "repeat_type")
  final int? repeatType;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;
  @override
  @JsonKey(name: "guest_limit")
  final int? guestLimit;
  @override
  @JsonKey(name: "")
  final bool? isActive;
  final List<Slot>? _slots;
  @override
  List<Slot>? get slots {
    final value = _slots;
    if (value == null) return null;
    if (_slots is EqualUnmodifiableListView) return _slots;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CreateScheduleReq(id: $id, event: $event, repeatType: $repeatType, startDate: $startDate, endDate: $endDate, guestLimit: $guestLimit, isActive: $isActive, slots: $slots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateScheduleReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.event, event) || other.event == event) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.guestLimit, guestLimit) ||
                other.guestLimit == guestLimit) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      event,
      repeatType,
      startDate,
      endDate,
      guestLimit,
      isActive,
      const DeepCollectionEquality().hash(_slots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateScheduleReqCopyWith<_$_CreateScheduleReq> get copyWith =>
      __$$_CreateScheduleReqCopyWithImpl<_$_CreateScheduleReq>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateScheduleReqToJson(
      this,
    );
  }
}

abstract class _CreateScheduleReq implements CreateScheduleReq {
  const factory _CreateScheduleReq(
      {final String? id,
      final String? event,
      @JsonKey(name: "repeat_type") final int? repeatType,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate,
      @JsonKey(name: "guest_limit") final int? guestLimit,
      @JsonKey(name: "") final bool? isActive,
      final List<Slot>? slots}) = _$_CreateScheduleReq;

  factory _CreateScheduleReq.fromJson(Map<String, dynamic> json) =
      _$_CreateScheduleReq.fromJson;

  @override
  String? get id;
  @override
  String? get event;
  @override
  @JsonKey(name: "repeat_type")
  int? get repeatType;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(name: "guest_limit")
  int? get guestLimit;
  @override
  @JsonKey(name: "")
  bool? get isActive;
  @override
  List<Slot>? get slots;
  @override
  @JsonKey(ignore: true)
  _$$_CreateScheduleReqCopyWith<_$_CreateScheduleReq> get copyWith =>
      throw _privateConstructorUsedError;
}

Slot _$SlotFromJson(Map<String, dynamic> json) {
  return _Slot.fromJson(json);
}

/// @nodoc
mixin _$Slot {
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlotCopyWith<Slot> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlotCopyWith<$Res> {
  factory $SlotCopyWith(Slot value, $Res Function(Slot) then) =
      _$SlotCopyWithImpl<$Res, Slot>;
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class _$SlotCopyWithImpl<$Res, $Val extends Slot>
    implements $SlotCopyWith<$Res> {
  _$SlotCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlotCopyWith<$Res> implements $SlotCopyWith<$Res> {
  factory _$$_SlotCopyWith(_$_Slot value, $Res Function(_$_Slot) then) =
      __$$_SlotCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? start, String? end});
}

/// @nodoc
class __$$_SlotCopyWithImpl<$Res> extends _$SlotCopyWithImpl<$Res, _$_Slot>
    implements _$$_SlotCopyWith<$Res> {
  __$$_SlotCopyWithImpl(_$_Slot _value, $Res Function(_$_Slot) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
  }) {
    return _then(_$_Slot(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Slot implements _Slot {
  const _$_Slot({this.start, this.end});

  factory _$_Slot.fromJson(Map<String, dynamic> json) => _$$_SlotFromJson(json);

  @override
  final String? start;
  @override
  final String? end;

  @override
  String toString() {
    return 'Slot(start: $start, end: $end)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Slot &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, end);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlotCopyWith<_$_Slot> get copyWith =>
      __$$_SlotCopyWithImpl<_$_Slot>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlotToJson(
      this,
    );
  }
}

abstract class _Slot implements Slot {
  const factory _Slot({final String? start, final String? end}) = _$_Slot;

  factory _Slot.fromJson(Map<String, dynamic> json) = _$_Slot.fromJson;

  @override
  String? get start;
  @override
  String? get end;
  @override
  @JsonKey(ignore: true)
  _$$_SlotCopyWith<_$_Slot> get copyWith => throw _privateConstructorUsedError;
}
