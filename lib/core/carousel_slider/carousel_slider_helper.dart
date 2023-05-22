// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CarouselSliderHelper extends StatelessWidget {
  const CarouselSliderHelper({
    super.key,
    required this.list,
    this.aspectRatio,
    this.viewport,
    this.autoplayDuration,
    this.autoPlay,
    this.enlargeCenterPage,
  });

  final List<Widget> list;
  final double? aspectRatio;
  final double? viewport;
  final int? autoplayDuration;
  final bool? autoPlay;
  final bool? enlargeCenterPage;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: list,
      options: CarouselOptions(
        enableInfiniteScroll: false,
        enlargeCenterPage: enlargeCenterPage ?? false,
        aspectRatio: aspectRatio ?? 4,
        autoPlay: autoPlay ?? true,
        autoPlayInterval: Duration(
          seconds: autoplayDuration ?? 5,
        ),
        viewportFraction: viewport ?? 0.8,
      ),
    );
  }
}
