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
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: leadingWidget ??
                Icon(
                  Icons.arrow_back,
                  color: kColorSilver,
                ),
          ),
        ),
        Center(
          child: child ??
              Text(
                label ?? '',
                style: kText15,
              ),
        ),
        trailingWidget ?? SizedBox.shrink(),
      ],
    );
  }
}
