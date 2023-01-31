import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.theHeight = 48,
    this.hintText = '',
    this.prefixWidget,
    this.value,
    this.onSaved,
    this.textInputType,
    this.validator,
    this.obscureText = false,
    this.onChanged,
    this.maxLines = 1,
    this.suffixWidget,
    this.controller,
    this.node,
  });

  final double theHeight;
  final String hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? value;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final FocusNode? node;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: node,
      controller: controller,
      maxLines: maxLines,
      onChanged: onChanged,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      onSaved: onSaved,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        constraints: BoxConstraints(minHeight: theHeight),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xff9CA0C1),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kColorPrimary),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
      ),
    );
  }
}
