// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OfferModel _$OfferModelFromJson(Map<String, dynamic> json) {
  return _OfferModel.fromJson(json);
}

/// @nodoc
mixin _$OfferModel {
  @JsonKey(name: "total_pages")
  int? get totalPages => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get current => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  @JsonKey(name: "page_size")
  int? get pageSize => throw _privateConstructorUsedError;
  @JsonKey(name: "result")
  List<Result>? get result => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferModelCopyWith<OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferModelCopyWith<$Res> {
  factory $OfferModelCopyWith(
          OfferModel value, $Res Function(OfferModel) then) =
      _$OfferModelCopyWithImpl<$Res, OfferModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Result>? result});
}

/// @nodoc
class _$OfferModelCopyWithImpl<$Res, $Val extends OfferModel>
    implements $OfferModelCopyWith<$Res> {
  _$OfferModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_OfferModelCopyWith<$Res>
    implements $OfferModelCopyWith<$Res> {
  factory _$$_OfferModelCopyWith(
          _$_OfferModel value, $Res Function(_$_OfferModel) then) =
      __$$_OfferModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "total_pages") int? totalPages,
      int? count,
      int? current,
      String? next,
      String? previous,
      @JsonKey(name: "page_size") int? pageSize,
      @JsonKey(name: "result") List<Result>? result});
}

