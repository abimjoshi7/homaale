// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/widgets/widgets.dart';

typedef AddToList = void Function(DateTime, int);

class TheSlotMaker extends StatefulWidget {
  final AddToList addToList;
  final bool showClear;
  final VoidCallback theStartCallback;
  final TimeSlot timeSlot;

  const TheSlotMaker({
    Key? key,
    required this.addToList,
    this.showClear = true,
    required this.theStartCallback,
    required this.timeSlot,
  }) : super(key: key);

  @override
  State<TheSlotMaker> createState() => _TheSlotMakerState();
}

class _TheSlotMakerState extends State<TheSlotMaker> with TheModalBottomSheet {
  TimeSlot? timeSlot;
  DateTime? startTime;
  DateTime? endTime;
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
                child: CustomTextFormField(
                  readOnly: true,
                  validator: (p0) => widget.timeSlot.startTime == null
                      ? "Required Field"
                      : null,
                  hintText: widget.timeSlot.startTime != null
                      ? DateFormat.jm().format(
                          widget.timeSlot.startTime!,
                        )
                      : DateTime.now().toIso8601String().substring(15),
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  prefixWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  onTap: widget.theStartCallback,
                  //  () {
                  //   showCustomBottomSheet(
                  //     context: context,
                  //     widget: SizedBox(
                  //       height: 400,
                  //       child: CupertinoDatePicker(
                  //         mode: CupertinoDatePickerMode.time,
                  //         onDateTimeChanged: (value) {},
                  //       ),
                  //     ),
                  //   );
                  // },
                ),
              ),
            ],
          ),
        ),
        // addHorizontalSpace(
        //   16,
        // ),
        // Flexible(
        //   child: Column(
        //     children: [
        //       CustomFormField(
        //         label: "End Time",
        //         child: CustomTextFormField(
        //           readOnly: true,
        //           validator: (p0) =>
        //               startTime == null ? "Required Field" : null,
        //           hintText: endTime != null
        //               ? DateFormat.jm().format(
        //                   endTime!,
        //                 )
        //               : "",
        //           hintStyle: Theme.of(context).textTheme.bodyMedium,
        //           prefixWidget: Icon(
        //             Icons.alarm_sharp,
        //             color: kColorSilver,
        //           ),
        //           onTap: () {
        //             showModalBottomSheet(
        //               context: context,
        //               builder: (context) => CupertinoDatePicker(
        //                 mode: CupertinoDatePickerMode.time,
        //                 onDateTimeChanged: (value) {},
        //               ),
        //             );
        //           },
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
