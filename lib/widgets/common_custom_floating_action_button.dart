import 'package:cipher/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CommonCustomFloatingAction extends StatelessWidget {
  final bool floatingAction;
  final String text;
  final VoidCallback onPressed;
  const CommonCustomFloatingAction(
      {super.key,
      required this.floatingAction,
      required this.text,
      required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 5.0,),
          child: GestureDetector(
            onTap: onPressed,
            child: !floatingAction
                ? const Icon(
                    Icons.add_circle_outline_outlined,
                    color: kColorSilver,
                    size: 30,
                  )
                : const Icon(
                    Icons.add_circle,
                    color: kColorSecondary,
                    size: 30,
                  ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 22.0),
          child: Text(
            text,
            style: TextStyle(
              color: floatingAction ? kColorSecondary : kColorSilver,
            ),
          ),
        ),
      ],
    );
  }
}
