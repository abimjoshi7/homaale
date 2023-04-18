import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class AccountListTileSection extends StatelessWidget {
  const AccountListTileSection({
    super.key,
    required this.icon,
    required this.label,
    required this.trailingWidget,
    required this.onTap,
  });

  final Widget icon;
  final String label;
  final Widget trailingWidget;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      icon,
                      kWidth20,
                      Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                trailingWidget
              ],
            ),
          ),
          Divider(
            thickness: 2,
            color: Colors.grey.shade300,
          ),
        ],
      ),
    );
  }
}
