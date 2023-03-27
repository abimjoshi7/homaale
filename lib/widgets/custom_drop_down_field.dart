import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomDropDownField<T> extends StatefulWidget {
  const CustomDropDownField({
    super.key,
    required this.list,
    this.theChild,
    this.onChanged,
    this.onSaved,
    this.hintText,
    this.selectedIndex,
    this.borderRadius,
  });
  final List<T> list;
  final Widget? theChild;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<T?>? onSaved;
  final String? hintText;
  final int? selectedIndex;
  final double? borderRadius;

  @override
  State<CustomDropDownField<T>> createState() => _CustomDropDownTextformState();
}

class _CustomDropDownTextformState<T> extends State<CustomDropDownField<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      iconEnabledColor: kColorSilver,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
      ),
      iconSize: 14,
      isExpanded: true,
      // focusColor: kColorGrey,
      value: widget.list[widget.selectedIndex ?? 0],
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xff9CA0C1),
          fontWeight: FontWeight.w400,
        ),
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
            alignment: Alignment.center,
            value: value,
            child: AutoSizeText(
              value.toString(),
            ),
          );
        },
      ).toList(),
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
    );
  }
}
