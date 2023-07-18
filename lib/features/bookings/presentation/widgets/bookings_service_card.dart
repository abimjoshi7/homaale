// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';

import '../../../../widgets/icon_text.dart';

class BookingsServiceCard extends StatelessWidget with TheModalBottomSheet {
  final String? serviceName;
  final String? providerName;
  final Widget? firstWidget;
  final Widget? secondWidget;
  final Widget? thirdWidget;
  final String? status;
  final DateTime? createdAt;
  final String? startTime;
  final String? endTime;
  final String? location;
  final Widget? bottomLeftWidget;
  final Widget? bottomRightWidget;
  final Widget? mainContentWidget;
  final Color? cardColor;
  final VoidCallback? callback;
  final VoidCallback? editTap;
  final VoidCallback? cancelTap;
  final VoidCallback? deleteTap;
  final double? theHeight;
  final bool? hidePopupButton;
  // "isTask" is only passed in waiting list box feature
  final bool? isTask;
  final bool? hideImage;

  const BookingsServiceCard({
    Key? key,
    this.serviceName,
    this.providerName,
    this.firstWidget,
    this.secondWidget,
    this.thirdWidget,
    this.status,
    this.bottomLeftWidget,
    this.bottomRightWidget,
    this.mainContentWidget,
    this.cardColor = const Color(0xfff98900),
    this.callback,
    this.editTap,
    this.cancelTap,
    this.deleteTap,
    this.theHeight,
    this.hidePopupButton = false,
    this.isTask,
    this.hideImage,
    this.location,
    this.createdAt,
    this.startTime,
    this.endTime,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          Container(
            height: theHeight ?? 170,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: hideImage == null ? cardColor : null,
            ),
          ),
          Positioned(
            left: 5,
            right: 0,
            child: Container(
              height: theHeight ?? 170,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.5, 0.5),
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(
                  8,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                        mainAxisAlignment: hideImage != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          hideImage != null
                              ? Column(
                                  children: [
                                    // addVerticalSpace(4.0),
                                    Container(
                                      height: 76,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16.0),
                                        image: DecorationImage(
                                          image: NetworkImage(kHomaaleImg),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : const SizedBox.shrink(),
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: hideImage != null
                                      ? MediaQuery.of(context).size.width * 0.55
                                      : MediaQuery.of(context).size.width * 0.7,
                                  child: AutoSizeText(
                                    serviceName ?? '',
                                    style: Theme.of(context).textTheme.headlineSmall,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                // AutoSizeText(
                                //   providerName ?? '',
                                //   style: kLightBlueText14,
                                // ),
                                IconText(
                                  iconData: Icons.location_on_outlined,
                                  label: location?.length != null ? location ?? "Remote" : 'Remote',
                                  color: Colors.red,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: IconText(
                                        iconData: Icons.calendar_today_rounded,
                                        label: DateFormat.yMMMEd().format(
                                          createdAt ?? DateTime.now(),
                                        ),
                                        color: kColorBlue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: IconText(
                                        iconData: Icons.watch_later_outlined,
                                        label: "${DateFormat.jm().format(
                                          DateFormat('hh:mm:ss').parse(endTime ?? '00:00:00'),
                                        )}",
                                        color: kColorGreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          //   hidePopupButton ?? false
                          //       ? SizedBox()
                          //       : IconButton(
                          //           onPressed: () {
                          //             showCustomBottomSheet(
                          //               context: context,
                          //               widget: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   ListTile(
                          //                     onTap: editTap,
                          //                     leading: Icon(
                          //                       Icons.edit_outlined,
                          //                     ),
                          //                     title: Text("Edit"),
                          //                   ),
                          //                   Divider(),
                          //                   ListTile(
                          //                     onTap: cancelTap,
                          //                     leading: Icon(
                          //                       Icons.cancel_outlined,
                          //                     ),
                          //                     title: Text("Cancel"),
                          //                   ),
                          //                   Divider(),

                          //                   ListTile(
                          //                     onTap: deleteTap,
                          //                     leading: Icon(
                          //                       Icons.delete_outline_rounded,
                          //                     ),
                          //                     title: Text("Remove"),
                          //                   ),
                          //                   // TextButton.icon(
                          //                   //   style: TextButton.styleFrom(
                          //                   //       foregroundColor: kColorBlue),
                          //                   //   onPressed: editTap,
                          //                   //   icon: ,
                          //                   //   label: ,
                          //                   // ),
                          //                   // Divider(),
                          //                   // TextButton.icon(
                          //                   //   style: TextButton.styleFrom(
                          //                   //       foregroundColor: kColorGrey),
                          //                   //   onPressed: cancelTap,
                          //                   //   icon: Icon(
                          //                   //     Icons.cancel_outlined,
                          //                   //   ),
                          //                   //   label: Text("Cancel"),
                          //                   // ),
                          //                   // Divider(),
                          //                   // TextButton.icon(
                          //                   //   style: TextButton.styleFrom(
                          //                   //       foregroundColor: Colors.red),
                          //                   //   onPressed: deleteTap,
                          //                   //   icon: Icon(
                          //                   //     Icons.delete_outline_rounded,
                          //                   //   ),
                          //                   //   label: Text("Remove"),
                          //                   // ),
                          //                 ],
                          //               ),
                          //             );
                          //           },
                          //           icon: Icon(
                          //             Icons.more_vert_rounded,
                          //           ),
                          //         ),
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // mainContentWidget ?? const SizedBox.shrink(),
                        isTask != null
                            ? Container(
                                padding: const EdgeInsets.all(6.0),
                                height: 25.0,
                                width: 65.0,
                                decoration: BoxDecoration(
                                  color: Color(0xffEDF4FF),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Center(
                                  child: Text(
                                    isTask == true ? 'Task' : 'Service',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 10.0, color: kColorPrimary),
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                        thirdWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomLeftWidget ??
                            Row(
                              children: [
                                kWidth5,
                                Chip(
                                  backgroundColor: (getStatus(status ?? '')["color"] as Color).withOpacity(
                                    0.6,
                                  ),
                                  label: Text(
                                    status?.toTitleCase() ?? '',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                        bottomRightWidget ?? const SizedBox.shrink()
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
