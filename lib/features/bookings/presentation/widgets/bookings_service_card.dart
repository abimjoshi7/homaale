// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/the_modal_bottom_sheet.dart';

class BookingsServiceCard extends StatelessWidget with TheModalBottomSheet {
  final String? serviceName;
  final String? providerName;
  final Widget? firstWidget;
  final Widget? secondWidget;
  final Widget? thirdWidget;
  final String? status;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardColor,
            ),
          ),
          Positioned(
            left: 5,
            right: 0,
            child: Container(
              height: 200,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: AutoSizeText(
                                serviceName ?? '',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                            AutoSizeText(
                              providerName ?? '',
                              style: kLightBlueText14,
                            ),
                          ],
                        ),
                        hidePopupButton ?? false
                            ? SizedBox()
                            : IconButton(
                                onPressed: () {
                                  showCustomBottomSheet(
                                    context: context,
                                    widget: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                          onTap: editTap,
                                          leading: Icon(
                                            Icons.edit_outlined,
                                          ),
                                          title: Text("Edit"),
                                        ),
                                        Divider(),
                                        ListTile(
                                          onTap: cancelTap,
                                          leading: Icon(
                                            Icons.cancel_outlined,
                                          ),
                                          title: Text("Cancel"),
                                        ),
                                        Divider(),

                                        ListTile(
                                          onTap: deleteTap,
                                          leading: Icon(
                                            Icons.delete_outline_rounded,
                                          ),
                                          title: Text("Remove"),
                                        ),
                                        // TextButton.icon(
                                        //   style: TextButton.styleFrom(
                                        //       foregroundColor: kColorBlue),
                                        //   onPressed: editTap,
                                        //   icon: ,
                                        //   label: ,
                                        // ),
                                        // Divider(),
                                        // TextButton.icon(
                                        //   style: TextButton.styleFrom(
                                        //       foregroundColor: kColorGrey),
                                        //   onPressed: cancelTap,
                                        //   icon: Icon(
                                        //     Icons.cancel_outlined,
                                        //   ),
                                        //   label: Text("Cancel"),
                                        // ),
                                        // Divider(),
                                        // TextButton.icon(
                                        //   style: TextButton.styleFrom(
                                        //       foregroundColor: Colors.red),
                                        //   onPressed: deleteTap,
                                        //   icon: Icon(
                                        //     Icons.delete_outline_rounded,
                                        //   ),
                                        //   label: Text("Remove"),
                                        // ),
                                      ],
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.more_vert_rounded,
                                ),
                              ),
                        // PopupMenuButton(
                        //   offset: Offset(10, 10),
                        //   constraints: BoxConstraints(
                        //     maxHeight: 100,
                        //     maxWidth: 100,
                        //   ),
                        //   itemBuilder: (context) => [
                        //     PopupMenuItem(
                        //       onTap: editTap,
                        //       child: const IconText(
                        //         iconData: Icons.edit_note_outlined,
                        //         label: 'Edit',
                        //       ),
                        //     ),
                        //     // PopupMenuItem(
                        //     //   onTap: cancelTap,
                        //     //   child: const IconText(
                        //     //     iconData: Icons.clear_rounded,
                        //     //     label: 'Cancel',
                        //     //   ),
                        //     // ),
                        //     // PopupMenuItem(
                        //     //   onTap: deleteTap,
                        //     //   child: const IconText(
                        //     //     iconData: Icons.delete_outline_rounded,
                        //     //     label: 'Delete',
                        //     //   ),
                        //     // ),
                        //   ],
                        // ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        mainContentWidget ?? const SizedBox.shrink(),
                      ],
                    ),
                    thirdWidget ?? const SizedBox.shrink(),
                    const Divider(
                      thickness: 1.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        bottomLeftWidget ??
                            Row(
                              children: [
                                isTask != null
                                    ? SizedBox(
                                        height: 30.0,
                                        // width: 55.0,
                                        child: Chip(
                                          backgroundColor: Colors.grey,
                                          label: Text(
                                            isTask == true ? 'Task' : 'Service',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        ),
                                      )
                                    : SizedBox.shrink(),
                                addHorizontalSpace(4.0),
                                const Text("Status :"),
                                kWidth5,
                                Chip(
                                  backgroundColor:
                                      (getStatus(status ?? '')["color"]
                                              as Color)
                                          .withOpacity(
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
