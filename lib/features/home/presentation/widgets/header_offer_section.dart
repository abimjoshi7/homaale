import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/marketing/presentation/marketing_ads.dart';
import 'package:flutter/material.dart';

class HeaderOfferSection extends StatelessWidget {
  const HeaderOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return MarketingAds(
      defaultList: offerBanner,
    );
  }
}
