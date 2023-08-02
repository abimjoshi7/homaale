// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'redeem_items_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RedeemItemsDetail _$RedeemItemsDetailFromJson(Map<String, dynamic> json) {
  return _RedeemItemsDetail.fromJson(json);
}

/// @nodoc
mixin _$RedeemItemsDetail {
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
  dynamic get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'offer_rule')
  dynamic get offerRule => throw _privateConstructorUsedError;
  @JsonKey(name: 'redeem_points')
  int? get redeemPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'entity_services')
  List<EntityService>? get entityServices => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RedeemItemsDetailCopyWith<RedeemItemsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RedeemItemsDetailCopyWith<$Res> {
  factory $RedeemItemsDetailCopyWith(
          RedeemItemsDetail value, $Res Function(RedeemItemsDetail) then) =
      _$RedeemItemsDetailCopyWithImpl<$Res, RedeemItemsDetail>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? image,
      String? description,
      @JsonKey(name: 'start_date') DateTime? startDate,
      @JsonKey(name: 'end_date') DateTime? endDate,
      @JsonKey(name: 'offer_type') String? offerType,
      dynamic code,
      @JsonKey(name: 'offer_rule') dynamic offerRule,
      @JsonKey(name: 'redeem_points') int? redeemPoints,
      @JsonKey(name: 'entity_services') List<EntityService>? entityServices});
}

/// @nodoc
class _$RedeemItemsDetailCopyWithImpl<$Res, $Val extends RedeemItemsDetail>
    implements $RedeemItemsDetailCopyWith<$Res> {
  _$RedeemItemsDetailCopyWithImpl(this._value, this._then);

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
    Object? entityServices = freezed,
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
              as dynamic,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      redeemPoints: freezed == redeemPoints
          ? _value.redeemPoints
          : redeemPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      entityServices: freezed == entityServices
          ? _value.entityServices
          : entityServices // ignore: cast_nullable_to_non_nullable
              as List<EntityService>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RedeemItemsDetailCopyWith<$Res>
    implements $RedeemItemsDetailCopyWith<$Res> {
  factory _$$_RedeemItemsDetailCopyWith(_$_RedeemItemsDetail value,
          $Res Function(_$_RedeemItemsDetail) then) =
      __$$_RedeemItemsDetailCopyWithImpl<$Res>;
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
      dynamic code,
      @JsonKey(name: 'offer_rule') dynamic offerRule,
      @JsonKey(name: 'redeem_points') int? redeemPoints,
      @JsonKey(name: 'entity_services') List<EntityService>? entityServices});
}

