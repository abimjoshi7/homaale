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
    this.buttonLabel,
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
  final String? buttonLabel;
  final VoidCallback? callback;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 203,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
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
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Text(
                          StringUtils.capitalize(
                            taskName ?? '',
                          ),
                          style: Theme.of(context).textTheme.headlineSmall,
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
            addVerticalSpace(5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  WidgetText(
                    label: StringUtils.capitalize(
                      location ?? '',
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
                            "Rs. ${Decimal.parse(startRate ?? '0')} - ",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                '${Decimal.parse(endRate ?? '0')}',
                                style: Theme.of(context).textTheme.headlineSmall,
                              ),
                              Text(
                                '/ ${budgetType?.toLowerCase()}',
                              )
                            ],
                          ),
                        ],
                      ),
                      IconText(
                        label: count ?? '0',
                        iconData: Icons.visibility_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 5),
            CustomElevatedButton(
              theHeight: 35,
              theWidth: double.infinity,
              callback: callback ?? () {},
              mainColor: kColorGreen,
              borderColor: kColorGreen,
              label: buttonLabel ?? 'Apply Now',
            )
          ],
        ),
      ),
    );
  }
}
