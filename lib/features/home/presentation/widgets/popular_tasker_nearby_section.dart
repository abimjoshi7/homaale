import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularTaskerNearbySection extends StatelessWidget {
  const PopularTaskerNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Popular Taskers Near You',
            onTap: () {},
          ),
          kHeight10,
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/syd map 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Flexible(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => SizedBox(
                      width: 300,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text(
                                    'Greenhouse Cleaning',
                                    style: kPurpleText13,
                                  ),
                                  Icon(
                                    Icons.favorite_border,
                                    color: Color(
                                      0xfffe5050,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: const [
                                  CircleAvatar(
                                    radius: 10,
                                  ),
                                  kWidth10,
                                  Text(
                                    'Kantipur Nursery',
                                    style: kLightBlueText14,
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const WidgetText(
                                    label: 'Buddhanagar',
                                    widget: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: Color(0xfffe5050),
                                    ),
                                  ),
                                  const WidgetText(
                                    label: '3.4(190)',
                                    widget: Icon(
                                      Icons.star_rate_rounded,
                                      size: 14,
                                      color: Color(0xffFF9700),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 80,
                                    height: 30,
                                    child: CustomElevatedButton(
                                      callback: () {},
                                      label: 'Book Now',
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    separatorBuilder: (context, index) => kWidth5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
