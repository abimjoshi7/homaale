// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/colors.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PriceBookFooterSection extends StatelessWidget {
  const PriceBookFooterSection({
    Key? key,
    required this.onPressed,
    this.price,
    this.isNegotiable,
    this.buttonLabel,
    this.theLeftWidget,
    this.bgColor,
    this.buttonColor,
    this.isUser = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String? price;
  final bool? isNegotiable;
  final String? buttonLabel;
  final Widget? theLeftWidget;
  final Color? bgColor;
  final Color? buttonColor;
  final bool isUser;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: MediaQuery.of(context).size.height * 0.09,
      width: double.infinity,
      decoration: BoxDecoration(color: bgColor ?? Theme.of(context).cardColor, border: Border.all(color: kColorBlue)
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
                  Text('Total Price ${isNegotiable == true ? '(Negotiable)' : ""}'),
                  Text(
                    price ?? '',
                    // style: kText20,
                  ),
                ],
              ),
          Visibility(
            visible: isUser ? false : true,
            child: GestureDetector(
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
          ),
        ],
      ),
    );
  }
}
