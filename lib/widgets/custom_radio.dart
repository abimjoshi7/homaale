// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomRadio extends StatelessWidget {
  const CustomRadio({
    Key? key,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected == true ? Colors.amber : const Color(0xffADB5BD),
          ),
          color: isSelected == true ? Colors.amber : Colors.transparent,
        ),
        child: Center(
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected == true
                      ? Colors.amber
                      : const Color(0xffADB5BD),
                ),
                color: Colors.white),
          ),
        ),
      ),
    );
  }
}