/// @nodoc
class __$$_OfferModelCopyWithImpl<$Res>
    extends _$OfferModelCopyWithImpl<$Res, _$_OfferModel>
    implements _$$_OfferModelCopyWith<$Res> {
  __$$_OfferModelCopyWithImpl(
      _$_OfferModel _value, $Res Function(_$_OfferModel) _then)
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
    return _then(_$_OfferModel(
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
class _$_OfferModel implements _OfferModel {
  const _$_OfferModel(
      {@JsonKey(name: "total_pages") this.totalPages,
      this.count,
      this.current,
      this.next,
      this.previous,
      @JsonKey(name: "page_size") this.pageSize,
      @JsonKey(name: "result") final List<Result>? result})
      : _result = result;

  factory _$_OfferModel.fromJson(Map<String, dynamic> json) =>
      _$$_OfferModelFromJson(json);

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
  @JsonKey(name: "result")
  List<Result>? get result {
    final value = _result;
    if (value == null) return null;
    if (_result is EqualUnmodifiableListView) return _result;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'OfferModel(totalPages: $totalPages, count: $count, current: $current, next: $next, previous: $previous, pageSize: $pageSize, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferModel &&
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
  _$$_OfferModelCopyWith<_$_OfferModel> get copyWith =>
      __$$_OfferModelCopyWithImpl<_$_OfferModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferModelToJson(
      this,
    );
  }
}

abstract class _OfferModel implements OfferModel {
  const factory _OfferModel(
      {@JsonKey(name: "total_pages") final int? totalPages,
      final int? count,
      final int? current,
      final String? next,
      final String? previous,
      @JsonKey(name: "page_size") final int? pageSize,
      @JsonKey(name: "result") final List<Result>? result}) = _$_OfferModel;

  factory _OfferModel.fromJson(Map<String, dynamic> json) =
      _$_OfferModel.fromJson;

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
  @JsonKey(name: "result")
  List<Result>? get result;
  @override
  @JsonKey(ignore: true)
  _$$_OfferModelCopyWith<_$_OfferModel> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  int? get id => throw _privateConstructorUsedError;
  List<Service>? get services => throw _privateConstructorUsedError;
  @JsonKey(name: "entity_services")
  List<EntityService>? get entityServices => throw _privateConstructorUsedError;
  List<Category>? get categories => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get merchant => throw _privateConstructorUsedError;
  Country? get country => throw _privateConstructorUsedError;
  @JsonKey(name: "free")
  Free? get free => throw _privateConstructorUsedError;
  @JsonKey(name: "offer_rule")
  OfferRule? get offerRule => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "offer_type")
  String? get offerType => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  DateTime? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "is_consumable")
  bool? get isConsumable => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_type")
  String? get discountType => throw _privateConstructorUsedError;
  @JsonKey(name: "discount_limit")
  double? get discountLimit => throw _privateConstructorUsedError;
  dynamic get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: "is_common")
  bool? get isCommon => throw _privateConstructorUsedError;
  List<dynamic>? get organizations => throw _privateConstructorUsedError;
  List<String>? get redeems => throw _privateConstructorUsedError;

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
      List<Service>? services,
      @JsonKey(name: "entity_services") List<EntityService>? entityServices,
      List<Category>? categories,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? merchant,
      Country? country,
      @JsonKey(name: "free") Free? free,
      @JsonKey(name: "offer_rule") OfferRule? offerRule,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "is_active") bool? isActive,
      String? title,
      String? description,
      @JsonKey(name: "offer_type") String? offerType,
      String? code,
      String? image,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "is_consumable") bool? isConsumable,
      double? discount,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "discount_limit") double? discountLimit,
      dynamic quantity,
      @JsonKey(name: "is_common") bool? isCommon,
      List<dynamic>? organizations,
      List<String>? redeems});

  $CreatedByCopyWith<$Res>? get createdBy;
  $CountryCopyWith<$Res>? get country;
  $FreeCopyWith<$Res>? get free;
  $OfferRuleCopyWith<$Res>? get offerRule;
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
    Object? services = freezed,
    Object? entityServices = freezed,
    Object? categories = freezed,
    Object? createdBy = freezed,
    Object? merchant = freezed,
    Object? country = freezed,
    Object? free = freezed,
    Object? offerRule = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? offerType = freezed,
    Object? code = freezed,
    Object? image = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isConsumable = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountLimit = freezed,
    Object? quantity = freezed,
    Object? isCommon = freezed,
    Object? organizations = freezed,
    Object? redeems = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value.services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      entityServices: freezed == entityServices
          ? _value.entityServices
          : entityServices // ignore: cast_nullable_to_non_nullable
              as List<EntityService>?,
      categories: freezed == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      free: freezed == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as Free?,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as OfferRule?,
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
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isConsumable: freezed == isConsumable
          ? _value.isConsumable
          : isConsumable // ignore: cast_nullable_to_non_nullable
              as bool?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountLimit: freezed == discountLimit
          ? _value.discountLimit
          : discountLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isCommon: freezed == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizations: freezed == organizations
          ? _value.organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      redeems: freezed == redeems
          ? _value.redeems
          : redeems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
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

  @override
  @pragma('vm:prefer-inline')
  $FreeCopyWith<$Res>? get free {
    if (_value.free == null) {
      return null;
    }

    return $FreeCopyWith<$Res>(_value.free!, (value) {
      return _then(_value.copyWith(free: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OfferRuleCopyWith<$Res>? get offerRule {
    if (_value.offerRule == null) {
      return null;
    }

    return $OfferRuleCopyWith<$Res>(_value.offerRule!, (value) {
      return _then(_value.copyWith(offerRule: value) as $Val);
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
      List<Service>? services,
      @JsonKey(name: "entity_services") List<EntityService>? entityServices,
      List<Category>? categories,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? merchant,
      Country? country,
      @JsonKey(name: "free") Free? free,
      @JsonKey(name: "offer_rule") OfferRule? offerRule,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "updated_at") DateTime? updatedAt,
      @JsonKey(name: "is_active") bool? isActive,
      String? title,
      String? description,
      @JsonKey(name: "offer_type") String? offerType,
      String? code,
      String? image,
      @JsonKey(name: "start_date") DateTime? startDate,
      @JsonKey(name: "end_date") DateTime? endDate,
      @JsonKey(name: "is_consumable") bool? isConsumable,
      double? discount,
      @JsonKey(name: "discount_type") String? discountType,
      @JsonKey(name: "discount_limit") double? discountLimit,
      dynamic quantity,
      @JsonKey(name: "is_common") bool? isCommon,
      List<dynamic>? organizations,
      List<String>? redeems});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $CountryCopyWith<$Res>? get country;
  @override
  $FreeCopyWith<$Res>? get free;
  @override
  $OfferRuleCopyWith<$Res>? get offerRule;
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
    Object? services = freezed,
    Object? entityServices = freezed,
    Object? categories = freezed,
    Object? createdBy = freezed,
    Object? merchant = freezed,
    Object? country = freezed,
    Object? free = freezed,
    Object? offerRule = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? isActive = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? offerType = freezed,
    Object? code = freezed,
    Object? image = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? isConsumable = freezed,
    Object? discount = freezed,
    Object? discountType = freezed,
    Object? discountLimit = freezed,
    Object? quantity = freezed,
    Object? isCommon = freezed,
    Object? organizations = freezed,
    Object? redeems = freezed,
  }) {
    return _then(_$_Result(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      services: freezed == services
          ? _value._services
          : services // ignore: cast_nullable_to_non_nullable
              as List<Service>?,
      entityServices: freezed == entityServices
          ? _value._entityServices
          : entityServices // ignore: cast_nullable_to_non_nullable
              as List<EntityService>?,
      categories: freezed == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      merchant: freezed == merchant
          ? _value.merchant
          : merchant // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country?,
      free: freezed == free
          ? _value.free
          : free // ignore: cast_nullable_to_non_nullable
              as Free?,
      offerRule: freezed == offerRule
          ? _value.offerRule
          : offerRule // ignore: cast_nullable_to_non_nullable
              as OfferRule?,
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
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      offerType: freezed == offerType
          ? _value.offerType
          : offerType // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isConsumable: freezed == isConsumable
          ? _value.isConsumable
          : isConsumable // ignore: cast_nullable_to_non_nullable
              as bool?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      discountType: freezed == discountType
          ? _value.discountType
          : discountType // ignore: cast_nullable_to_non_nullable
              as String?,
      discountLimit: freezed == discountLimit
          ? _value.discountLimit
          : discountLimit // ignore: cast_nullable_to_non_nullable
              as double?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isCommon: freezed == isCommon
          ? _value.isCommon
          : isCommon // ignore: cast_nullable_to_non_nullable
              as bool?,
      organizations: freezed == organizations
          ? _value._organizations
          : organizations // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      redeems: freezed == redeems
          ? _value._redeems
          : redeems // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Result implements _Result {
  const _$_Result(
      {this.id,
      final List<Service>? services,
      @JsonKey(name: "entity_services")
          final List<EntityService>? entityServices,
      final List<Category>? categories,
      @JsonKey(name: "created_by")
          this.createdBy,
      this.merchant,
      this.country,
      @JsonKey(name: "free")
          this.free,
      @JsonKey(name: "offer_rule")
          this.offerRule,
      @JsonKey(name: "created_at")
          this.createdAt,
      @JsonKey(name: "updated_at")
          this.updatedAt,
      @JsonKey(name: "is_active")
          this.isActive,
      this.title,
      this.description,
      @JsonKey(name: "offer_type")
          this.offerType,
      this.code,
      this.image,
      @JsonKey(name: "start_date")
          this.startDate,
      @JsonKey(name: "end_date")
          this.endDate,
      @JsonKey(name: "is_consumable")
          this.isConsumable,
      this.discount,
      @JsonKey(name: "discount_type")
          this.discountType,
      @JsonKey(name: "discount_limit")
          this.discountLimit,
      this.quantity,
      @JsonKey(name: "is_common")
          this.isCommon,
      final List<dynamic>? organizations,
      final List<String>? redeems})
      : _services = services,
        _entityServices = entityServices,
        _categories = categories,
        _organizations = organizations,
        _redeems = redeems;

  factory _$_Result.fromJson(Map<String, dynamic> json) =>
      _$$_ResultFromJson(json);

  @override
  final int? id;
  final List<Service>? _services;
  @override
  List<Service>? get services {
    final value = _services;
    if (value == null) return null;
    if (_services is EqualUnmodifiableListView) return _services;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<EntityService>? _entityServices;
  @override
  @JsonKey(name: "entity_services")
  List<EntityService>? get entityServices {
    final value = _entityServices;
    if (value == null) return null;
    if (_entityServices is EqualUnmodifiableListView) return _entityServices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Category>? _categories;
  @override
  List<Category>? get categories {
    final value = _categories;
    if (value == null) return null;
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @override
  final String? merchant;
  @override
  final Country? country;
  @override
  @JsonKey(name: "free")
  final Free? free;
  @override
  @JsonKey(name: "offer_rule")
  final OfferRule? offerRule;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "offer_type")
  final String? offerType;
  @override
  final String? code;
  @override
  final String? image;
  @override
  @JsonKey(name: "start_date")
  final DateTime? startDate;
  @override
  @JsonKey(name: "end_date")
  final DateTime? endDate;
  @override
  @JsonKey(name: "is_consumable")
  final bool? isConsumable;
  @override
  final double? discount;
  @override
  @JsonKey(name: "discount_type")
  final String? discountType;
  @override
  @JsonKey(name: "discount_limit")
  final double? discountLimit;
  @override
  final dynamic quantity;
  @override
  @JsonKey(name: "is_common")
  final bool? isCommon;
  final List<dynamic>? _organizations;
  @override
  List<dynamic>? get organizations {
    final value = _organizations;
    if (value == null) return null;
    if (_organizations is EqualUnmodifiableListView) return _organizations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _redeems;
  @override
  List<String>? get redeems {
    final value = _redeems;
    if (value == null) return null;
    if (_redeems is EqualUnmodifiableListView) return _redeems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Result(id: $id, services: $services, entityServices: $entityServices, categories: $categories, createdBy: $createdBy, merchant: $merchant, country: $country, free: $free, offerRule: $offerRule, createdAt: $createdAt, updatedAt: $updatedAt, isActive: $isActive, title: $title, description: $description, offerType: $offerType, code: $code, image: $image, startDate: $startDate, endDate: $endDate, isConsumable: $isConsumable, discount: $discount, discountType: $discountType, discountLimit: $discountLimit, quantity: $quantity, isCommon: $isCommon, organizations: $organizations, redeems: $redeems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Result &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._services, _services) &&
            const DeepCollectionEquality()
                .equals(other._entityServices, _entityServices) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.merchant, merchant) ||
                other.merchant == merchant) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.offerRule, offerRule) ||
                other.offerRule == offerRule) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.offerType, offerType) ||
                other.offerType == offerType) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.isConsumable, isConsumable) ||
                other.isConsumable == isConsumable) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.discountType, discountType) ||
                other.discountType == discountType) &&
            (identical(other.discountLimit, discountLimit) ||
                other.discountLimit == discountLimit) &&
            const DeepCollectionEquality().equals(other.quantity, quantity) &&
            (identical(other.isCommon, isCommon) ||
                other.isCommon == isCommon) &&
            const DeepCollectionEquality()
                .equals(other._organizations, _organizations) &&
            const DeepCollectionEquality().equals(other._redeems, _redeems));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        const DeepCollectionEquality().hash(_services),
        const DeepCollectionEquality().hash(_entityServices),
        const DeepCollectionEquality().hash(_categories),
        createdBy,
        merchant,
        country,
        free,
        offerRule,
        createdAt,
        updatedAt,
        isActive,
        title,
        description,
        offerType,
        code,
        image,
        startDate,
        endDate,
        isConsumable,
        discount,
        discountType,
        discountLimit,
        const DeepCollectionEquality().hash(quantity),
        isCommon,
        const DeepCollectionEquality().hash(_organizations),
        const DeepCollectionEquality().hash(_redeems)
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
      final List<Service>? services,
      @JsonKey(name: "entity_services")
          final List<EntityService>? entityServices,
      final List<Category>? categories,
      @JsonKey(name: "created_by")
          final CreatedBy? createdBy,
      final String? merchant,
      final Country? country,
      @JsonKey(name: "free")
          final Free? free,
      @JsonKey(name: "offer_rule")
          final OfferRule? offerRule,
      @JsonKey(name: "created_at")
          final DateTime? createdAt,
      @JsonKey(name: "updated_at")
          final DateTime? updatedAt,
      @JsonKey(name: "is_active")
          final bool? isActive,
      final String? title,
      final String? description,
      @JsonKey(name: "offer_type")
          final String? offerType,
      final String? code,
      final String? image,
      @JsonKey(name: "start_date")
          final DateTime? startDate,
      @JsonKey(name: "end_date")
          final DateTime? endDate,
      @JsonKey(name: "is_consumable")
          final bool? isConsumable,
      final double? discount,
      @JsonKey(name: "discount_type")
          final String? discountType,
      @JsonKey(name: "discount_limit")
          final double? discountLimit,
      final dynamic quantity,
      @JsonKey(name: "is_common")
          final bool? isCommon,
      final List<dynamic>? organizations,
      final List<String>? redeems}) = _$_Result;

  factory _Result.fromJson(Map<String, dynamic> json) = _$_Result.fromJson;

  @override
  int? get id;
  @override
  List<Service>? get services;
  @override
  @JsonKey(name: "entity_services")
  List<EntityService>? get entityServices;
  @override
  List<Category>? get categories;
  @override
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy;
  @override
  String? get merchant;
  @override
  Country? get country;
  @override
  @JsonKey(name: "free")
  Free? get free;
  @override
  @JsonKey(name: "offer_rule")
  OfferRule? get offerRule;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "updated_at")
  DateTime? get updatedAt;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "offer_type")
  String? get offerType;
  @override
  String? get code;
  @override
  String? get image;
  @override
  @JsonKey(name: "start_date")
  DateTime? get startDate;
  @override
  @JsonKey(name: "end_date")
  DateTime? get endDate;
  @override
  @JsonKey(name: "is_consumable")
  bool? get isConsumable;
  @override
  double? get discount;
  @override
  @JsonKey(name: "discount_type")
  String? get discountType;
  @override
  @JsonKey(name: "discount_limit")
  double? get discountLimit;
  @override
  dynamic get quantity;
  @override
  @JsonKey(name: "is_common")
  bool? get isCommon;
  @override
  List<dynamic>? get organizations;
  @override
  List<String>? get redeems;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCopyWith<_$_Result> get copyWith =>
      throw _privateConstructorUsedError;
}

