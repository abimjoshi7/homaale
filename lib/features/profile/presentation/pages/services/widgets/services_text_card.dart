import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServicesTextCard extends StatelessWidget {
  const ServicesTextCard({
    super.key,
    this.price,
    this.location,
    this.reviewNumber,
    this.description,
    this.address,
    this.title,
    this.imagePath,
  });

  final String? price;
  final String? location;
  final String? reviewNumber;
  final String? description;
  final String? address;
  final String? title;
  final String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Image.asset(imagePath ?? 'assets/Group 48099185.png'),
            ),
          ),
          kHeight5,
          Text(
            title ?? '',
            style: kHeading3,
          ),
          kHeight5,
          Text(
            address ?? '',
            style: kHighlightedText,
          ),
          kHeight5,
          Text(
            description ?? '',
            style: kPurpleText12,
          ),
          kHeight5,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconText(
                label: reviewNumber ?? '',
                widget: const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 14,
                ),
              ),
              IconText(
                label: location ?? '',
                widget: Image.asset(
                  'assets/location.png',
                  width: 14,
                  height: 14,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Row(
              children: [
                const Icon(Icons.favorite_outline_rounded, color: Colors.red),
                kWidth5,
                const Icon(
                  Icons.subdirectory_arrow_right_outlined,
                  color: Colors.blue,
                ),
                Expanded(
                  child: Text(
                    price ?? '',
                    style: kHeading3,
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
