import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TheSlotMaker extends StatelessWidget {
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
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 4,
      ),
      child: CustomFormContainer(
        leadingWidget: Row(
          children: [
            Icon(
              Icons.access_time_rounded,
            ),
            addHorizontalSpace(8),
            InkWell(
              onTap: startCallback,
              child: AutoSizeText(
                startTime ?? "--",
                style: kLightBlueText14,
              ),
            ),
            addHorizontalSpace(8),
            Text('-'),
            addHorizontalSpace(8),
            InkWell(
              onTap: endCallback,
              child: AutoSizeText(
                endTime ?? "--",
                style: kLightBlueText14,
              ),
            ),
          ],
        ),
        trailingWidget: IconButton(
          icon: Icon(
            Icons.clear,
            size: 15,
          ),
          onPressed: clearCallback,
        ),
      ),
    );
  }
}
