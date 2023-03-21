// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/widgets/widgets.dart';

class BookingsServiceCard extends StatelessWidget {
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        children: [
          Container(
            height: theHeight ?? MediaQuery.of(context).size.height * 0.2,
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
              height: theHeight ?? MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
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
                            AutoSizeText(
                              serviceName ?? '',
                              style: kPurpleText16,
                            ),
                            AutoSizeText(
                              providerName ?? '',
                              style: kLightBlueText14,
                            ),
                          ],
                        ),
                        // PopupMenuButton(
                        //   itemBuilder: (context) => [
                        //     PopupMenuItem(
                        //       onTap: editTap,
                        //       child: const IconText(
                        //         iconData: Icons.edit_note_outlined,
                        //         label: 'Edit',
                        //       ),
                        //     ),
                        //     PopupMenuItem(
                        //       onTap: cancelTap,
                        //       child: const IconText(
                        //         iconData: Icons.clear_rounded,
                        //         label: 'Cancel',
                        //       ),
                        //     ),
                        //     PopupMenuItem(
                        //       onTap: deleteTap,
                        //       child: const IconText(
                        //         iconData: Icons.delete_outline_rounded,
                        //         label: 'Delete',
                        //       ),
                        //     ),
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
                                const Text("Status :"),
                                kWidth5,
                                Chip(
                                  backgroundColor:
                                      (getStatus(status ?? '')["color"]
                                              as Color)
                                          .withOpacity(
                                    0.6,
                                  ),
                                  label: Text(status?.toTitleCase() ?? ''),
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
