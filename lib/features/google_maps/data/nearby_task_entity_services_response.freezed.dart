// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_task_entity_services_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NearbyTaskEntityServiceResponseDTO _$NearbyTaskEntityServiceResponseDTOFromJson(
    Map<String, dynamic> json) {
  return _NearbyTaskEntityServiceResponseDTO.fromJson(json);
}

/// @nodoc
mixin _$NearbyTaskEntityServiceResponseDTO {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  List<TaskEntityService>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyTaskEntityServiceResponseDTOCopyWith<
          NearbyTaskEntityServiceResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyTaskEntityServiceResponseDTOCopyWith<$Res> {
  factory $NearbyTaskEntityServiceResponseDTOCopyWith(
          NearbyTaskEntityServiceResponseDTO value,
          $Res Function(NearbyTaskEntityServiceResponseDTO) then) =
      _$NearbyTaskEntityServiceResponseDTOCopyWithImpl<$Res,
          NearbyTaskEntityServiceResponseDTO>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<TaskEntityService>? result});
}

/// @nodoc
class _$NearbyTaskEntityServiceResponseDTOCopyWithImpl<$Res,
        $Val extends NearbyTaskEntityServiceResponseDTO>
    implements $NearbyTaskEntityServiceResponseDTOCopyWith<$Res> {
  _$NearbyTaskEntityServiceResponseDTOCopyWithImpl(this._value, this._then);

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
              as List<TaskEntityService>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NearbyTaskEntityServiceResponseDTOCopyWith<$Res>
    implements $NearbyTaskEntityServiceResponseDTOCopyWith<$Res> {
  factory _$$_NearbyTaskEntityServiceResponseDTOCopyWith(
          _$_NearbyTaskEntityServiceResponseDTO value,
          $Res Function(_$_NearbyTaskEntityServiceResponseDTO) then) =
      __$$_NearbyTaskEntityServiceResponseDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      List<TaskEntityService>? result});
}

/// @nodoc
class __$$_NearbyTaskEntityServiceResponseDTOCopyWithImpl<$Res>
    extends _$NearbyTaskEntityServiceResponseDTOCopyWithImpl<$Res,
        _$_NearbyTaskEntityServiceResponseDTO>
    implements _$$_NearbyTaskEntityServiceResponseDTOCopyWith<$Res> {
  __$$_NearbyTaskEntityServiceResponseDTOCopyWithImpl(
      _$_NearbyTaskEntityServiceResponseDTO _value,
      $Res Function(_$_NearbyTaskEntityServiceResponseDTO) _then)
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
    return _then(_$_NearbyTaskEntityServiceResponseDTO(
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
              as List<TaskEntityService>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NearbyTaskEntityServiceResponseDTO
    implements _NearbyTaskEntityServiceResponseDTO {
  const _$_NearbyTaskEntityServiceResponseDTO(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      final List<TaskEntityService>? result})
      : _result = result;

  factory _$_NearbyTaskEntityServiceResponseDTO.fromJson(
          Map<String, dynamic> json) =>
      _$$_NearbyTaskEntityServiceResponseDTOFromJson(json);

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
  final List<TaskEntityService>? _result;
  @override
  List<TaskEntityService>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NearbyTaskEntityServiceResponseDTO(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NearbyTaskEntityServiceResponseDTO &&
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
  _$$_NearbyTaskEntityServiceResponseDTOCopyWith<
          _$_NearbyTaskEntityServiceResponseDTO>
      get copyWith => __$$_NearbyTaskEntityServiceResponseDTOCopyWithImpl<
          _$_NearbyTaskEntityServiceResponseDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NearbyTaskEntityServiceResponseDTOToJson(
      this,
    );
  }
}

abstract class _NearbyTaskEntityServiceResponseDTO
    implements NearbyTaskEntityServiceResponseDTO {
  const factory _NearbyTaskEntityServiceResponseDTO(
          {@JsonKey(name: 'total_pages') final int? totalPages,
          final int? count,
          final int? current,
          final String? next,
          final String? previous,
          @JsonKey(name: 'page_size') final int? pageSize,
          final List<TaskEntityService>? result}) =
      _$_NearbyTaskEntityServiceResponseDTO;

  factory _NearbyTaskEntityServiceResponseDTO.fromJson(
          Map<String, dynamic> json) =
      _$_NearbyTaskEntityServiceResponseDTO.fromJson;

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
  List<TaskEntityService>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_NearbyTaskEntityServiceResponseDTOCopyWith<
          _$_NearbyTaskEntityServiceResponseDTO>
      get copyWith => throw _privateConstructorUsedError;
}
