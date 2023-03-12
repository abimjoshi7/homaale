// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    this.imageUrl,
    this.taskName,
    this.endDate,
    this.endHour,
    this.location,
    this.startRate,
    this.endRate,
    required this.callback,
    this.count,
  });

  final String? imageUrl;
  final String? taskName;
  final String? endDate;
  final String? endHour;
  final String? location;
  final String? startRate;
  final String? endRate;
  final String? count;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: kPadding10,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl ?? kServiceImageNImg,
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    title: Text(
                      taskName ?? 'Need Gardening',
                      style: kPurpleText16,
                    ),
                    trailing: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.favorite_border,
                        color: Color(0xffFE5050),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WidgetText(
                      label: location ?? 'Buddhanagar',
                      widget: const Icon(
                        Icons.location_on_outlined,
                        size: 14,
                        color: Color(0xffFE5050),
                      ),
                    ),
                    Row(
                      children: [
                        WidgetText(
                          label: endHour ?? 'hh:mm:ss',
                          widget: const Icon(
                            Icons.access_time_rounded,
                            size: 14,
                            color: Color(0xff3eaeff),
                          ),
                        ),
                        addHorizontalSpace(10),
                        WidgetText(
                          label: endDate ?? 'yy/mm/dd',
                          widget: const Icon(
                            Icons.calendar_today,
                            size: 14,
                            color: Color(0xffF06700),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Rs. ${startRate ?? '0'} - ",
                              style: kPurpleText16,
                            ),
                            Text(
                              endRate ?? '0',
                              style: kPurpleText16,
                            ),
                          ],
                        ),
                        IconText(
                          label: count ?? '80',
                          iconData: Icons.visibility_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(),
                ),
              ],
            ),
            CustomElevatedButton(
              callback: callback,
              mainColor: kColorGreen,
              borderColor: kColorGreen,
              label: 'Apply Now',
            )
          ],
        ),
      ),
    );
  }
}