OfferRule _$OfferRuleFromJson(Map<String, dynamic> json) {
  return _OfferRule.fromJson(json);
}

/// @nodoc
mixin _$OfferRule {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "is_active")
  bool? get isActive => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: "has_discount")
  bool? get hasDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: "has_free_items")
  bool? get hasFreeItems => throw _privateConstructorUsedError;
  @JsonKey(name: "has_quantity")
  bool? get hasQuantity => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfferRuleCopyWith<OfferRule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfferRuleCopyWith<$Res> {
  factory $OfferRuleCopyWith(OfferRule value, $Res Function(OfferRule) then) =
      _$OfferRuleCopyWithImpl<$Res, OfferRule>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "is_active") bool? isActive,
      String? title,
      String? description,
      @JsonKey(name: "has_discount") bool? hasDiscount,
      @JsonKey(name: "has_free_items") bool? hasFreeItems,
      @JsonKey(name: "has_quantity") bool? hasQuantity});
}

/// @nodoc
class _$OfferRuleCopyWithImpl<$Res, $Val extends OfferRule>
    implements $OfferRuleCopyWith<$Res> {
  _$OfferRuleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isActive = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? hasDiscount = freezed,
    Object? hasFreeItems = freezed,
    Object? hasQuantity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDiscount: freezed == hasDiscount
          ? _value.hasDiscount
          : hasDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasFreeItems: freezed == hasFreeItems
          ? _value.hasFreeItems
          : hasFreeItems // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasQuantity: freezed == hasQuantity
          ? _value.hasQuantity
          : hasQuantity // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OfferRuleCopyWith<$Res> implements $OfferRuleCopyWith<$Res> {
  factory _$$_OfferRuleCopyWith(
          _$_OfferRule value, $Res Function(_$_OfferRule) then) =
      __$$_OfferRuleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: "is_active") bool? isActive,
      String? title,
      String? description,
      @JsonKey(name: "has_discount") bool? hasDiscount,
      @JsonKey(name: "has_free_items") bool? hasFreeItems,
      @JsonKey(name: "has_quantity") bool? hasQuantity});
}

