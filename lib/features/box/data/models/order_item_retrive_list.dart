import 'package:freezed_annotation/freezed_annotation.dart';
part 'order_item_retrive_list.freezed.dart';
part 'order_item_retrive_list.g.dart';

@freezed
class OrderItemRetriveList with _$OrderItemRetriveList {
  const factory OrderItemRetriveList({
    String? id,
    String? user,
    String? currency,
    String? status,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'order_item') List<OrderItem>? orderItem,
    @JsonKey(name: 'grand_total') double? grandTotal,
  }) = _OrderItemRetriveList;

  factory OrderItemRetriveList.fromJson(Map<String, dynamic> json) =>
      _$OrderItemRetriveListFromJson(json);
}

@freezed
class OrderItem with _$OrderItem {
  const factory OrderItem({
    String? id,
    Task? task,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    double? amount,
    double? tax,
    double? vat,
    @JsonKey(name: 'offer_value') double? offerValue,
    double? discount,
    @JsonKey(name: 'platform_charge') double? platformCharge,
    @JsonKey(name: 'platform_charge_discount') double? platformChargeDiscount,
    @JsonKey(name: 'equipment_charges') double? equipmentCharges,
    @JsonKey(name: 'revision_charges') double? revisionCharges,
    @JsonKey(name: 'other_charges') double? otherCharges,
    @JsonKey(name: 'other_discounts') double? otherDiscounts,
    @JsonKey(name: 'extra_data') ExtraData? extraData,
    @JsonKey(name: 'is_active') bool? isActive,
    String? order,
    dynamic offer,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
class ExtraData with _$ExtraData {
  const factory ExtraData() = _ExtraData;

  factory ExtraData.fromJson(Map<String, dynamic> json) =>
      _$ExtraDataFromJson(json);
}

@freezed
class Task with _$Task {
  const factory Task({
    String? id,
    String? title,
    int? booking,
    @JsonKey(name: 'entity_service') String? entityService,
    @JsonKey(name: 'entity_service_images') List<dynamic>? entityServiceImages,
    Assigne? assigner,
    Assigne? assignee,
    String? currency,
    String? location,
  }) = _Task;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

}

@freezed
class Assigne with _$Assigne {
  const factory Assigne({
    String? id,
    String? username,
    String? email,
    String? phone,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'profile_images') String? profileImage,
    String? bio,
    @JsonKey(name: 'created_at') String? createdAt,
    String? designation,
    @JsonKey(name: 'user_type') String? userType,
    @JsonKey(name: 'is_profile_verified') bool? isProfileVerified,
    @JsonKey(name: 'is_followed') bool? isFollowed,
    @JsonKey(name: 'is_following') bool? isFollowing,
    Badge? badge,
  }) = _Assigne;

  factory Assigne.fromJson(Map<String, dynamic> json) =>
      _$AssigneFromJson(json);
}

@freezed
class Badge with _$Badge {
  const factory Badge({
    int? id,
    String? image,
    String? title,
  }) = _Badge;

  factory Badge.fromJson(Map<String, dynamic> json) => _$BadgeFromJson(json);
}
