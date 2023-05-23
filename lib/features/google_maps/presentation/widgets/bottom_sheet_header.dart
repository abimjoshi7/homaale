
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Container(
            width: 48.0,
            height: 5.0,
            decoration: BoxDecoration(
              color: Color(0xffCED4DA),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          addVerticalSpace(11.0),
          Text(
            "View All",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ],
      ),
    );
  }
}
