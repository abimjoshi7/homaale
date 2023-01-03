import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class PopularTaskerSection extends StatelessWidget {
  const PopularTaskerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Popular Taskers',
            onTap: () {},
          ),
          SizedBox(
            height: 220,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      kHeight10,
                      const CircleAvatar(),
                      kHeight10,
                      Row(
                        children: const [
                          Text(
                            'Harry Smith',
                            style: kPurpleText12,
                          ),
                          kWidth5,
                          Icon(
                            Icons.verified,
                            color: Color(0xff3EAEFF),
                          )
                        ],
                      ),
                      const Text(
                        'Influencer',
                        style: kLightBlueText10,
                      ),
                      kHeight10,
                      Row(
                        children: const [
                          IconText(
                            label: '200',
                            widget: Icon(
                              Icons.emoji_emotions_outlined,
                              color: Color(0xffF98900),
                              size: 13,
                            ),
                          ),
                          kWidth15,
                          IconText(
                            label: '200',
                            widget: Icon(
                              Icons.military_tech_rounded,
                              color: Color(0xff0693E3),
                              size: 13,
                            ),
                          ),
                          kWidth15,
                          IconText(
                            label: '200',
                            widget: Icon(
                              Icons.airline_stops_sharp,
                              color: Color(0xffF98900),
                              size: 13,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          IconText(
                            label: '3.5 (100)',
                            widget: Icon(
                              Icons.star_rate_rounded,
                              size: 13,
                              color: Color(0xffFF9700),
                            ),
                          ),
                          kWidth20,
                          Text(
                            'Rs 2,000/hr',
                            style: kPurpleText12,
                          )
                        ],
                      ),
                      kHeight15,
                      Row(
                        children: [
                          kWidth5,
                          const Icon(
                            Icons.favorite_outline,
                            color: Color(0xffFE5050),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          SizedBox(
                            height: 30,
                            width: 80,
                            child: CustomElevatedButton(
                              callback: () {},
                              label: 'Hire Me',
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => kWidth10,
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }
}
