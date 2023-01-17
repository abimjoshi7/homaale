import 'package:flutter/material.dart';

class CustomDropDownField<T> extends StatefulWidget {
  const CustomDropDownField({
    super.key,
    required this.list,
    this.theChild,
    this.onChanged,
    required this.hintText,
    this.onSaved,
  });
  final List<T> list;
  final Widget? theChild;
  final ValueChanged<T?>? onChanged;
  final ValueChanged<T?>? onSaved;
  final String hintText;

  @override
  State<CustomDropDownField<T>> createState() => _CustomDropDownTextformState();
}

class _CustomDropDownTextformState<T> extends State<CustomDropDownField<T>> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: widget.hintText,
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
        prefixIcon: widget.theChild,
      ),
      items: widget.list.map(
        (T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(value.toString()),
          );
        },
      ).toList(),
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
    );
  }
}
