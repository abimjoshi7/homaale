import 'package:cipher/core/constants/constants.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class CustomTagTextField extends StatelessWidget {
  const CustomTagTextField({
    super.key,
    required this.tagController,
    this.initialList,
    this.hintText,
  });

  final TextfieldTagsController tagController;
  final List<String>? initialList;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textfieldTagsController: tagController,
      initialTags: initialList,
      textSeparators: const [','],
      letterCase: LetterCase.normal,
      validator: (String? tag) {
        if (tag!.isEmpty) {
          return 'Field cannot be empty';
        } else if (tagController.getTags!.contains(tag)) {
          return 'You have already entered $tag';
        }
        return null;
      },
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return (context, sc, tags, onTagDelete) {
          return TextField(
            controller: tec,
            focusNode: fn,
            decoration: InputDecoration(
              isDense: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                borderRadius: BorderRadius.circular(8),
              ),
              hintStyle: const TextStyle(
                color: Color(0xff9CA0C1),
                fontWeight: FontWeight.w400,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0xffDEE2E6)),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: kColorPrimary),
                borderRadius: BorderRadius.circular(8),
              ),
              hintText: tagController.hasTags ? '' : hintText,
              errorText: error,
              prefixIcon: tags.isNotEmpty
                  ? SingleChildScrollView(
                      controller: sc,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: tags.map((String tag) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                              color: kColorPrimary,
                            ),
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Text(
                                    tag,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    //print("$tag selected");
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                InkWell(
                                  child: const Icon(
                                    Icons.cancel,
                                    size: 14.0,
                                    color: Color.fromARGB(255, 233, 233, 233),
                                  ),
                                  onTap: () {
                                    onTagDelete(tag);
                                  },
                                )
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    )
                  : null,
            ),
            onChanged: onChanged,
            onSubmitted: onSubmitted,
          );
        };
      },
    );
  }
}
