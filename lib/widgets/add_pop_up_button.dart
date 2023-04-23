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
            backgroundColor: kColorPrimaryAccent,
            child: Icon(icon,
              color:Theme.of(context).appBarTheme.iconTheme?.color,
            ),
          ),
          Text(
            label,
            style:Theme.of(context).textTheme.bodySmall,
            // const TextStyle(color: kColorSilver),
          ),
          addVerticalSpace(16),
        ],
      ),
    );
  }
}
