// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({
    Key? key,
    this.title,
    this.imagePath,
    this.description,
    this.rating,
    this.location,
    this.callback,
  }) : super(key: key);

  final String? title;
  final String? imagePath;
  final String? description;
  final String? rating;
  final String? location;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
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
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      title ?? '',
                      style: Theme.of(context).textTheme.titleMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
                    AutoSizeText(
                      description ?? '',
                      style: kLightBlueText14,
                      overflow: TextOverflow.ellipsis,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: 120,
                        maxWidth: double.infinity,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconText(
                            label: rating ?? '0.0',
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
            ),
          ],
        ),
      ),
    );
  }
}
