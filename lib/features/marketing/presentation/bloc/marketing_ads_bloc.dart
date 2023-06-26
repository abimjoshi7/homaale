import 'dart:developer';

import 'package:cipher/features/marketing/data/models/marketing_ads_dto.dart';
import 'package:cipher/features/marketing/data/repositories/marketing_repository.dart';
import 'package:dependencies/dependencies.dart';

part 'marketing_ads_event.dart';
part 'marketing_ads_state.dart';

class MarketingAdsBloc extends Bloc<MarketingAdsEvent, MarketingAdsState> {
  final MarketingRepository marketingRepository;

  MarketingAdsBloc(this.marketingRepository) : super(MarketingAdsState()) {
    on<FetchMarketingAdsEvent>((event, emit) async {
      try {
        emit(state.copyWith(adsState: AdsState.loading));
        final res = await marketingRepository.fetchMarketingAds();
        if (res.result != null && res.result!.isNotEmpty) {
          emit(state.copyWith(
            adsState: AdsState.success,
            marketingAdsDto: res,
          ));
        }
      } catch (e) {
        emit(state.copyWith(adsState: AdsState.failure, marketingAdsDto: MarketingAdsDto()));
        log('Marketing ads error:  $e');
      }
    });
  }
}
