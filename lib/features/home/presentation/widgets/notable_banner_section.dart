import 'package:cipher/core/carousel_slider/carousel_slider_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/marketing/presentation/bloc/marketing_ads_bloc.dart';
import 'package:cipher/features/marketing/presentation/marketing_ads.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class NotableBannerSection extends StatelessWidget {
  const NotableBannerSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Homaale Notable Quality',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        MarketingAds(
          defaultList: kNotableBannerList,
        ),
      ],
    );
  }
}
