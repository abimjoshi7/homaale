// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
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
    this.callback,
    this.count,
    this.budgetType,
    this.onTapCallback,
  });

  final String? imageUrl;
  final String? taskName;
  final String? endDate;
  final String? endHour;
  final String? budgetType;
  final String? location;
  final String? startRate;
  final String? endRate;
  final String? count;
  final VoidCallback? callback;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
      child: Padding(
        padding: kPadding10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        height: 49,
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
                      addHorizontalSpace(10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          StringUtils.capitalize(
                            taskName ?? '',
                          ),
                          style: kPurpleText16,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: onTapCallback,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Color(0xffFE5050),
                    ),
                  ),
                ],
              ),
            ),
            addVerticalSpace(8),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  WidgetText(
                    label: StringUtils.capitalize(
                      location ?? 'Buddhanagar',
                    ),
                    widget: const Icon(
                      Icons.location_on_outlined,
                      size: 14,
                      color: Color(0xffFE5050),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      WidgetText(
                        label: endDate ?? 'yy/mm/dd',
                        widget: const Icon(
                          Icons.calendar_today,
                          size: 14,
                          color: Color(0xffF06700),
                        ),
                      ),
                      addHorizontalSpace(10),
                      WidgetText(
                        label: endHour ?? 'hh:mm:ss',
                        widget: const Icon(
                          Icons.access_time_rounded,
                          size: 14,
                          color: Color(0xff3eaeff),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "Rs. ${startRate ?? '0'} - ",
                            style: kPurpleText16,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                endRate ?? '0',
                                style: kPurpleText16,
                              ),
                              Text(
                                '/ ${budgetType?.toLowerCase()}',
                              )
                            ],
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
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Divider(),
            ),
            CustomElevatedButton(
              theWidth: double.infinity,
              callback: callback ?? () {},
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
