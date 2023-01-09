import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class SectionHeading extends StatelessWidget {
  const SectionHeading({
    super.key,
    required this.labelName,
    required this.onTap,
  });

  final String labelName;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          labelName,
          style: kPurpleText19,
        ),
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: const [
              Text(
                'See all',
                style: TextStyle(
                  color: Color(0xff3eaeff),
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Color(0xff3eaeff),
                size: 10,
              )
            ],
          ),
        )
      ],
    );
  }
}
