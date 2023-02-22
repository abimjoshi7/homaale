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
      padding: kPadding10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.12,
            width: MediaQuery.of(context).size.width * 0.36,
            child: Image.network(
              imagePath ?? kServiceImageNImg,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title ?? 'Root Canal Treatment',
                    style: kPurpleText16,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Flexible(
                  child: Text(
                    description ?? 'Carry Clinic',
                    style: kLightBlueText14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.017,
            width: MediaQuery.of(context).size.width * 0.36,
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star_rate_rounded,
                        color: Color(
                          0xffff9700,
                        ),
                        size: 13,
                      ),
                      Flexible(
                        child: Text(
                          rating ?? '3.5 (300)',
                          style: kPurpleText13,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                // addHorizontalSpace(10),
                Flexible(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Color(0xfffe5050),
                        size: 13,
                      ),
                      Flexible(
                        child: Text(
                          location ?? 'Anamnagar',
                          overflow: TextOverflow.ellipsis,
                          style: kPurpleText13,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
