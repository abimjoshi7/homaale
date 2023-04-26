import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomRequirement$Highlights extends StatefulWidget {
  const CustomRequirement$Highlights({
    Key? key,
    this.label = "Requirements",
    required this.requirementList,
    required this.requirementController,
  }) : super(key: key);

  final String? label;
  final List<String> requirementList;
  final TextEditingController requirementController;

  @override
  State<CustomRequirement$Highlights> createState() =>
      _CustomRequirement$HighlightsState();
}

class _CustomRequirement$HighlightsState
    extends State<CustomRequirement$Highlights> {
  @override
  Widget build(BuildContext context) {
    return CustomFormField(
      label: widget.label?.toCapitalized(),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(
              widget.requirementList.length,
              (index) => Padding(
                padding: const EdgeInsets.all(2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          size: 12,
                          color: kColorSecondary,
                        ),
                        addHorizontalSpace(20),
                        Text(
                          widget.requirementList[index],
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        setState(
                          () {
                            widget.requirementList.remove(
                              widget.requirementList[index],
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 15,
                        color: kColorGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          addVerticalSpace(5),
          CustomTextFormField(
            controller: widget.requirementController,
            hintText: 'Add ${widget.label?.toLowerCase()}',
            suffixWidget: IconButton(
              icon: Icon(
                Icons.add_box_outlined,
                color: kColorSecondary,
              ),
              onPressed: () {
                if (widget.requirementController.text.isNotEmpty)
                  setState(
                    () {
                      widget.requirementList
                          .add(widget.requirementController.text);
                      widget.requirementController.clear();
                    },
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
