// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: MediaQuery.of(context).size.height * 0.09,
      width: double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? Theme.of(context).cardColor,
        //Color(0xffBCD4FA),
      ),
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
                    // style: kText20,
                  ),
                ],
              ),
          GestureDetector(
            onTap: onPressed,
            child: Container(
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
                textAlign: TextAlign.center,
                buttonLabel ?? '',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
