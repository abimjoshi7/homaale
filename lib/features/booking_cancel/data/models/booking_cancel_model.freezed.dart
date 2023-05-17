// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_cancel_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookingCancelModel _$BookingCancelModelFromJson(Map<String, dynamic> json) {
  return _BookingCancelModel.fromJson(json);
}

/// @nodoc
mixin _$BookingCancelModel {
  @JsonKey(name: 'cancellation_reason')
  String? get cancellationReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'cancellation_description')
  String? get cancellationDescription => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookingCancelModelCopyWith<BookingCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCancelModelCopyWith<$Res> {
  factory $BookingCancelModelCopyWith(
          BookingCancelModel value, $Res Function(BookingCancelModel) then) =
      _$BookingCancelModelCopyWithImpl<$Res, BookingCancelModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cancellation_reason')
          String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          String? cancellationDescription});
}

/// @nodoc
class _$BookingCancelModelCopyWithImpl<$Res, $Val extends BookingCancelModel>
    implements $BookingCancelModelCopyWith<$Res> {
  _$BookingCancelModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancellationReason = freezed,
    Object? cancellationDescription = freezed,
  }) {
    return _then(_value.copyWith(
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDescription: freezed == cancellationDescription
          ? _value.cancellationDescription
          : cancellationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BookingCancelModelCopyWith<$Res>
    implements $BookingCancelModelCopyWith<$Res> {
  factory _$$_BookingCancelModelCopyWith(_$_BookingCancelModel value,
          $Res Function(_$_BookingCancelModel) then) =
      __$$_BookingCancelModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cancellation_reason')
          String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          String? cancellationDescription});
}

/// @nodoc
class __$$_BookingCancelModelCopyWithImpl<$Res>
    extends _$BookingCancelModelCopyWithImpl<$Res, _$_BookingCancelModel>
    implements _$$_BookingCancelModelCopyWith<$Res> {
  __$$_BookingCancelModelCopyWithImpl(
      _$_BookingCancelModel _value, $Res Function(_$_BookingCancelModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cancellationReason = freezed,
    Object? cancellationDescription = freezed,
  }) {
    return _then(_$_BookingCancelModel(
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      cancellationDescription: freezed == cancellationDescription
          ? _value.cancellationDescription
          : cancellationDescription // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookingCancelModel implements _BookingCancelModel {
  const _$_BookingCancelModel(
      {@JsonKey(name: 'cancellation_reason') this.cancellationReason,
      @JsonKey(name: 'cancellation_description') this.cancellationDescription});

  factory _$_BookingCancelModel.fromJson(Map<String, dynamic> json) =>
      _$$_BookingCancelModelFromJson(json);

  @override
  @JsonKey(name: 'cancellation_reason')
  final String? cancellationReason;
  @override
  @JsonKey(name: 'cancellation_description')
  final String? cancellationDescription;

  @override
  String toString() {
    return 'BookingCancelModel(cancellationReason: $cancellationReason, cancellationDescription: $cancellationDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BookingCancelModel &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(
                    other.cancellationDescription, cancellationDescription) ||
                other.cancellationDescription == cancellationDescription));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cancellationReason, cancellationDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BookingCancelModelCopyWith<_$_BookingCancelModel> get copyWith =>
      __$$_BookingCancelModelCopyWithImpl<_$_BookingCancelModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BookingCancelModelToJson(
      this,
    );
  }
}

abstract class _BookingCancelModel implements BookingCancelModel {
  const factory _BookingCancelModel(
      {@JsonKey(name: 'cancellation_reason')
          final String? cancellationReason,
      @JsonKey(name: 'cancellation_description')
          final String? cancellationDescription}) = _$_BookingCancelModel;

  factory _BookingCancelModel.fromJson(Map<String, dynamic> json) =
      _$_BookingCancelModel.fromJson;

  @override
  @JsonKey(name: 'cancellation_reason')
  String? get cancellationReason;
  @override
  @JsonKey(name: 'cancellation_description')
  String? get cancellationDescription;
  @override
  @JsonKey(ignore: true)
  _$$_BookingCancelModelCopyWith<_$_BookingCancelModel> get copyWith =>
      throw _privateConstructorUsedError;
}
