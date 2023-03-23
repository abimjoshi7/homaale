import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

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
    this.networkImageUrl,
    this.callbackLabel,
    required this.callback,
  });

  final String? label;
  final String? designation;
  final String? happyClients;
  final String? rewardPercentage;
  final String? distance;
  final String? ratings;
  final String? rate;
  final String? callbackLabel;
  final String? networkImageUrl;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      networkImageUrl ?? kServiceImageNImg,
                    ),
                  ),
                ),
              ),
              addVerticalSpace(10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              label ?? 'Harry Smith',
                              style: kPurpleText16,
                            ),
                            kWidth5,
                            const Icon(
                              Icons.verified,
                              color: Color(0xff3EAEFF),
                            ),
                          ],
                        ),
                        Text(
                          designation ?? 'Homaale User',
                          style: kLightBlueText14,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WidgetText(
                          label: happyClients ?? '200',
                          widget: const Icon(
                            Icons.emoji_emotions_outlined,
                            color: Color(0xffF98900),
                            size: 16,
                          ),
                        ),
                        WidgetText(
                          label: rewardPercentage ?? '200',
                          widget: const Icon(
                            Icons.military_tech_rounded,
                            color: Color(0xff0693E3),
                            size: 16,
                          ),
                        ),
                        WidgetText(
                          label: distance ?? '200',
                          widget: const Icon(
                            Icons.airline_stops_sharp,
                            color: Color(0xffF98900),
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconText(
                          label: ratings ?? '3.5 (100)',
                          iconData: Icons.star_rate_rounded,
                          size: 15,
                          color: kColorAmber,
                        ),
                        Text(
                          rate ?? 'Rs 2,000/hr',
                          style: kPurpleText16,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.favorite_outline,
                          color: Color(0xffFE5050),
                        ),
                        SizedBox(
                          height: 30,
                          width: 80,
                          child: CustomElevatedButton(
                            callback: callback,
                            label: callbackLabel ?? 'Hire Me',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
