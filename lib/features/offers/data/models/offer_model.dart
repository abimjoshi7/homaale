// ignore_for_file: invalid_annotation_target

import 'package:cipher/features/services/data/models/entity_service_model.dart';
import 'package:dependencies/dependencies.dart';

part 'offer_model.freezed.dart';
part 'offer_model.g.dart';

@freezed
class OfferModel with _$OfferModel {
  const factory OfferModel({
    @JsonKey(name: "total_pages") int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: "page_size") int? pageSize,
    @JsonKey(name: "result") List<Result>? result,
  }) = _OfferModel;

  factory OfferModel.fromJson(Map<String, dynamic> json) =>
      _$OfferModelFromJson(json);
}

@freezed
class Result with _$Result {
  const factory Result({
    int? id,
    List<Service>? services,
    @JsonKey(name: "entity_services") List<EntityService>? entityServices,
    List<Category>? categories,
    @JsonKey(name: "created_by") CreatedBy? createdBy,
    String? merchant,
    Country? country,
    @JsonKey(name: "free") ServiceElement? free,
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
    String? discount,
    @JsonKey(name: "discount_type") String? discountType,
    @JsonKey(name: "discount_limit") String? discountLimit,
    dynamic quantity,
    @JsonKey(name: "is_common") bool? isCommon,
    List<dynamic>? organizations,
    List<String>? redeems,
  }) = _Result;

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
}

@freezed
class OfferRule with _$OfferRule {
  const factory OfferRule({
    int? id,
    @JsonKey(name: "is_active") bool? isActive,
    String? title,
    String? description,
    @JsonKey(name: "has_discount") bool? hasDiscount,
    @JsonKey(name: "has_free_items") bool? hasFreeItems,
    @JsonKey(name: "has_quantity") bool? hasQuantity,
  }) = _OfferRule;

  factory OfferRule.fromJson(Map<String, dynamic> json) =>
      _$OfferRuleFromJson(json);
}

@freezed
class ServiceElement with _$ServiceElement {
  const factory ServiceElement({
    String? id,
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
    @JsonKey(name: "start_date") DateTime? startDate,
    @JsonKey(name: "end_date") DateTime? endDate,
    @JsonKey(name: "start_time") String? startTime,
    @JsonKey(name: "end_time") String? endTime,
    List<Image>? videos,
    @JsonKey(name: "is_bookmarked") bool? isBookmarked,
  }) = _ServiceElement;

  factory ServiceElement.fromJson(Map<String, dynamic> json) =>
      _$ServiceElementFromJson(json);
}
