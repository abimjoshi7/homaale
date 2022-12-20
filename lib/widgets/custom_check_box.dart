import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 22,
      decoration: BoxDecoration(
        color: kColorSecondary,
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Icon(
        Icons.done,
        size: 15,
        color: Colors.white,
      ),
    );
  }
}
