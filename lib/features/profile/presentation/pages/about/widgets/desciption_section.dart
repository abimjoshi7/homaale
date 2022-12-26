import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

import 'widgets.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "A professional gardener with over 10 years of experience. I specialise in Lasagna gardening, Keyhole gardening, mittleider gardening, square foot gardening, and  conventional gardening. "),
          kHeight15,
          IconText(
            widget: Image.asset("assets/mail.png"),
            label: "harrysmith@gmail.com",
          ),
          IconText(
            widget: Image.asset("assets/clock.png"),
            label: "Active Hours 12:00 am - 8:00 pm",
          ),
          IconText(
            widget: Image.asset("assets/sparkle.png"),
            label: "House Cleaning",
          ),
          IconText(
            widget: Image.asset("assets/location.png"),
            label: "New baneshwor, Kathmandu, Nepal",
          ),
        ],
      ),
    );
  }
}
