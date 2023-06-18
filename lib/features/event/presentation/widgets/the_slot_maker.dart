import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TheSlotMaker extends StatelessWidget with TheModalBottomSheet {
  final int selectedIndex;
  final VoidCallback? startCallback;
  final VoidCallback? endCallback;
  final VoidCallback? clearCallback;
  final String? startTime;
  final String? endTime;
  const TheSlotMaker({
    Key? key,
    required this.selectedIndex,
    this.startCallback,
    this.endCallback,
    this.clearCallback,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            children: [
              CustomFormField(
                label: "Start Time",
                child: CustomFormContainer(
                  leadingWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  callback: () async {
                    await showCustomBottomSheet(
                      context: context,
                      widget: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (value) {
                            // setState(
                            //   () {
                            //     _timeSlots.add(
                            //       TimeSlot(
                            //         startTime: value,
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        addHorizontalSpace(
          16,
        ),
        Flexible(
          child: Column(
            children: [
              CustomFormField(
                label: "End Time",
                child: CustomFormContainer(
                  leadingWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  callback: () async {
                    await showCustomBottomSheet(
                      context: context,
                      widget: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (value) {
                            // setState(
                            //   () {
                            //     _timeSlots.add(
                            //       TimeSlot(
                            //         startTime: value,
                            //       ),
                            //     );
                            //   },
                            // );
                          },
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
        selectedIndex == 0
            ? SizedBox(
                width: 48,
              )
            : IconButton.outlined(
                onPressed: clearCallback,
                icon: Icon(
                  Icons.clear,
                  color: kColorSilver,
                ),
              )
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.only(
    //     bottom: 4,
    //   ),
    //   child: CustomFormContainer(
    //     leadingWidget: Row(
    //       children: [
    //         Icon(
    //           Icons.access_time_rounded,
    //         ),
    //         addHorizontalSpace(8),
    //         InkWell(
    //           onTap: startCallback,
    //           child: AutoSizeText(
    //             startTime ?? "--",
    //             style: kLightBlueText14,
    //           ),
    //         ),
    //         addHorizontalSpace(8),
    //         Text('-'),
    //         addHorizontalSpace(8),
    //         InkWell(
    //           onTap: endCallback,
    //           child: AutoSizeText(
    //             endTime ?? "--",
    //             style: kLightBlueText14,
    //           ),
    //         ),
    //       ],
    //     ),
    //     trailingWidget: IconButton(
    //       icon: Icon(
    //         Icons.clear,
    //         size: 15,
    //       ),
    //       onPressed: clearCallback,
    //     ),
    //   ),
    // );
  }
}
