import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PopularTaskNearbySection extends StatelessWidget {
  const PopularTaskNearbySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          kHeight10,
          SectionHeading(
            labelName: 'Popular tasks near you',
            onTap: () {},
          ),
          SizedBox(
            height: 600,
            width: double.infinity,
            child: ListView.separated(
              itemBuilder: (context, index) => Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Need a Garden Cleaner',
                            style: kBodyText1,
                          ),
                          Text(
                            'Rs 1,000',
                            style: kBodyText1,
                          )
                        ],
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              CircleAvatar(
                                radius: 8,
                              ),
                              kWidth10,
                              Text('Swostika Shrestha'),
                            ],
                          ),
                          const Text(
                            'per hour',
                            style: kHelper13,
                          ),
                        ],
                      ),
                      kHeight10,
                      const Text(
                        'We want  a garden cleaner for our bunglow who can great take care of our plants, includes monitoring.',
                      ),
                      kHeight10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          WidgetText(
                            label: 'Anamnagar, KTM (1.5km)',
                            widget: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xffFE5050),
                              size: 13,
                            ),
                          ),
                          WidgetText(
                            label: 'June 9, 2022',
                            widget: Icon(
                              Icons.calendar_today,
                              color: Color(0xffF06700),
                              size: 13,
                            ),
                          ),
                          WidgetText(
                            label: '08:11 PM',
                            widget: Icon(
                              Icons.access_time_filled_outlined,
                              color: Color(0xff3EAEFF),
                              size: 13,
                            ),
                          ),
                        ],
                      ),
                      kHeight10,
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const WidgetText(
                            label: 'Save',
                            widget: Icon(
                              Icons.favorite_border_outlined,
                              size: 19,
                              color: Color(0xffFE5050),
                            ),
                          ),
                          const WidgetText(
                            label: 'Share',
                            widget: Icon(
                              FontAwesomeIcons.share,
                              size: 19,
                              color: Color(0xff3EAEFF),
                            ),
                          ),
                          const WidgetText(
                            label: '180',
                            widget: Icon(
                              Icons.supervisor_account_outlined,
                              size: 19,
                              color: Color(0xff2D2D66),
                            ),
                          ),
                          SizedBox(
                            height: 35,
                            width: 100,
                            child: CustomElevatedButton(
                              callback: () {},
                              label: 'Apply Now',
                              mainColor: const Color(
                                0xff38C675,
                              ),
                            ),
                          )
                        ],
                      ),
                      kHeight5
                    ],
                  ),
                ),
              ),
              separatorBuilder: (context, index) => kHeight10,
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