/// @nodoc
class __$$_OfferRuleCopyWithImpl<$Res>
    extends _$OfferRuleCopyWithImpl<$Res, _$_OfferRule>
    implements _$$_OfferRuleCopyWith<$Res> {
  __$$_OfferRuleCopyWithImpl(
      _$_OfferRule _value, $Res Function(_$_OfferRule) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? isActive = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? hasDiscount = freezed,
    Object? hasFreeItems = freezed,
    Object? hasQuantity = freezed,
  }) {
    return _then(_$_OfferRule(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      hasDiscount: freezed == hasDiscount
          ? _value.hasDiscount
          : hasDiscount // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasFreeItems: freezed == hasFreeItems
          ? _value.hasFreeItems
          : hasFreeItems // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasQuantity: freezed == hasQuantity
          ? _value.hasQuantity
          : hasQuantity // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OfferRule implements _OfferRule {
  const _$_OfferRule(
      {this.id,
      @JsonKey(name: "is_active") this.isActive,
      this.title,
      this.description,
      @JsonKey(name: "has_discount") this.hasDiscount,
      @JsonKey(name: "has_free_items") this.hasFreeItems,
      @JsonKey(name: "has_quantity") this.hasQuantity});

  factory _$_OfferRule.fromJson(Map<String, dynamic> json) =>
      _$$_OfferRuleFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: "is_active")
  final bool? isActive;
  @override
  final String? title;
  @override
  final String? description;
  @override
  @JsonKey(name: "has_discount")
  final bool? hasDiscount;
  @override
  @JsonKey(name: "has_free_items")
  final bool? hasFreeItems;
  @override
  @JsonKey(name: "has_quantity")
  final bool? hasQuantity;

  @override
  String toString() {
    return 'OfferRule(id: $id, isActive: $isActive, title: $title, description: $description, hasDiscount: $hasDiscount, hasFreeItems: $hasFreeItems, hasQuantity: $hasQuantity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OfferRule &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.hasDiscount, hasDiscount) ||
                other.hasDiscount == hasDiscount) &&
            (identical(other.hasFreeItems, hasFreeItems) ||
                other.hasFreeItems == hasFreeItems) &&
            (identical(other.hasQuantity, hasQuantity) ||
                other.hasQuantity == hasQuantity));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, isActive, title, description,
      hasDiscount, hasFreeItems, hasQuantity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OfferRuleCopyWith<_$_OfferRule> get copyWith =>
      __$$_OfferRuleCopyWithImpl<_$_OfferRule>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OfferRuleToJson(
      this,
    );
  }
}

