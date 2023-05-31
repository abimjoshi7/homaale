import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    Key? key,
    required this.iconData,
    required this.label,
    required this.callback,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final ValueChanged callback;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      elevation: 1,
      labelPadding: EdgeInsets.all(4),
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(
          color: kColorGrey,
        ),
      ),
      avatar: Icon(
        iconData,
        color: kColorSilver,
      ),
      label: Row(
        children: [
          addHorizontalSpace(
            8,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
      onSelected: callback,
    );
  }
}
