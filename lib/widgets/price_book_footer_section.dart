// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';

class PriceBookFooterSection extends StatelessWidget {
  const PriceBookFooterSection({
    super.key,
    required this.onPressed,
    this.price,
    this.buttonLabel,
    this.theLeftWidget,
  });

  final VoidCallback onPressed;
  final String? price;
  final String? buttonLabel;
  final Widget? theLeftWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffBCD4FA),
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
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.2,
              child: CustomElevatedButton(
                callback: onPressed,
                label: buttonLabel ?? 'Book Now',
              ),
            )
          ],
        ),
      ),
    );
  }
}
