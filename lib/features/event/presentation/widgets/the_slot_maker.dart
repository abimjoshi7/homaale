// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/widgets/widgets.dart';

class TheSlotMaker extends StatefulWidget {
  final VoidCallback? startCallback;
  final VoidCallback? endCallback;
  final VoidCallback? clearCallback;
  final ValueChanged<DateTime> addToList;
  final bool showClear;
  // final TimeSlot? timeSlot;

  const TheSlotMaker({
    Key? key,
    // this.timeSlot,
    this.startCallback,
    this.endCallback,
    this.clearCallback,
    required this.addToList,
    this.showClear = true,
  }) : super(key: key);

  @override
  State<TheSlotMaker> createState() => _TheSlotMakerState();
}

class _TheSlotMakerState extends State<TheSlotMaker> with TheModalBottomSheet {
  TimeSlot? timeSlot;
  DateTime? startTime;
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
                  hintText: startTime != null
                      ? DateFormat.jm().format(
                          startTime!,
                        )
                      : "",
                  leadingWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  callback: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => CupertinoDatePicker(
                              onDateTimeChanged: (value) {
                                setState(() {
                                  startTime = value;
                                });
                                print(value);
                              },
                            ));
                  },
                ),
              ),
            ],
          ),
        ),
        addHorizontalSpace(
          16,
        ),
        // Flexible(
        //   child: Column(
        //     children: [
        //       CustomFormField(
        //         label: "End Time",
        //         child: CustomFormContainer(
        //           hintText: widget.timeSlot != null
        //               ? DateFormat.jm().format(
        //                   widget.timeSlot!.endTime!,
        //                 )
        //               : "",
        //           leadingWidget: Icon(
        //             Icons.alarm_sharp,
        //             color: kColorSilver,
        //           ),
        //           callback: widget.endCallback,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Visibility(
          visible: widget.showClear,
          child: IconButton.outlined(
            onPressed: widget.clearCallback,
            icon: Icon(
              Icons.clear,
              color: kColorSilver,
            ),
          ),
        ),
      ],
    );
  }
}