/// @nodoc
class __$$_RedeemItemsDetailCopyWithImpl<$Res>
    extends _$RedeemItemsDetailCopyWithImpl<$Res, _$_RedeemItemsDetail>
    implements _$$_RedeemItemsDetailCopyWith<$Res> {
  __$$_RedeemItemsDetailCopyWithImpl(
      _$_RedeemItemsDetail _value, $Res Function(_$_RedeemItemsDetail) _then)
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
    Object? entityServices = freezed,
  }) {
    return _then(_$_RedeemItemsDetail(
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
              as dynamic,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as dynamic,
      redeemPoints: freezed == redeemPoints
          ? _value.redeemPoints
          : redeemPoints // ignore: cast_nullable_to_non_nullable
              as int?,
      entityServices: freezed == entityServices
          ? _value._entityServices
          : entityServices // ignore: cast_nullable_to_non_nullable
              as List<EntityService>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RedeemItemsDetail implements _RedeemItemsDetail {
  const _$_RedeemItemsDetail(
      {this.id,
      this.title,
      this.image,
      this.description,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate,
      @JsonKey(name: 'offer_type') this.offerType,
      this.code,
      @JsonKey(name: 'offer_rule') this.offerRule,
      @JsonKey(name: 'redeem_points') this.redeemPoints,
      @JsonKey(name: 'entity_services')
      final List<EntityService>? entityServices})
      : _entityServices = entityServices;

  factory _$_RedeemItemsDetail.fromJson(Map<String, dynamic> json) =>
      _$$_RedeemItemsDetailFromJson(json);

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
  final dynamic code;
  @override
  @JsonKey(name: 'offer_rule')
  final dynamic offerRule;
  @override
  @JsonKey(name: 'redeem_points')
  final int? redeemPoints;
  final List<EntityService>? _entityServices;
  @override
  @JsonKey(name: 'entity_services')
  List<EntityService>? get entityServices {
    final value = _entityServices;
    if (value == null) return null;
    if (_entityServices is EqualUnmodifiableListView) return _entityServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RedeemItemsDetail(id: $id, title: $title, image: $image, description: $description, startDate: $startDate, endDate: $endDate, offerType: $offerType, code: $code, offerRule: $offerRule, redeemPoints: $redeemPoints, entityServices: $entityServices)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RedeemItemsDetail &&
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
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.offerRule, offerRule) &&
            (identical(other.redeemPoints, redeemPoints) ||
                other.redeemPoints == redeemPoints) &&
            const DeepCollectionEquality()
                .equals(other._entityServices, _entityServices));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      image,
      description,
      startDate,
      endDate,
      offerType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(offerRule),
      redeemPoints,
      const DeepCollectionEquality().hash(_entityServices));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RedeemItemsDetailCopyWith<_$_RedeemItemsDetail> get copyWith =>
      __$$_RedeemItemsDetailCopyWithImpl<_$_RedeemItemsDetail>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RedeemItemsDetailToJson(
      this,
    );
  }
}

abstract class _RedeemItemsDetail implements RedeemItemsDetail {
  const factory _RedeemItemsDetail(
      {final int? id,
      final String? title,
      final String? image,
      final String? description,
      @JsonKey(name: 'start_date') final DateTime? startDate,
      @JsonKey(name: 'end_date') final DateTime? endDate,
      @JsonKey(name: 'offer_type') final String? offerType,
      final dynamic code,
      @JsonKey(name: 'offer_rule') final dynamic offerRule,
      @JsonKey(name: 'redeem_points') final int? redeemPoints,
      @JsonKey(name: 'entity_services')
      final List<EntityService>? entityServices}) = _$_RedeemItemsDetail;

  factory _RedeemItemsDetail.fromJson(Map<String, dynamic> json) =
      _$_RedeemItemsDetail.fromJson;

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
  dynamic get code;
  @override
  @JsonKey(name: 'offer_rule')
  dynamic get offerRule;
  @override
  @JsonKey(name: 'redeem_points')
  int? get redeemPoints;
  @override
  @JsonKey(name: 'entity_services')
  List<EntityService>? get entityServices;
  @override
  @JsonKey(ignore: true)
  _$$_RedeemItemsDetailCopyWith<_$_RedeemItemsDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

EntityService _$EntityServiceFromJson(Map<String, dynamic> json) {
  return _EntityService.fromJson(json);
}

/// @nodoc
mixin _$EntityService {
  String? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  List<dynamic>? get images => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

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
      String? title,
      @JsonKey(name: 'created_by') CreatedBy? createdBy,
      List<dynamic>? images,
      String? description});

  $CreatedByCopyWith<$Res>? get createdBy;
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
    Object? title = freezed,
    Object? createdBy = freezed,
    Object? images = freezed,
    Object? description = freezed,
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
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
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
      String? title,
      @JsonKey(name: 'created_by') CreatedBy? createdBy,
      List<dynamic>? images,
      String? description});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
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
    Object? title = freezed,
    Object? createdBy = freezed,
    Object? images = freezed,
    Object? description = freezed,
  }) {
    return _then(_$_EntityService(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_EntityService implements _EntityService {
  const _$_EntityService(
      {this.id,
      this.title,
      @JsonKey(name: 'created_by') this.createdBy,
      final List<dynamic>? images,
      this.description})
      : _images = images;

  factory _$_EntityService.fromJson(Map<String, dynamic> json) =>
      _$$_EntityServiceFromJson(json);

  @override
  final String? id;
  @override
  final String? title;
  @override
  @JsonKey(name: 'created_by')
  final CreatedBy? createdBy;
  final List<dynamic>? _images;
  @override
  List<dynamic>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'EntityService(id: $id, title: $title, createdBy: $createdBy, images: $images, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EntityService &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, createdBy,
      const DeepCollectionEquality().hash(_images), description);

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
      final String? title,
      @JsonKey(name: 'created_by') final CreatedBy? createdBy,
      final List<dynamic>? images,
      final String? description}) = _$_EntityService;

  factory _EntityService.fromJson(Map<String, dynamic> json) =
      _$_EntityService.fromJson;

  @override
  String? get id;
  @override
  String? get title;
  @override
  @JsonKey(name: 'created_by')
  CreatedBy? get createdBy;
  @override
  List<dynamic>? get images;
  @override
  String? get description;
  @override
  @JsonKey(ignore: true)
  _$$_EntityServiceCopyWith<_$_EntityService> get copyWith =>
      throw _privateConstructorUsedError;
}

