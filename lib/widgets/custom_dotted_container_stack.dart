// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class CustomDottedContainerStack extends StatelessWidget {
  const CustomDottedContainerStack({
    Key? key,
    this.theHeight = 48,
    this.theWidget,
  }) : super(key: key);

  final double? theHeight;
  final Widget? theWidget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: theHeight,
          width: double.infinity,
          child: DashedRect(
            color: Theme.of(context).indicatorColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              theWidget ??
                  Text(
                    '+ Select',
                    // style: kHelper13,
                    // iconData: Icons.add,
                  ),
            ],
          ),
        )
      ],
    );
  }
}
