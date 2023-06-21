// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.autofocus,
    this.readOnly = false,
    this.theHeight = 50,
    this.theWidth,
    this.hintText = '',
    this.style,
    this.hintStyle,
    this.prefixWidget,
    this.suffixWidget,
    this.value,
    this.onSaved,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onTap,
    this.onTapOutside,
    this.textInputType,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.controller,
    this.node,
    this.inputFormatters,
    this.inputAction = TextInputAction.next,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.icon,
    this.errorMaxLines,
    this.errorStyle,
  }) : super(key: key);
  final bool? autofocus;
  final bool? readOnly;
  final double theHeight;
  final double? theWidth;
  final String hintText;
  final TextStyle? style;
  final TextStyle? hintStyle;
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
  final TextInputAction? inputAction;
  final AutovalidateMode autoValidateMode;
  final Widget? icon;
  final int? errorMaxLines;
  final TextStyle? errorStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus ?? false,
      initialValue: value,
      autovalidateMode: autoValidateMode,
      style: style ?? Theme.of(context).textTheme.bodySmall,
      readOnly: readOnly ?? false,
      focusNode: node,
      controller: controller,
      maxLines: maxLines,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      // onTapOutside: onTapOutside,
      enableInteractiveSelection: true,
      obscureText: obscureText,
      validator: validator,
      keyboardType: textInputType,
      textInputAction: inputAction,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        constraints: BoxConstraints(
          minHeight: theHeight,
          maxWidth: theWidth ?? MediaQuery.of(context).size.width,
        ),
        hintText: hintText,
        hintStyle: hintStyle ?? Theme.of(context).textTheme.displaySmall,
        errorMaxLines: errorMaxLines ?? 3,
        errorStyle: errorStyle,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: prefixWidget,
        suffixIcon: suffixWidget,
      ),
    );
  }
}
