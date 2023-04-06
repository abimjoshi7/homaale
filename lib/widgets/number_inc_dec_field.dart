// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/constants.dart';

class NumberIncDecField extends StatefulWidget {
  final TextEditingController controller;
  final double? width;
  final ValueChanged? onChanged;
  final ValueChanged? onSubmit;
  const NumberIncDecField({
    Key? key,
    required this.controller,
    this.width = 100,
    this.onChanged,
    this.onSubmit,
  }) : super(key: key);

  @override
  State<NumberIncDecField> createState() => _NumberIncDecFieldState();
}

class _NumberIncDecFieldState extends State<NumberIncDecField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
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
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(
                  10,
                ),
              ),
              controller: widget.controller,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
              ),
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
                          widget.controller.text =
                              (currentValue).toString(); // incrementing value
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
                        widget.controller.text =
                            (currentValue > 0 ? currentValue : 0)
                                .toString(); // decrementing value
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
