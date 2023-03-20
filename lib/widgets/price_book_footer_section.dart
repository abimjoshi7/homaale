// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class PriceBookFooterSection extends StatelessWidget {
  const PriceBookFooterSection({
    Key? key,
    required this.onPressed,
    this.price,
    this.buttonLabel,
    this.theLeftWidget,
    this.bgColor,
    this.buttonColor,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? price;
  final String? buttonLabel;
  final Widget? theLeftWidget;
  final Color? bgColor;
  final Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? Color(0xffBCD4FA),
      ),
      child: Padding(
        padding: kPadding20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            theLeftWidget ??
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Total Price'),
                    Text(
                      price ?? 'Rs. 1000',
                      style: kText20,
                    ),
                  ],
                ),
            Container(
              padding: EdgeInsets.all(
                8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                color: buttonColor,
              ),
              constraints: BoxConstraints(
                minHeight: 30,
                minWidth: 100,
              ),
              child: AutoSizeText(
                buttonLabel ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.2,
            //   child: Container
            // 	CustomElevatedButton(
            //     callback: onPressed,
            //     label: buttonLabel ?? 'Book Now',
            //     mainColor: buttonColor ?? kColorPrimary,
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
