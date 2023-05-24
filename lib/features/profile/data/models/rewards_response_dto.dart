import 'package:dependencies/dependencies.dart';

part 'rewards_response_dto.freezed.dart';
part 'rewards_response_dto.g.dart';

@freezed
class RewardsResponseDto with _$RewardsResponseDto {
  const factory RewardsResponseDto({
    @JsonKey(name: 'total_pages') int? totalPages,
    int? count,
    int? current,
    String? next,
    String? previous,
    @JsonKey(name: 'page_size') int? pageSize,
    List<Rewards>? result,
  }) = _RewardsResponseDto;

  factory RewardsResponseDto.fromJson(Map<String, dynamic> json) => _$RewardsResponseDtoFromJson(json);
}

@freezed
class Rewards with _$Rewards {
  const factory Rewards({
    int? id,
    String? title,
    String? image,
    String? description,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    @JsonKey(name: 'offer_type') String? offerType,
    String? code,
    @JsonKey(name: 'offer_rule') String? offerRule,
    @JsonKey(name: 'redeem_points') int? redeemPoints,
  }) = _Rewards;

  factory Rewards.fromJson(Map<String, dynamic> json) => _$RewardsFromJson(json);
}
