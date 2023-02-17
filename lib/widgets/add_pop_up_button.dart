import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AddPopupButton extends StatelessWidget {
  const AddPopupButton({
    super.key,
    required this.label,
    required this.icon,
    required this.callback,
  });

  final String label;
  final IconData icon;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: kColorPrimaryAccent,
              child: Icon(icon),
            ),
            addVerticalSpace(5),
            Text(
              label,
              style: const TextStyle(color: kColorSilver),
            ),
          ],
        ),
      ),
    );
  }
}
