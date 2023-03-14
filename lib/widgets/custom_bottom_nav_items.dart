import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItems extends StatelessWidget {
  const CustomBottomNavItems({
    super.key,
    required this.onPressed,
    required this.pageIndex,
    required this.index,
    required this.label,
    required this.iconData,
    required this.checkOpenAdd,
  });

  final VoidCallback onPressed;
  final int pageIndex;
  final int index;
  final String label;
  final IconData iconData;
  final bool checkOpenAdd;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          child: pageIndex == index  && !checkOpenAdd
              ? Icon(
                  iconData,
                  color: kColorSecondary,
                  size: 30,
                )
              : Icon(
                  iconData,
                  color: kColorSilver,
                  size: 30,
                ),
        ),
        Text(
          label,
          style: TextStyle(
            color: pageIndex == index && !checkOpenAdd ? kColorSecondary : kColorSilver,
          ),
        ),
      ],
    );
  }
}
