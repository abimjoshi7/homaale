import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class FaqQnBox extends StatelessWidget {
  final String question;
  const FaqQnBox({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.017,
      ),
      child: SizedBox(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  question,
                  style: kText14,
                ),
                const RotatedBox(
                  quarterTurns: 3,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 16.0,
                  ),
                ),
              ],
            ),
            addVerticalSpace(17.0),
            const Divider(
              thickness: 1.0,
              color: kColorGrey,
            ),
          ],
        ),
      ),
    );
  }
}
