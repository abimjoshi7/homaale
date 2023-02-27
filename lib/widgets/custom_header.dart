// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    super.key,
    this.leadingWidget,
    this.trailingWidget,
    this.child,
    this.label,
  });

  final Widget? leadingWidget;
  final Widget? trailingWidget;
  final Widget? child;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        leadingWidget ??
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: kColorSilver,
              ),
            ),
        child ??
            Text(
              label ?? '',
              style: kText15,
            ),
        trailingWidget ??
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: kColorSilver,
              ),
            ),
      ],
    );
  }
}
