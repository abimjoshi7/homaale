import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    super.key,
    this.title,
    this.imagePath,
    this.description,
    this.rating,
    this.location,
  });

  final String? title;
  final String? imagePath;
  final String? description;
  final String? rating;
  final String? location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imagePath ?? kServiceImageNImg,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title ?? 'Root Canal Treatment',
                  style: kPurpleText16,
                  overflow: TextOverflow.ellipsis,
                ),
                AutoSizeText(
                  description ?? 'Carry Clinic',
                  style: kLightBlueText14,
                  overflow: TextOverflow.ellipsis,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 120,
                    maxWidth: 150,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconText(
                        label: rating ?? '3.5 (300)',
                        iconData: Icons.star_rate_rounded,
                        color: kColorAmber,
                        size: 13,
                      ),
                      Flexible(
                        child: IconText(
                          label: location ?? 'Remote',
                          iconData: Icons.location_on_outlined,
                          color: kColorPink,
                          size: 13,
                        ),
                      ),
                    ],
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
