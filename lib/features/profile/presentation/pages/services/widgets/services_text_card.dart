import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ServicesTextCard extends StatelessWidget {
  const ServicesTextCard({
    Key? key,
    required this.price,
    required this.location,
    required this.reviewNumber,
    required this.description,
    required this.address,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  final String price;
  final String location;
  final String reviewNumber;
  final String description;
  final String address;
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
            kHeight5,
            Text(
              title,
              style: kHeading3,
            ),
            kHeight5,
            Text(
              address,
              style: kHighlightedText,
            ),
            kHeight5,
            Text(
              description,
              style: kBodyText2,
            ),
            kHeight5,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconText(
                  label: reviewNumber,
                  widget: Icon(
                    Icons.star_rounded,
                    color: Colors.amber,
                    size: 14,
                  ),
                ),
                IconText(
                  label: location,
                  widget: Image.asset(
                    "assets/location.png",
                    width: 14,
                    height: 14,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Icon(Icons.favorite_outline_rounded, color: Colors.red),
                  kWidth5,
                  Icon(
                    Icons.subdirectory_arrow_right_outlined,
                    color: Colors.blue,
                  ),
                  Expanded(
                    child: Text(
                      price,
                      style: kHeading3,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