CreatedBy _$CreatedByFromJson(Map<String, dynamic> json) {
  return _CreatedBy.fromJson(json);
}

/// @nodoc
mixin _$CreatedBy {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_name')
  String? get fullName => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_image')
  dynamic get profileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedByCopyWith<CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedByCopyWith<$Res> {
  factory $CreatedByCopyWith(CreatedBy value, $Res Function(CreatedBy) then) =
      _$CreatedByCopyWithImpl<$Res, CreatedBy>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'profile_image') dynamic profileImage});
}

/// @nodoc
class _$CreatedByCopyWithImpl<$Res, $Val extends CreatedBy>
    implements $CreatedByCopyWith<$Res> {
  _$CreatedByCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatedByCopyWith<$Res> implements $CreatedByCopyWith<$Res> {
  factory _$$_CreatedByCopyWith(
          _$_CreatedBy value, $Res Function(_$_CreatedBy) then) =
      __$$_CreatedByCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'profile_image') dynamic profileImage});
}

/// @nodoc
class __$$_CreatedByCopyWithImpl<$Res>
    extends _$CreatedByCopyWithImpl<$Res, _$_CreatedBy>
    implements _$$_CreatedByCopyWith<$Res> {
  __$$_CreatedByCopyWithImpl(
      _$_CreatedBy _value, $Res Function(_$_CreatedBy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? fullName = freezed,
    Object? profileImage = freezed,
  }) {
    return _then(_$_CreatedBy(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreatedBy implements _CreatedBy {
  const _$_CreatedBy(
      {this.id,
      @JsonKey(name: 'full_name') this.fullName,
      @JsonKey(name: 'profile_image') this.profileImage});

  factory _$_CreatedBy.fromJson(Map<String, dynamic> json) =>
      _$$_CreatedByFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'full_name')
  final String? fullName;
  @override
  @JsonKey(name: 'profile_image')
  final dynamic profileImage;

  @override
  String toString() {
    return 'CreatedBy(id: $id, fullName: $fullName, profileImage: $profileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatedBy &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            const DeepCollectionEquality()
                .equals(other.profileImage, profileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName,
      const DeepCollectionEquality().hash(profileImage));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      __$$_CreatedByCopyWithImpl<_$_CreatedBy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreatedByToJson(
      this,
    );
  }
}

abstract class _CreatedBy implements CreatedBy {
  const factory _CreatedBy(
          {final String? id,
          @JsonKey(name: 'full_name') final String? fullName,
          @JsonKey(name: 'profile_image') final dynamic profileImage}) =
      _$_CreatedBy;

  factory _CreatedBy.fromJson(Map<String, dynamic> json) =
      _$_CreatedBy.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'full_name')
  String? get fullName;
  @override
  @JsonKey(name: 'profile_image')
  dynamic get profileImage;
  @override
  @JsonKey(ignore: true)
  _$$_CreatedByCopyWith<_$_CreatedBy> get copyWith =>
      throw _privateConstructorUsedError;
}
