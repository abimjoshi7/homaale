import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaskRecommendationSection extends StatelessWidget {
  const TaskRecommendationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SectionHeading(
            labelName: 'Task recommendation for you',
            onTap: () {},
          ),
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => kWidth15,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              CircleAvatar(
                                radius: 10,
                              ),
                              kWidth10,
                              Text(
                                'Trimming & Cutting',
                                style: kPurpleText12,
                              )
                            ],
                          ),
                          const SizedBox(
                            width: 180,
                          ),
                          const Icon(
                            Icons.favorite_border,
                            color: Color(0xfffe5050),
                          )
                        ],
                      ),
                      kHeight5,
                      const IconText(
                        label: 'Buddhanagar, Kathmandu (15km)',
                        widget: Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Color(0xffFE5050),
                        ),
                      ),
                      kHeight5,
                      Row(
                        children: const [
                          IconText(
                            label: 'June 9, 2022',
                            widget: Icon(
                              Icons.calendar_today,
                              size: 12,
                              color: Color(0xffF06700),
                            ),
                          ),
                          kWidth20,
                          IconText(
                            label: '08:11 PM',
                            widget: Icon(
                              Icons.access_time_rounded,
                              size: 12,
                              color: Color(0xff3eaeff),
                            ),
                          ),
                        ],
                      ),
                      kHeight10,
                      Row(
                        children: const [
                          Text(
                            'Rs 2,000 - Rs 3,000/per hour',
                            style: kPurpleText12,
                          ),
                          SizedBox(
                            width: 130,
                          ),
                          IconText(
                            label: '180',
                            widget: Icon(
                              Icons.remove_red_eye_sharp,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        height: 15,
                        thickness: 15,
                        color: Color(0xffDEE2E6),
                      ),
                      kHeight10,
                      CustomElevatedButton(
                        mainColor: const Color(0xff38C675),
                        callback: () {},
                        label: 'Apply Now',
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
