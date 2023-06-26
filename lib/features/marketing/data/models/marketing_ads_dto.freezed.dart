// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'marketing_ads_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarketingAdsDto _$MarketingAdsDtoFromJson(Map<String, dynamic> json) {
  return _MarketingAdsDto.fromJson(json);
}

/// @nodoc
mixin _$MarketingAdsDto {
  @JsonKey(name: 'total_pages')
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_size')
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'result')
  List<Ads>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarketingAdsDtoCopyWith<MarketingAdsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarketingAdsDtoCopyWith<$Res> {
  factory $MarketingAdsDtoCopyWith(
          MarketingAdsDto value, $Res Function(MarketingAdsDto) then) =
      _$MarketingAdsDtoCopyWithImpl<$Res, MarketingAdsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'result') List<Ads>? result});
}

/// @nodoc
class _$MarketingAdsDtoCopyWithImpl<$Res, $Val extends MarketingAdsDto>
    implements $MarketingAdsDtoCopyWith<$Res> {
  _$MarketingAdsDtoCopyWithImpl(this._value, this._then);

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
              as List<Ads>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MarketingAdsDtoCopyWith<$Res>
    implements $MarketingAdsDtoCopyWith<$Res> {
  factory _$$_MarketingAdsDtoCopyWith(
          _$_MarketingAdsDto value, $Res Function(_$_MarketingAdsDto) then) =
      __$$_MarketingAdsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_pages') int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: 'page_size') int? pageSize,
      @JsonKey(name: 'result') List<Ads>? result});
}

