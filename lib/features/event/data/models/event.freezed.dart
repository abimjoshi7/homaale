// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  @JsonKey(name: "is_flexible")
  bool? get isFlexible => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  List<Schedule>? get schedules => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  @JsonKey(name: "guest_limit")
  int? get guestLimit => throw _privateConstructorUsedError;
  @JsonKey(name: "all_shifts")
  List<AllShift>? get allShifts => throw _privateConstructorUsedError;

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
      @JsonKey(name: "is_flexible") bool? isFlexible,
      @JsonKey(name: "is_active") bool? isActive,
      List<Schedule>? schedules,
      String? duration,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "all_shifts") List<AllShift>? allShifts});
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
    Object? isFlexible = freezed,
    Object? isActive = freezed,
    Object? schedules = freezed,
    Object? duration = freezed,
    Object? guestLimit = freezed,
    Object? allShifts = freezed,
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
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedules: freezed == schedules
          ? _value.schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      allShifts: freezed == allShifts
          ? _value.allShifts
          : allShifts // ignore: cast_nullable_to_non_nullable
              as List<AllShift>?,
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
      @JsonKey(name: "is_flexible") bool? isFlexible,
      @JsonKey(name: "is_active") bool? isActive,
      List<Schedule>? schedules,
      String? duration,
      @JsonKey(name: "guest_limit") int? guestLimit,
      @JsonKey(name: "all_shifts") List<AllShift>? allShifts});
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
    Object? isFlexible = freezed,
    Object? isActive = freezed,
    Object? schedules = freezed,
    Object? duration = freezed,
    Object? guestLimit = freezed,
    Object? allShifts = freezed,
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
      isFlexible: freezed == isFlexible
          ? _value.isFlexible
          : isFlexible // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      schedules: freezed == schedules
          ? _value._schedules
          : schedules // ignore: cast_nullable_to_non_nullable
              as List<Schedule>?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      guestLimit: freezed == guestLimit
          ? _value.guestLimit
          : guestLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      allShifts: freezed == allShifts
          ? _value._allShifts
          : allShifts // ignore: cast_nullable_to_non_nullable
              as List<AllShift>?,
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
      @JsonKey(name: "is_flexible") this.isFlexible,
      @JsonKey(name: "is_active") this.isActive,
      final List<Schedule>? schedules,
      this.duration,
      @JsonKey(name: "guest_limit") this.guestLimit,
      @JsonKey(name: "all_shifts") final List<AllShift>? allShifts})
      : _schedules = schedules,
        _allShifts = allShifts;

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
  @JsonKey(name: "is_flexible")
  final bool? isFlexible;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  final List<Schedule>? _schedules;
  @override
  List<Schedule>? get schedules {
    final value = _schedules;
    if (value == null) return null;
    if (_schedules is EqualUnmodifiableListView) return _schedules;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? duration;
  @override
  @JsonKey(name: "guest_limit")
  final int? guestLimit;
  final List<AllShift>? _allShifts;
  @override
  @JsonKey(name: "all_shifts")
  List<AllShift>? get allShifts {
    final value = _allShifts;
    if (value == null) return null;
    if (_allShifts is EqualUnmodifiableListView) return _allShifts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Event(id: $id, title: $title, start: $start, end: $end, isFlexible: $isFlexible, isActive: $isActive, schedules: $schedules, duration: $duration, guestLimit: $guestLimit, allShifts: $allShifts)';
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
            (identical(other.isFlexible, isFlexible) ||
                other.isFlexible == isFlexible) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._schedules, _schedules) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.guestLimit, guestLimit) ||
                other.guestLimit == guestLimit) &&
            const DeepCollectionEquality()
                .equals(other._allShifts, _allShifts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      start,
      end,
      isFlexible,
      isActive,
      const DeepCollectionEquality().hash(_schedules),
      duration,
      guestLimit,
      const DeepCollectionEquality().hash(_allShifts));

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
      @JsonKey(name: "is_flexible") final bool? isFlexible,
      @JsonKey(name: "is_active") final bool? isActive,
      final List<Schedule>? schedules,
      final String? duration,
      @JsonKey(name: "guest_limit") final int? guestLimit,
      @JsonKey(name: "all_shifts") final List<AllShift>? allShifts}) = _$_Event;

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
  @JsonKey(name: "is_flexible")
  bool? get isFlexible;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  List<Schedule>? get schedules;
  @override
  String? get duration;
  @override
  @JsonKey(name: "guest_limit")
  int? get guestLimit;
  @override
  @JsonKey(name: "all_shifts")
  List<AllShift>? get allShifts;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<_$_Event> get copyWith =>
      throw _privateConstructorUsedError;
}

AllShift _$AllShiftFromJson(Map<String, dynamic> json) {
  return _AllShift.fromJson(json);
}

/// @nodoc
mixin _$AllShift {
  DateTime? get date => throw _privateConstructorUsedError;
  List<Slot>? get slots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AllShiftCopyWith<AllShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllShiftCopyWith<$Res> {
  factory $AllShiftCopyWith(AllShift value, $Res Function(AllShift) then) =
      _$AllShiftCopyWithImpl<$Res, AllShift>;
  @useResult
  $Res call({DateTime? date, List<Slot>? slots});
}

/// @nodoc
class _$AllShiftCopyWithImpl<$Res, $Val extends AllShift>
    implements $AllShiftCopyWith<$Res> {
  _$AllShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? slots = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      slots: freezed == slots
          ? _value.slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AllShiftCopyWith<$Res> implements $AllShiftCopyWith<$Res> {
  factory _$$_AllShiftCopyWith(
          _$_AllShift value, $Res Function(_$_AllShift) then) =
      __$$_AllShiftCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? date, List<Slot>? slots});
}

