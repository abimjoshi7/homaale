import 'package:cipher/core/carousel_slider/carousel_slider_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class HeaderOfferSection extends StatelessWidget {
  const HeaderOfferSection({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSliderHelper(
      list: offerBanner,
      aspectRatio: 5,
      viewport: 1,
    );
  }
}
