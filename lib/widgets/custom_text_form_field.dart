import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.theHeight = 50,
    this.hintText = '',
    this.prefixWidget,
    this.suffixWidget,
    this.value,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.textInputType,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.node,
    this.inputFormatters,
    this.theWidth,
    this.onTap,
    this.onTapOutside,
    this.readOnly = false,
  });
  final bool? readOnly;
  final double theHeight;
  final double? theWidth;
  final String hintText;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final String? value;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final bool obscureText;
  final int maxLines;
  final TextEditingController? controller;
  final FocusNode? node;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      initialValue: value,
      focusNode: node,
      controller: controller,
      maxLines: maxLines,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      onTapOutside: onTapOutside,
      enableInteractiveSelection: true,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          minHeight: theHeight,
          maxWidth: theWidth ?? MediaQuery.of(context).size.width,
        ),
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
