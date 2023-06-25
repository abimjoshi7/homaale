// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class CustomDropdownSearch<T> extends StatelessWidget {
  const CustomDropdownSearch({
    Key? key,
    this.serviceId,
    required this.list,
    required this.onChanged,
    this.hintText,
    this.onRemovePressed,
    this.selectedItem,
  }) : super(key: key);

  final String? serviceId;
  final List<T> list;
  final ValueChanged onChanged;
  final String? hintText;
  final VoidCallback? onRemovePressed;
  final T? selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      validator: (value) => value == null ? 'Required Field' : null,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      selectedItem: selectedItem,
      enabled: list.isNotEmpty,
      items: list,
      onChanged: onChanged,
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding: const EdgeInsets.all(5),
          hintText: hintText ?? 'Choose a category',
          hintStyle: Theme.of(context).textTheme.displaySmall,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
            borderRadius: BorderRadius.circular(8),
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
              8,
            ),
          ),
        ),
        baseStyle: Theme.of(context).textTheme.bodySmall,
      ),
      clearButtonProps: ClearButtonProps(
        padding: EdgeInsets.zero,
        iconSize: 16,
        visualDensity: VisualDensity.compact,
        alignment: Alignment.centerRight,
        isVisible: serviceId != null && serviceId != '',
        color: serviceId == null ? Colors.white : Colors.black,
        onPressed: onRemovePressed,
      ),
      popupProps: PopupProps.menu(
        showSearchBox: list.length > 5,
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            constraints: BoxConstraints(
              minHeight: 20,
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
              borderSide: BorderSide(color: Color(0xffDEE2E6)),
              borderRadius: BorderRadius.circular(8),
            ),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
