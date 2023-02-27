import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    this.child,
    this.taskName,
    this.startHour,
    this.endHour,
    this.ratings,
    this.location,
    this.rate,
    this.trailingWidget,
  });

  final Widget? child;
  final String? taskName;
  final String? startHour;
  final String? endHour;
  final String? ratings;
  final String? location;
  final String? rate;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            // Container(
            //   height: 50,
            //   width: 50,
            //   decoration: BoxDecoration(
            //     color: Colors.amber,
            //     borderRadius: BorderRadius.circular(
            //       10,
            //     ),
            //   ),
            //   child: child,
            // ),
            kWidth10,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName ?? '',
                    style: kPurpleText13,
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetText(
                        label: taskName ?? '08:11 PM',
                        widget: const Icon(
                          Icons.access_time_rounded,
                          size: 12,
                          color: Color(0xff3eaeff),
                        ),
                      ),
                      WidgetText(
                        label: endHour ?? '08:11 PM',
                        widget: const Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: Color(0xffF06700),
                        ),
                      ),
                    ],
                  ),
                  kHeight5,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      WidgetText(
                        label: ratings ?? '3.4 (90)',
                        widget: const Icon(
                          Icons.star_rate_rounded,
                          size: 12,
                          color: Color(0xffff9700),
                        ),
                      ),
                      WidgetText(
                        label: location ?? 'Buddhanagar',
                        widget: const Icon(
                          Icons.location_on_outlined,
                          size: 12,
                          color: Color(0xffFE5050),
                        ),
                      ),
                    ],
                  ),
                  kHeight5,
                  Text(
                    rate ?? 'Rs 5,000 - Rs 10,000/per hour',
                    style: kPurpleText13,
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 90,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: trailingWidget ??
                  const Icon(
                    Icons.favorite_border,
                    color: Color(0xffFE5050),
                  ),
            ),
          ],
        )
      ],
    );
  }
}
