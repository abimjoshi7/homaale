import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomBottomNavItems extends StatelessWidget {
  const CustomBottomNavItems({
    super.key,
    required this.onPressed,
    required this.label,
    required this.iconData,
    required this.index,
    required this.pageIndex,
    required this.isActive,
  });

  final VoidCallback onPressed;
  final int pageIndex;
  final int index;
  final String label;
  final IconData iconData;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: onPressed,
          child: isActive
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
            color: isActive ? kColorSecondary : kColorSilver,
          ),
        ),
      ],
    );
  }
}
