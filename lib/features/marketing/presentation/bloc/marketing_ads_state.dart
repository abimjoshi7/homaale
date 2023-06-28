part of 'marketing_ads_bloc.dart';

enum AdsState { initial, loading, success, failure }

class MarketingAdsState extends Equatable {
  final AdsState adsState;
  final MarketingAdsDto marketingAdsDto;

  MarketingAdsState({
    this.adsState = AdsState.initial,
    this.marketingAdsDto = const MarketingAdsDto(),
  });

  @override
  List<Object> get props => [adsState, marketingAdsDto];

  MarketingAdsState copyWith({
    AdsState? adsState,
    MarketingAdsDto? marketingAdsDto,
  }) {
    return MarketingAdsState(
      adsState: adsState ?? this.adsState,
      marketingAdsDto: marketingAdsDto ?? this.marketingAdsDto,
    );
  }
}
