import 'package:cipher/core/constants/constants.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imagePath ?? kServiceImageNImg,
              fit: BoxFit.cover,
            ),
          ),
          FittedBox(
            child: Text(
              title ?? 'Root Canal Treatment',
              style: kPurpleText16,
            ),
          ),
          Text(
            description ?? 'Carry Clinic',
            style: kLightBlueText14,
          ),
          Row(
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star_rate_rounded,
                    color: Color(
                      0xffff9700,
                    ),
                    size: 13,
                  ),
                  Text(
                    rating ?? '3.5 (300)',
                    style: kPurpleText13,
                  )
                ],
              ),
              kWidth20,
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Color(0xfffe5050),
                    size: 13,
                  ),
                  Text(
                    location ?? 'Anamnagar',
                    style: kPurpleText13,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
