// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_favourite_icon.dart';
import 'package:cipher/widgets/widgets.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key? key,
    this.id,
    this.imageUrl,
    this.taskName,
    this.endDate,
    this.endHour,
    this.budgetType,
    this.location,
    this.startRate,
    this.endRate,
    this.count,
    this.buttonLabel,
    this.callback,
    this.onTapCallback,
    this.editCallback,
    this.isRange = false,
    this.isBookmarked = false,
    this.isOwner,
    this.createdByName,
    this.isFromProfile,
    this.shareLinked,
  }) : super(key: key);

  final String? id;
  final String? imageUrl;
  final String? taskName;
  final String? createdByName;
  final String? endDate;
  final String? endHour;
  final String? budgetType;
  final String? location;
  final String? startRate;
  final String? endRate;
  final String? shareLinked;
  final String? count;
  final String? buttonLabel;
  final VoidCallback? callback;
  final VoidCallback? onTapCallback;
  final VoidCallback? editCallback;
  final bool isRange;
  final bool? isOwner;
  final bool? isBookmarked;
  final bool? isFromProfile;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: 250,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            addVerticalSpace(5),
            ListTile(
              title: Text(
                StringUtils.capitalize(
                  taskName ?? '',
                ),
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  isOwner ?? false
                      ? IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: editCallback,
                          icon: Icon(
                            Icons.edit,
                            color: kColorAmber,
                          ),
                        )
                      : CustomFavoriteIcon(
                          typeID: '$id',
                          type: ServiceType.entityservice,
                          isBookmarked: isBookmarked ?? false,
                        ),
                  InkWell(
                      onTap: () {
                        final box = context.findRenderObject() as RenderBox?;
                        Share.share(
                          shareLinked!,
                          sharePositionOrigin:
                              box!.localToGlobal(Offset.zero) & box.size,
                        );
                      },
                      child: Icon(Icons.redo_sharp, color: kColorBlue)),
                ],
              ),
            ),
            addHorizontalSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    // addHorizontalSpace(10),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            imageUrl ?? kHomaaleImg,
                          ),
                          fit: BoxFit.cover,
                        ),
                        shape: BoxShape.circle,
                      ),
                    ),
                    addHorizontalSpace(10),
                    SizedBox(
                      width: isFromProfile == true
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.3,
                      child: Text(
                        StringUtils.capitalize(
                          createdByName ?? '',
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: kColorLightGrey),
                        // maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            addVerticalSpace(5),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconText(
                    label: StringUtils.capitalize(
                      location == '' ? 'remote' : location ?? 'remote',
                    ),
                    iconData: Icons.location_on_outlined,
                    size: 14,
                    color: Color(0xffFE5050),
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
                            "Rs. ${Decimal.parse(startRate ?? '0')}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Visibility(
                            visible: isRange,
                            child: Text(
                              ' - ${Decimal.parse(endRate ?? '0')}',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Text(
                            '/ ${budgetType?.toLowerCase()}',
                          ),
                        ],
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
