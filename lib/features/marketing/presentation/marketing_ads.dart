import 'package:cipher/core/carousel_slider/carousel_slider_helper.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class MarketingAds extends StatelessWidget {
  final List<Widget> defaultList;
  const MarketingAds({super.key, required this.defaultList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketingAdsBloc, MarketingAdsState>(
      builder: (context, state) {
        switch (state.adsState) {
          case AdsState.initial:
            return CarouselSliderHelper(
              list: defaultList,
              aspectRatio: 5,
              viewport: 1,
            );
          case AdsState.success:
            return CarouselSliderHelper(
              list: state.marketingAdsDto.result!
                  .map(
                    (e) => CachedNetworkImage(
                      imageUrl: e.image!,
                    ),
                  )
                  .toList(),
              autoPlay: true,
              aspectRatio: 5,
              viewport: 1,
            );
          case AdsState.failure:
            return CarouselSliderHelper(
              list: defaultList,
              aspectRatio: 5,
              viewport: 1,
            );
          default:
            return SizedBox();
        }
      },
    );
  }
}
