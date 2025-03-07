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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundColor: kColorPrimaryAccent,
            child: Icon(
              icon,
              size: 22,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(color: kColorSilver),
          ),
          addVerticalSpace(20),
        ],
      ),
    );
  }
}
