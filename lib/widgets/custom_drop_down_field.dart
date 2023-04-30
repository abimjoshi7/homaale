// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class CustomDropDownField<T> extends StatefulWidget {
  const CustomDropDownField({
    Key? key,
    required this.list,
    this.theChild,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.selectedIndex,
    this.borderRadius,
    this.initialValue,
    this.validator,
  }) : super(key: key);
  final List<T> list;
  final Widget? theChild;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<T?>? onSaved;
  final String? hintText;
  final int? selectedIndex;
  final double? borderRadius;
  final T? initialValue;
  final String? Function(T?)? validator;

  @override
  State<CustomDropDownField<T>> createState() => _CustomDropDownTextformState();
}

class _CustomDropDownTextformState<T> extends State<CustomDropDownField<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      iconEnabledColor: kColorSilver,
      validator: widget.validator,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      iconSize: 14,
      isExpanded: true,
      // focusColor: kColorGrey,
      value: widget.initialValue,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEE2E6)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: kColorSecondary,
          ),
          borderRadius: BorderRadius.circular(
            widget.borderRadius ?? 8,
          ),
        ),
        prefixIcon: widget.theChild,
      ),
      items: widget.list.map(
        (T value) {
          return DropdownMenuItem<T>(
            alignment: Alignment.centerLeft,
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 4,
              ),
              child: AutoSizeText(
                value.toString(),
              ),
            ),
          );
        },
      ).toList(),
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
    );
  }
}
