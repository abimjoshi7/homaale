import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class KycStatusBox extends StatelessWidget {
  KycStatusBox({
    super.key,
    required this.attributeTitle,
    this.isVerified,
    this.status,
    this.hasStatus = false,
    this.removeSpaceBetween = false,
    this.hasFile = false,
    this.fontSize,
    this.boxWidth,
    this.boxHeight,
  });
  final String attributeTitle;
  final dynamic status;
  bool hasStatus;
  bool removeSpaceBetween;
  bool hasFile;
  double? fontSize;
  double? boxWidth;
  double? boxHeight;
  bool? isVerified;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          attributeTitle,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontSize: fontSize ?? null,
              ),
        ),
        addVerticalSpace(removeSpaceBetween ? 4.0 : 18.0),
        Container(
          width: hasStatus ? 100.0 : boxWidth ?? 55.0,
          height: boxHeight ?? 32.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: hasStatus
                ? isVerified == true
                    ? Color(0xff16A34A).withOpacity(0.2)
                    : Color(0xffFF9700).withOpacity(0.2)
                : Colors.transparent,
          ),
          child: Align(
            alignment: hasStatus ? Alignment.center : Alignment.centerLeft,
            child: hasFile
                ? Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: status as Widget,
                  )
                : AutoSizeText(
                    status as String,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: hasStatus
                              ? isVerified == true
                                  ? Color(0xff16A34A)
                                  : Color(0xffFF9700)
                              : null,
                          fontSize: fontSize ?? null,
                        ),
                    maxLines: 2,
                  ),
          ),
        )
      ],
    );
  }
}
