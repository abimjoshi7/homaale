import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.theHeight = 48,
    this.hintText = "",
    this.prefixWidget,
    this.value,
    this.onSaved,
  });

  final double theHeight;
  final String hintText;
  final Widget? prefixWidget;
  final String? value;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: theHeight,
      child: TextFormField(
        onSaved: onSaved,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(8),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Color(0xff9CA0C1), fontWeight: FontWeight.w400),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEE2E6)),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEE2E6)),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: prefixWidget),
      ),
    );
  }
}
