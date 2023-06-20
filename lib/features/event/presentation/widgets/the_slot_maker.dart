import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/utilities/data/models/models.dart';
import 'package:cipher/widgets/widgets.dart';

typedef AddToList = void Function(DateTime, int);

class TheSlotMaker extends StatefulWidget {
  final VoidCallback? clearCallback;
  final AddToList addToList;
  final bool showClear;
  final int index;

  const TheSlotMaker({
    Key? key,
    this.clearCallback,
    required this.addToList,
    this.showClear = true,
    required this.index,
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
                  validator: (p0) =>
                      startTime == null ? "Required Field" : null,
                  hintText: startTime != null
                      ? DateFormat.jm().format(
                          startTime!,
                        )
                      : "",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  prefixWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  onTap: () {
                    showCustomBottomSheet(
                      context: context,
                      widget: SizedBox(
                        height: 400,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.time,
                          onDateTimeChanged: (value) {
                            setState(() {
                              startTime = value;
                              widget.addToList(value, widget.index);
                            });
                            print(value);
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
                child: CustomTextFormField(
                  readOnly: true,
                  validator: (p0) =>
                      startTime == null ? "Required Field" : null,
                  hintText: endTime != null
                      ? DateFormat.jm().format(
                          endTime!,
                        )
                      : "",
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  prefixWidget: Icon(
                    Icons.alarm_sharp,
                    color: kColorSilver,
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (value) {
                          setState(() {
                            endTime = value;
                            widget.addToList(value, widget.index);
                          });
                          print(value);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
