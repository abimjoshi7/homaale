import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.theHeight = 48,
    this.hintText = "",
    this.prefixWidget,
  });

  final double theHeight;
  final String hintText;
  final Widget? prefixWidget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: theHeight,
      child: TextFormField(
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: hintText,
            hintStyle: TextStyle(
                color: Color(0xff9CA0C1), fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDEE2E6)),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffDEE2E6)),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: prefixWidget),
      ),
    );
  }
}
