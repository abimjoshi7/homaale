import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TasksSuggestionSection extends StatelessWidget {
  const TasksSuggestionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 400,
        width: double.infinity,
        child: Column(
          children: [
            SectionHeading(
              labelName: 'Tasks you may like',
              onTap: () {},
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),
                        kWidth10,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Customer Care',
                                style: kPurpleText12,
                              ),
                              kHeight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconText(
                                    label: '08:11 PM',
                                    widget: Icon(
                                      Icons.access_time_rounded,
                                      size: 12,
                                      color: Color(0xff3eaeff),
                                    ),
                                  ),
                                  IconText(
                                    label: '08:11 PM',
                                    widget: Icon(
                                      Icons.calendar_today,
                                      size: 12,
                                      color: Color(0xffF06700),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight5,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  IconText(
                                    label: '3.4 (90)',
                                    widget: Icon(
                                      Icons.star_rate_rounded,
                                      size: 12,
                                      color: Color(0xffff9700),
                                    ),
                                  ),
                                  IconText(
                                    label: 'Buddhanagar',
                                    widget: Icon(
                                      Icons.location_on_outlined,
                                      size: 12,
                                      color: Color(0xffFE5050),
                                    ),
                                  ),
                                ],
                              ),
                              kHeight5,
                              const Text(
                                'Rs 5,000 - Rs 10,000/per hour',
                                style: kPurpleText12,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 90,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: Icon(
                            Icons.favorite_border,
                            color: Color(0xffFE5050),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                separatorBuilder: (context, index) => kHeight10,
                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