/// @nodoc
class __$$_AllShiftCopyWithImpl<$Res>
    extends _$AllShiftCopyWithImpl<$Res, _$_AllShift>
    implements _$$_AllShiftCopyWith<$Res> {
  __$$_AllShiftCopyWithImpl(
      _$_AllShift _value, $Res Function(_$_AllShift) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? slots = freezed,
  }) {
    return _then(_$_AllShift(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      slots: freezed == slots
          ? _value._slots
          : slots // ignore: cast_nullable_to_non_nullable
              as List<Slot>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AllShift implements _AllShift {
  const _$_AllShift({this.date, final List<Slot>? slots}) : _slots = slots;

  factory _$_AllShift.fromJson(Map<String, dynamic> json) =>
      _$$_AllShiftFromJson(json);

  @override
  final DateTime? date;
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
    return 'AllShift(date: $date, slots: $slots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AllShift &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._slots, _slots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, date, const DeepCollectionEquality().hash(_slots));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AllShiftCopyWith<_$_AllShift> get copyWith =>
      __$$_AllShiftCopyWithImpl<_$_AllShift>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AllShiftToJson(
      this,
    );
  }
}

abstract class _AllShift implements AllShift {
  const factory _AllShift({final DateTime? date, final List<Slot>? slots}) =
      _$_AllShift;

  factory _AllShift.fromJson(Map<String, dynamic> json) = _$_AllShift.fromJson;

  @override
  DateTime? get date;
  @override
  List<Slot>? get slots;
  @override
  @JsonKey(ignore: true)
  _$$_AllShiftCopyWith<_$_AllShift> get copyWith =>
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

Schedule _$ScheduleFromJson(Map<String, dynamic> json) {
  return _Schedule.fromJson(json);
}

/// @nodoc
mixin _$Schedule {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "repeat_type")
  int? get repeatType => throw _privateConstructorUsedError;
  String? get repeat => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "total_slots")
  int? get totalSlots => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ScheduleCopyWith<Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleCopyWith<$Res> {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) then) =
      _$ScheduleCopyWithImpl<$Res, Schedule>;
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: "repeat_type") int? repeatType,
      String? repeat,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "total_slots") int? totalSlots});
}

/// @nodoc
class _$ScheduleCopyWithImpl<$Res, $Val extends Schedule>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repeatType = freezed,
    Object? repeat = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalSlots = freezed,
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
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalSlots: freezed == totalSlots
          ? _value.totalSlots
          : totalSlots // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ScheduleCopyWith<$Res> implements $ScheduleCopyWith<$Res> {
  factory _$$_ScheduleCopyWith(
          _$_Schedule value, $Res Function(_$_Schedule) then) =
      __$$_ScheduleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? title,
      @JsonKey(name: "repeat_type") int? repeatType,
      String? repeat,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "total_slots") int? totalSlots});
}

/// @nodoc
class __$$_ScheduleCopyWithImpl<$Res>
    extends _$ScheduleCopyWithImpl<$Res, _$_Schedule>
    implements _$$_ScheduleCopyWith<$Res> {
  __$$_ScheduleCopyWithImpl(
      _$_Schedule _value, $Res Function(_$_Schedule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? repeatType = freezed,
    Object? repeat = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? totalSlots = freezed,
  }) {
    return _then(_$_Schedule(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      repeatType: freezed == repeatType
          ? _value.repeatType
          : repeatType // ignore: cast_nullable_to_non_nullable
              as int?,
      repeat: freezed == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      totalSlots: freezed == totalSlots
          ? _value.totalSlots
          : totalSlots // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Schedule implements _Schedule {
  const _$_Schedule(
      {this.id,
      this.title,
      @JsonKey(name: "repeat_type") this.repeatType,
      this.repeat,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "total_slots") this.totalSlots});

  factory _$_Schedule.fromJson(Map<String, dynamic> json) =>
      _$$_ScheduleFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: "repeat_type")
  final int? repeatType;
  @override
  final String? repeat;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;
  @override
  @JsonKey(name: "total_slots")
  final int? totalSlots;

  @override
  String toString() {
    return 'Schedule(id: $id, title: $title, repeatType: $repeatType, repeat: $repeat, startDate: $startDate, endDate: $endDate, totalSlots: $totalSlots)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Schedule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.repeatType, repeatType) ||
                other.repeatType == repeatType) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.totalSlots, totalSlots) ||
                other.totalSlots == totalSlots));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, repeatType, repeat,
      startDate, endDate, totalSlots);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      __$$_ScheduleCopyWithImpl<_$_Schedule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ScheduleToJson(
      this,
    );
  }
}

abstract class _Schedule implements Schedule {
  const factory _Schedule(
      {final String? id,
      final String? title,
      @JsonKey(name: "repeat_type") final int? repeatType,
      final String? repeat,
      @JsonKey(name: "start_date") final DateTime? startDate,
      @JsonKey(name: "end_date") final DateTime? endDate,
      @JsonKey(name: "total_slots") final int? totalSlots}) = _$_Schedule;

  factory _Schedule.fromJson(Map<String, dynamic> json) = _$_Schedule.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: "repeat_type")
  int? get repeatType;
  @override
  String? get repeat;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(name: "total_slots")
  int? get totalSlots;
  @override
  @JsonKey(ignore: true)
  _$$_ScheduleCopyWith<_$_Schedule> get copyWith =>
      throw _privateConstructorUsedError;
}