/// @nodoc
class __$$_MarketingAdsDtoCopyWithImpl<$Res>
    extends _$MarketingAdsDtoCopyWithImpl<$Res, _$_MarketingAdsDto>
    implements _$$_MarketingAdsDtoCopyWith<$Res> {
  __$$_MarketingAdsDtoCopyWithImpl(
      _$_MarketingAdsDto _value, $Res Function(_$_MarketingAdsDto) _then)
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
    return _then(_$_MarketingAdsDto(
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
              as List<Ads>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MarketingAdsDto implements _MarketingAdsDto {
  const _$_MarketingAdsDto(
      {@JsonKey(name: 'total_pages') this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: 'page_size') this.pageSize,
      @JsonKey(name: 'result') final List<Ads>? result})
      : _result = result;

  factory _$_MarketingAdsDto.fromJson(Map<String, dynamic> json) =>
      _$$_MarketingAdsDtoFromJson(json);

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
  final List<Ads>? _result;
  @override
  @JsonKey(name: 'result')
  List<Ads>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MarketingAdsDto(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MarketingAdsDto &&
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
  _$$_MarketingAdsDtoCopyWith<_$_MarketingAdsDto> get copyWith =>
      __$$_MarketingAdsDtoCopyWithImpl<_$_MarketingAdsDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MarketingAdsDtoToJson(
      this,
    );
  }
}

abstract class _MarketingAdsDto implements MarketingAdsDto {
  const factory _MarketingAdsDto(
      {@JsonKey(name: 'total_pages') final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: 'page_size') final int? pageSize,
      @JsonKey(name: 'result') final List<Ads>? result}) = _$_MarketingAdsDto;

  factory _MarketingAdsDto.fromJson(Map<String, dynamic> json) =
      _$_MarketingAdsDto.fromJson;

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
  @JsonKey(name: 'result')
  List<Ads>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_MarketingAdsDtoCopyWith<_$_MarketingAdsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

Ads _$AdsFromJson(Map<String, dynamic> json) {
  return _Ads.fromJson(json);
}

/// @nodoc
mixin _$Ads {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get content => throw _privateConstructorUsedError;
  int? get source => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_closable')
  bool? get isClosable => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_shape')
  String? get mobileShape => throw _privateConstructorUsedError;
  @JsonKey(name: 'web_shape')
  String? get webShape => throw _privateConstructorUsedError;
  String? get behaviour => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'page_url')
  String? get pageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'redirect_url')
  String? get redirectUrl => throw _privateConstructorUsedError;
  int? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdsCopyWith<Ads> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdsCopyWith<$Res> {
  factory $AdsCopyWith(Ads value, $Res Function(Ads) then) =
      _$AdsCopyWithImpl<$Res, Ads>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      int? source,
      String? type,
      @JsonKey(name: 'is_closable') bool? isClosable,
      @JsonKey(name: 'mobile_shape') String? mobileShape,
      @JsonKey(name: 'web_shape') String? webShape,
      String? behaviour,
      String? image,
      @JsonKey(name: 'page_url') String? pageUrl,
      @JsonKey(name: 'redirect_url') String? redirectUrl,
      int? priority,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class _$AdsCopyWithImpl<$Res, $Val extends Ads> implements $AdsCopyWith<$Res> {
  _$AdsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? source = freezed,
    Object? type = freezed,
    Object? isClosable = freezed,
    Object? mobileShape = freezed,
    Object? webShape = freezed,
    Object? behaviour = freezed,
    Object? image = freezed,
    Object? pageUrl = freezed,
    Object? redirectUrl = freezed,
    Object? priority = freezed,
    Object? isActive = freezed,
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
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isClosable: freezed == isClosable
          ? _value.isClosable
          : isClosable // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileShape: freezed == mobileShape
          ? _value.mobileShape
          : mobileShape // ignore: cast_nullable_to_non_nullable
              as String?,
      webShape: freezed == webShape
          ? _value.webShape
          : webShape // ignore: cast_nullable_to_non_nullable
              as String?,
      behaviour: freezed == behaviour
          ? _value.behaviour
          : behaviour // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      pageUrl: freezed == pageUrl
          ? _value.pageUrl
          : pageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdsCopyWith<$Res> implements $AdsCopyWith<$Res> {
  factory _$$_AdsCopyWith(_$_Ads value, $Res Function(_$_Ads) then) =
      __$$_AdsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? content,
      int? source,
      String? type,
      @JsonKey(name: 'is_closable') bool? isClosable,
      @JsonKey(name: 'mobile_shape') String? mobileShape,
      @JsonKey(name: 'web_shape') String? webShape,
      String? behaviour,
      String? image,
      @JsonKey(name: 'page_url') String? pageUrl,
      @JsonKey(name: 'redirect_url') String? redirectUrl,
      int? priority,
      @JsonKey(name: 'is_active') bool? isActive});
}

/// @nodoc
class __$$_AdsCopyWithImpl<$Res> extends _$AdsCopyWithImpl<$Res, _$_Ads>
    implements _$$_AdsCopyWith<$Res> {
  __$$_AdsCopyWithImpl(_$_Ads _value, $Res Function(_$_Ads) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? content = freezed,
    Object? source = freezed,
    Object? type = freezed,
    Object? isClosable = freezed,
    Object? mobileShape = freezed,
    Object? webShape = freezed,
    Object? behaviour = freezed,
    Object? image = freezed,
    Object? pageUrl = freezed,
    Object? redirectUrl = freezed,
    Object? priority = freezed,
    Object? isActive = freezed,
  }) {
    return _then(_$_Ads(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as int?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isClosable: freezed == isClosable
          ? _value.isClosable
          : isClosable // ignore: cast_nullable_to_non_nullable
              as bool?,
      mobileShape: freezed == mobileShape
          ? _value.mobileShape
          : mobileShape // ignore: cast_nullable_to_non_nullable
              as String?,
      webShape: freezed == webShape
          ? _value.webShape
          : webShape // ignore: cast_nullable_to_non_nullable
              as String?,
      behaviour: freezed == behaviour
          ? _value.behaviour
          : behaviour // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      pageUrl: freezed == pageUrl
          ? _value.pageUrl
          : pageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      redirectUrl: freezed == redirectUrl
          ? _value.redirectUrl
          : redirectUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ads implements _Ads {
  const _$_Ads(
      {this.id,
      this.title,
      this.content,
      this.source,
      this.type,
      @JsonKey(name: 'is_closable') this.isClosable,
      @JsonKey(name: 'mobile_shape') this.mobileShape,
      @JsonKey(name: 'web_shape') this.webShape,
      this.behaviour,
      this.image,
      @JsonKey(name: 'page_url') this.pageUrl,
      @JsonKey(name: 'redirect_url') this.redirectUrl,
      this.priority,
      @JsonKey(name: 'is_active') this.isActive});

  factory _$_Ads.fromJson(Map<String, dynamic> json) => _$$_AdsFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? content;
  @override
  final int? source;
  @override
  final String? type;
  @override
  @JsonKey(name: 'is_closable')
  final bool? isClosable;
  @override
  @JsonKey(name: 'mobile_shape')
  final String? mobileShape;
  @override
  @JsonKey(name: 'web_shape')
  final String? webShape;
  @override
  final String? behaviour;
  @override
  final String? image;
  @override
  @JsonKey(name: 'page_url')
  final String? pageUrl;
  @override
  @JsonKey(name: 'redirect_url')
  final String? redirectUrl;
  @override
  final int? priority;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;

  @override
  String toString() {
    return 'Ads(id: $id, title: $title, content: $content, source: $source, type: $type, isClosable: $isClosable, mobileShape: $mobileShape, webShape: $webShape, behaviour: $behaviour, image: $image, pageUrl: $pageUrl, redirectUrl: $redirectUrl, priority: $priority, isActive: $isActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ads &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isClosable, isClosable) ||
                other.isClosable == isClosable) &&
            (identical(other.mobileShape, mobileShape) ||
                other.mobileShape == mobileShape) &&
            (identical(other.webShape, webShape) ||
                other.webShape == webShape) &&
            (identical(other.behaviour, behaviour) ||
                other.behaviour == behaviour) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.pageUrl, pageUrl) || other.pageUrl == pageUrl) &&
            (identical(other.redirectUrl, redirectUrl) ||
                other.redirectUrl == redirectUrl) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      content,
      source,
      type,
      isClosable,
      mobileShape,
      webShape,
      behaviour,
      image,
      pageUrl,
      redirectUrl,
      priority,
      isActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdsCopyWith<_$_Ads> get copyWith =>
      __$$_AdsCopyWithImpl<_$_Ads>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdsToJson(
      this,
    );
  }
}

abstract class _Ads implements Ads {
  const factory _Ads(
      {final int? id,
      final String? title,
      final String? content,
      final int? source,
      final String? type,
      @JsonKey(name: 'is_closable') final bool? isClosable,
      @JsonKey(name: 'mobile_shape') final String? mobileShape,
      @JsonKey(name: 'web_shape') final String? webShape,
      final String? behaviour,
      final String? image,
      @JsonKey(name: 'page_url') final String? pageUrl,
      @JsonKey(name: 'redirect_url') final String? redirectUrl,
      final int? priority,
      @JsonKey(name: 'is_active') final bool? isActive}) = _$_Ads;

  factory _Ads.fromJson(Map<String, dynamic> json) = _$_Ads.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get content;
  @override
  int? get source;
  @override
  String? get type;
  @override
  @JsonKey(name: 'is_closable')
  bool? get isClosable;
  @override
  @JsonKey(name: 'mobile_shape')
  String? get mobileShape;
  @override
  @JsonKey(name: 'web_shape')
  String? get webShape;
  @override
  String? get behaviour;
  @override
  String? get image;
  @override
  @JsonKey(name: 'page_url')
  String? get pageUrl;
  @override
  @JsonKey(name: 'redirect_url')
  String? get redirectUrl;
  @override
  int? get priority;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(ignore: true)
  _$$_AdsCopyWith<_$_Ads> get copyWith => throw _privateConstructorUsedError;
}