abstract class _OfferRule implements OfferRule {
  const factory _OfferRule(
      {final int? id,
      @JsonKey(name: "is_active") final bool? isActive,
      final String? title,
      final String? description,
      @JsonKey(name: "has_discount") final bool? hasDiscount,
      @JsonKey(name: "has_free_items") final bool? hasFreeItems,
      @JsonKey(name: "has_quantity") final bool? hasQuantity}) = _$_OfferRule;

  factory _OfferRule.fromJson(Map<String, dynamic> json) =
      _$_OfferRule.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: "is_active")
  bool? get isActive;
  @override
  String? get title;
  @override
  String? get description;
  @override
  @JsonKey(name: "has_discount")
  bool? get hasDiscount;
  @override
  @JsonKey(name: "has_free_items")
  bool? get hasFreeItems;
  @override
  @JsonKey(name: "has_quantity")
  bool? get hasQuantity;
  @override
  @JsonKey(ignore: true)
  _$$_OfferRuleCopyWith<_$_OfferRule> get copyWith =>
      throw _privateConstructorUsedError;
}

Free _$FreeFromJson(Map<String, dynamic> json) {
  return _Free.fromJson(json);
}

/// @nodoc
mixin _$Free {
  String? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  Currency? get currency => throw _privateConstructorUsedError;
  City? get city => throw _privateConstructorUsedError;
  @JsonKey(name: "is_online")
  bool? get isOnline => throw _privateConstructorUsedError;
  Service? get service => throw _privateConstructorUsedError;
  List<Image>? get images => throw _privateConstructorUsedError;
  List<Rating>? get rating => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_type")
  String? get budgetType => throw _privateConstructorUsedError;
  @JsonKey(name: "is_requested")
  bool? get isRequested => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_from")
  String? get budgetFrom => throw _privateConstructorUsedError;
  @JsonKey(name: "budget_to")
  String? get budgetTo => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed => throw _privateConstructorUsedError;
  @JsonKey(name: "start_date")
  dynamic get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: "end_date")
  dynamic get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: "start_time")
  dynamic get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: "end_time")
  dynamic get endTime => throw _privateConstructorUsedError;
  List<Image>? get videos => throw _privateConstructorUsedError;
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreeCopyWith<Free> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreeCopyWith<$Res> {
  factory $FreeCopyWith(Free value, $Res Function(Free) then) =
      _$FreeCopyWithImpl<$Res, Free>;
  @useResult
  $Res call(
      {String? id,
      String? slug,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? title,
      Currency? currency,
      City? city,
      @JsonKey(name: "is_online") bool? isOnline,
      Service? service,
      List<Image>? images,
      List<Rating>? rating,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      @JsonKey(name: "start_date") dynamic startDate,
      @JsonKey(name: "end_date") dynamic endDate,
      @JsonKey(name: "start_time") dynamic startTime,
      @JsonKey(name: "end_time") dynamic endTime,
      List<Image>? videos,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked});

  $CreatedByCopyWith<$Res>? get createdBy;
  $CurrencyCopyWith<$Res>? get currency;
  $CityCopyWith<$Res>? get city;
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class _$FreeCopyWithImpl<$Res, $Val extends Free>
    implements $FreeCopyWith<$Res> {
  _$FreeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? rating = freezed,
    Object? budgetType = freezed,
    Object? isRequested = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? location = freezed,
    Object? count = freezed,
    Object? isEndorsed = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? videos = freezed,
    Object? isBookmarked = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videos: freezed == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
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
}

/// @nodoc
abstract class _$$_FreeCopyWith<$Res> implements $FreeCopyWith<$Res> {
  factory _$$_FreeCopyWith(_$_Free value, $Res Function(_$_Free) then) =
      __$$_FreeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? slug,
      @JsonKey(name: "created_at") DateTime? createdAt,
      @JsonKey(name: "created_by") CreatedBy? createdBy,
      String? title,
      Currency? currency,
      City? city,
      @JsonKey(name: "is_online") bool? isOnline,
      Service? service,
      List<Image>? images,
      List<Rating>? rating,
      @JsonKey(name: "budget_type") String? budgetType,
      @JsonKey(name: "is_requested") bool? isRequested,
      @JsonKey(name: "budget_from") String? budgetFrom,
      @JsonKey(name: "budget_to") String? budgetTo,
      String? location,
      int? count,
      @JsonKey(name: "is_endorsed") bool? isEndorsed,
      @JsonKey(name: "start_date") dynamic startDate,
      @JsonKey(name: "end_date") dynamic endDate,
      @JsonKey(name: "start_time") dynamic startTime,
      @JsonKey(name: "end_time") dynamic endTime,
      List<Image>? videos,
      @JsonKey(name: "is_bookmarked") bool? isBookmarked});

  @override
  $CreatedByCopyWith<$Res>? get createdBy;
  @override
  $CurrencyCopyWith<$Res>? get currency;
  @override
  $CityCopyWith<$Res>? get city;
  @override
  $ServiceCopyWith<$Res>? get service;
}

