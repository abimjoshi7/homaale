// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServicesTextCard extends StatelessWidget {
  const ServicesTextCard({
    super.key,
    this.price,
    this.location,
    this.createdDate,
    this.description,
    this.address,
    this.title,
    this.imagePath,
    this.viewCount,
  });

  final String? price;
  final String? location;
  final String? createdDate;
  final String? description;
  final String? address;
  final String? title;
  final String? imagePath;
  final String? viewCount;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        FittedBox(
          child: Text(
            description ?? '',
            style: kPurpleText13,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        kHeight5,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WidgetText(
              label: createdDate ?? '',
              widget: const Icon(
                Icons.calendar_today_outlined,
                color: kColorBlue,
                size: 14,
              ),
            ),
            WidgetText(
              label: viewCount ?? '',
              widget: const Icon(
                Icons.visibility_outlined,
                size: 14,
                color: kColorPrimaryAccent,
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
    );
  }
}
