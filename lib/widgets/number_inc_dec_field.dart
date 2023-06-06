// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cipher/core/constants/input_formatters.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/services.dart';

class NumberIncDecField extends StatefulWidget {
  final TextEditingController controller;
  final double? width;
  final ValueChanged? onChanged;
  final ValueChanged? onSubmit;
  final AutovalidateMode autoValidateMode;
  final String? Function(String?)? validator;
  final bool hasErrors;
  const NumberIncDecField({
    Key? key,
    required this.controller,
    this.width = 106,
    this.onChanged,
    this.onSubmit,
    this.validator,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.hasErrors = false,
  }) : super(key: key);

  @override
  State<NumberIncDecField> createState() => _NumberIncDecFieldState();
}

class _NumberIncDecFieldState extends State<NumberIncDecField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      alignment: Alignment.center,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: kColorGrey,
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              validator: widget.validator,
              autovalidateMode: widget.autoValidateMode,
              textInputAction: TextInputAction.next,
              textAlignVertical: TextAlignVertical.center,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  10,
                ),
              ),
              controller: widget.controller,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onSubmit,
            ),
          ),
          SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                  ),
                  child: InkWell(
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      size: 18,
                      color: kColorGrey,
                    ),
                    onTap: () {
                      int currentValue = int.parse(widget.controller.text);
                      setState(
                        () {
                          currentValue++;
                          widget.controller.setText(
                              (currentValue).toString()); // incrementing value
                        },
                      );
                    },
                  ),
                ),
                InkWell(
                  child: const Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 18,
                    color: kColorGrey,
                  ),
                  onTap: () {
                    int currentValue = int.parse(
                      widget.controller.text,
                    );
                    setState(
                      () {
                        currentValue--;
                        widget.controller.setText(
                            (currentValue > 0 ? currentValue : 0)
                                .toString()); // decrementing value
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