/// @nodoc
class __$$_FreeCopyWithImpl<$Res> extends _$FreeCopyWithImpl<$Res, _$_Free>
    implements _$$_FreeCopyWith<$Res> {
  __$$_FreeCopyWithImpl(_$_Free _value, $Res Function(_$_Free) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? createdAt = freezed,
    Object? createdBy = freezed,
    Object? title = freezed,
    Object? currency = freezed,
    Object? city = freezed,
    Object? isOnline = freezed,
    Object? service = freezed,
    Object? images = freezed,
    Object? rating = freezed,
    Object? budgetType = freezed,
    Object? isRequested = freezed,
    Object? budgetFrom = freezed,
    Object? budgetTo = freezed,
    Object? location = freezed,
    Object? count = freezed,
    Object? isEndorsed = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? videos = freezed,
    Object? isBookmarked = freezed,
  }) {
    return _then(_$_Free(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as CreatedBy?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as City?,
      isOnline: freezed == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      service: freezed == service
          ? _value.service
          : service // ignore: cast_nullable_to_non_nullable
              as Service?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      rating: freezed == rating
          ? _value._rating
          : rating // ignore: cast_nullable_to_non_nullable
              as List<Rating>?,
      budgetType: freezed == budgetType
          ? _value.budgetType
          : budgetType // ignore: cast_nullable_to_non_nullable
              as String?,
      isRequested: freezed == isRequested
          ? _value.isRequested
          : isRequested // ignore: cast_nullable_to_non_nullable
              as bool?,
      budgetFrom: freezed == budgetFrom
          ? _value.budgetFrom
          : budgetFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      budgetTo: freezed == budgetTo
          ? _value.budgetTo
          : budgetTo // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      isEndorsed: freezed == isEndorsed
          ? _value.isEndorsed
          : isEndorsed // ignore: cast_nullable_to_non_nullable
              as bool?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as dynamic,
      videos: freezed == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Image>?,
      isBookmarked: freezed == isBookmarked
          ? _value.isBookmarked
          : isBookmarked // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Free implements _Free {
  const _$_Free(
      {this.id,
      this.slug,
      @JsonKey(name: "created_at") this.createdAt,
      @JsonKey(name: "created_by") this.createdBy,
      this.title,
      this.currency,
      this.city,
      @JsonKey(name: "is_online") this.isOnline,
      this.service,
      final List<Image>? images,
      final List<Rating>? rating,
      @JsonKey(name: "budget_type") this.budgetType,
      @JsonKey(name: "is_requested") this.isRequested,
      @JsonKey(name: "budget_from") this.budgetFrom,
      @JsonKey(name: "budget_to") this.budgetTo,
      this.location,
      this.count,
      @JsonKey(name: "is_endorsed") this.isEndorsed,
      @JsonKey(name: "start_date") this.startDate,
      @JsonKey(name: "end_date") this.endDate,
      @JsonKey(name: "start_time") this.startTime,
      @JsonKey(name: "end_time") this.endTime,
      final List<Image>? videos,
      @JsonKey(name: "is_bookmarked") this.isBookmarked})
      : _images = images,
        _rating = rating,
        _videos = videos;

  factory _$_Free.fromJson(Map<String, dynamic> json) => _$$_FreeFromJson(json);

  @override
  final String? id;
  @override
  final String? slug;
  @override
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @override
  @JsonKey(name: "created_by")
  final CreatedBy? createdBy;
  @override
  final String? title;
  @override
  final Currency? currency;
  @override
  final City? city;
  @override
  @JsonKey(name: "is_online")
  final bool? isOnline;
  @override
  final Service? service;
  final List<Image>? _images;
  @override
  List<Image>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Rating>? _rating;
  @override
  List<Rating>? get rating {
    final value = _rating;
    if (value == null) return null;
    if (_rating is EqualUnmodifiableListView) return _rating;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: "budget_type")
  final String? budgetType;
  @override
  @JsonKey(name: "is_requested")
  final bool? isRequested;
  @override
  @JsonKey(name: "budget_from")
  final String? budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  final String? budgetTo;
  @override
  final String? location;
  @override
  final int? count;
  @override
  @JsonKey(name: "is_endorsed")
  final bool? isEndorsed;
  @override
  @JsonKey(name: "start_date")
  final dynamic startDate;
  @override
  @JsonKey(name: "end_date")
  final dynamic endDate;
  @override
  @JsonKey(name: "start_time")
  final dynamic startTime;
  @override
  @JsonKey(name: "end_time")
  final dynamic endTime;
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
  @JsonKey(name: "is_bookmarked")
  final bool? isBookmarked;

  @override
  String toString() {
    return 'Free(id: $id, slug: $slug, createdAt: $createdAt, createdBy: $createdBy, title: $title, currency: $currency, city: $city, isOnline: $isOnline, service: $service, images: $images, rating: $rating, budgetType: $budgetType, isRequested: $isRequested, budgetFrom: $budgetFrom, budgetTo: $budgetTo, location: $location, count: $count, isEndorsed: $isEndorsed, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, videos: $videos, isBookmarked: $isBookmarked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Free &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.service, service) || other.service == service) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            const DeepCollectionEquality().equals(other._rating, _rating) &&
            (identical(other.budgetType, budgetType) ||
                other.budgetType == budgetType) &&
            (identical(other.isRequested, isRequested) ||
                other.isRequested == isRequested) &&
            (identical(other.budgetFrom, budgetFrom) ||
                other.budgetFrom == budgetFrom) &&
            (identical(other.budgetTo, budgetTo) ||
                other.budgetTo == budgetTo) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.isEndorsed, isEndorsed) ||
                other.isEndorsed == isEndorsed) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.startTime, startTime) &&
            const DeepCollectionEquality().equals(other.endTime, endTime) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            (identical(other.isBookmarked, isBookmarked) ||
                other.isBookmarked == isBookmarked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        slug,
        createdAt,
        createdBy,
        title,
        currency,
        city,
        isOnline,
        service,
        const DeepCollectionEquality().hash(_images),
        const DeepCollectionEquality().hash(_rating),
        budgetType,
        isRequested,
        budgetFrom,
        budgetTo,
        location,
        count,
        isEndorsed,
        const DeepCollectionEquality().hash(startDate),
        const DeepCollectionEquality().hash(endDate),
        const DeepCollectionEquality().hash(startTime),
        const DeepCollectionEquality().hash(endTime),
        const DeepCollectionEquality().hash(_videos),
        isBookmarked
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreeCopyWith<_$_Free> get copyWith =>
      __$$_FreeCopyWithImpl<_$_Free>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FreeToJson(
      this,
    );
  }
}

