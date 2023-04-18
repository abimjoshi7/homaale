// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomFormContainer extends StatelessWidget {
  const CustomFormContainer({
    super.key,
    this.hintText = '',
    this.trailingWidget = const SizedBox.shrink(),
    this.leadingWidget = const SizedBox.shrink(),
    this.isMedia = false,
    this.callback,
  });

  final String hintText;
  final Widget trailingWidget;
  final Widget leadingWidget;
  final bool isMedia;
  final VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: kColorGrey,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  leadingWidget,
                  kWidth10,
                  Text(
                    hintText,
                    // style: kHelper13,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ],
              ),
              trailingWidget,
            ],
          ),
        ),
      ),
    );
  }
}
