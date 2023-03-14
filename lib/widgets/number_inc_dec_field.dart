import 'package:cipher/core/constants/constants.dart';
import 'package:flutter/material.dart';

class NumberIncDecField extends StatefulWidget {
  final TextEditingController controller;
  final double? width;
  const NumberIncDecField({
    super.key,
    required this.controller,
    this.width,
  });

  @override
  State<NumberIncDecField> createState() => _NumberIncDecFieldState();
}

class _NumberIncDecFieldState extends State<NumberIncDecField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? 100,
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
              decoration: const InputDecoration(border: InputBorder.none),
              textAlign: TextAlign.center,
              controller: widget.controller,
              keyboardType: const TextInputType.numberWithOptions(
                signed: true,
              ),
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