abstract class _Free implements Free {
  const factory _Free(
      {final String? id,
      final String? slug,
      @JsonKey(name: "created_at") final DateTime? createdAt,
      @JsonKey(name: "created_by") final CreatedBy? createdBy,
      final String? title,
      final Currency? currency,
      final City? city,
      @JsonKey(name: "is_online") final bool? isOnline,
      final Service? service,
      final List<Image>? images,
      final List<Rating>? rating,
      @JsonKey(name: "budget_type") final String? budgetType,
      @JsonKey(name: "is_requested") final bool? isRequested,
      @JsonKey(name: "budget_from") final String? budgetFrom,
      @JsonKey(name: "budget_to") final String? budgetTo,
      final String? location,
      final int? count,
      @JsonKey(name: "is_endorsed") final bool? isEndorsed,
      @JsonKey(name: "start_date") final dynamic startDate,
      @JsonKey(name: "end_date") final dynamic endDate,
      @JsonKey(name: "start_time") final dynamic startTime,
      @JsonKey(name: "end_time") final dynamic endTime,
      final List<Image>? videos,
      @JsonKey(name: "is_bookmarked") final bool? isBookmarked}) = _$_Free;

  factory _Free.fromJson(Map<String, dynamic> json) = _$_Free.fromJson;

  @override
  String? get id;
  @override
  String? get slug;
  @override
  @JsonKey(name: "created_at")
  DateTime? get createdAt;
  @override
  @JsonKey(name: "created_by")
  CreatedBy? get createdBy;
  @override
  String? get title;
  @override
  Currency? get currency;
  @override
  City? get city;
  @override
  @JsonKey(name: "is_online")
  bool? get isOnline;
  @override
  Service? get service;
  @override
  List<Image>? get images;
  @override
  List<Rating>? get rating;
  @override
  @JsonKey(name: "budget_type")
  String? get budgetType;
  @override
  @JsonKey(name: "is_requested")
  bool? get isRequested;
  @override
  @JsonKey(name: "budget_from")
  String? get budgetFrom;
  @override
  @JsonKey(name: "budget_to")
  String? get budgetTo;
  @override
  String? get location;
  @override
  int? get count;
  @override
  @JsonKey(name: "is_endorsed")
  bool? get isEndorsed;
  @override
  @JsonKey(name: "start_date")
  dynamic get startDate;
  @override
  @JsonKey(name: "end_date")
  dynamic get endDate;
  @override
  @JsonKey(name: "start_time")
  dynamic get startTime;
  @override
  @JsonKey(name: "end_time")
  dynamic get endTime;
  @override
  List<Image>? get videos;
  @override
  @JsonKey(name: "is_bookmarked")
  bool? get isBookmarked;
  @override
  @JsonKey(ignore: true)
  _$$_FreeCopyWith<_$_Free> get copyWith => throw _privateConstructorUsedError;
}
