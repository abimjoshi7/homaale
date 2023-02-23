// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';

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
            height: MediaQuery.of(context).size.height * 0.26,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => TaskerCard(),
              separatorBuilder: (context, index) => kWidth10,
              itemCount: 7,
            ),
          )
        ],
      ),
    );
  }
}

class TaskerCard extends StatelessWidget {
  const TaskerCard({
    super.key,
    this.label,
    this.designation,
    this.happyClients,
    this.rewardPercentage,
    this.distance,
    this.ratings,
    this.rate,
  });

  final String? label;
  final String? designation;
  final String? happyClients;
  final String? rewardPercentage;
  final String? distance;
  final String? ratings;
  final String? rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            kHeight10,
            const CircleAvatar(
              radius: 30,
            ),
            kHeight10,
            Row(
              children: [
                Text(
                  label ?? 'Harry Smith',
                  style: kPurpleText16,
                ),
                kWidth5,
                const Icon(
                  Icons.verified,
                  color: Color(0xff3EAEFF),
                )
              ],
            ),
            Text(
              designation ?? 'Homaale User',
              style: kLightBlueText14,
            ),
            kHeight10,
            Row(
              children: [
                WidgetText(
                  label: happyClients ?? '200',
                  widget: Icon(
                    Icons.emoji_emotions_outlined,
                    color: Color(0xffF98900),
                    size: 16,
                  ),
                ),
                kWidth15,
                WidgetText(
                  label: rewardPercentage ?? '200',
                  widget: Icon(
                    Icons.military_tech_rounded,
                    color: Color(0xff0693E3),
                    size: 16,
                  ),
                ),
                kWidth15,
                WidgetText(
                  label: distance ?? '200',
                  widget: Icon(
                    Icons.airline_stops_sharp,
                    color: Color(0xffF98900),
                    size: 16,
                  ),
                ),
              ],
            ),
            addVerticalSpace(5),
            Row(
              children: [
                WidgetText(
                  label: ratings ?? '3.5 (100)',
                  widget: Icon(
                    Icons.star_rate_rounded,
                    size: 16,
                    color: Color(0xffFF9700),
                  ),
                ),
                kWidth20,
                Text(
                  rate ?? 'Rs 2,000/hr',
                  style: kPurpleText16,
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
    );
  }
}
