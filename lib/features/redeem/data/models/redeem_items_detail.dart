
import 'package:freezed_annotation/freezed_annotation.dart';
part 'redeem_items_detail.freezed.dart';
part 'redeem_items_detail.g.dart';


@freezed
class RedeemItemsDetail with _$RedeemItemsDetail {
  const factory RedeemItemsDetail({
    int? id,
    String? title,
    String? image,
    String? description,
   @JsonKey(name: 'start_date') DateTime? startDate,
   @JsonKey(name: 'end_date') DateTime? endDate,
   @JsonKey(name: 'offer_type') String? offerType,
    dynamic code,
   @JsonKey(name: 'offer_rule') dynamic offerRule,
  @JsonKey(name: 'redeem_points')  int? redeemPoints,
  @JsonKey(name: 'entity_services')  List<EntityService>? entityServices,
  }) = _RedeemItemsDetail;

  factory RedeemItemsDetail.fromJson(Map<String, dynamic> json) => _$RedeemItemsDetailFromJson(json);
}

@freezed
class EntityService with _$EntityService {
  const factory EntityService({
    String? id,
    String? title,
    @JsonKey(name: 'created_by')CreatedBy? createdBy,
    List<dynamic>? images,
    String? description,
  }) = _EntityService;

  factory EntityService.fromJson(Map<String, dynamic> json) => _$EntityServiceFromJson(json);
}

@freezed
class CreatedBy with _$CreatedBy {
  const factory CreatedBy({
    String? id,
   @JsonKey(name: 'full_name') String? fullName,
  @JsonKey(name: 'profile_image')  dynamic profileImage,
  }) = _CreatedBy;

  factory CreatedBy.fromJson(Map<String, dynamic> json) => _$CreatedByFromJson(json);
}
