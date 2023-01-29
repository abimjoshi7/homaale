import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tagsController = TextfieldTagsController();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Skills'),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) => Padding(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CustomModalSheetDrawerIcon(),
                          Padding(
                            padding: kPadding20,
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Skills',
                                      style: kPurpleText16,
                                    ),
                                    kHeight5,
                                    CustomTagTextField(
                                      initialList: const [
                                        'Planting',
                                        'Washing',
                                      ],
                                      tagController: tagsController,
                                      hintText: 'Enter your skills',
                                    ),
                                  ],
                                ),
                                kHeight20,
                                // CustomFormField(
                                //   label: 'Suggested Skills',
                                //   isRequired: false,
                                //   child: Row(
                                //     children: const [
                                //       SkillBox(label: 'Planting'),
                                //       kWidth20,
                                //       SkillBox(label: 'Washing'),
                                //     ],
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          CustomElevatedButton(
                            callback: () {},
                            label: 'Add',
                          ),
                          kHeight50,
                        ],
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 18,
                ),
              ),
            ],
          ),
          Row(
            children: const [
              SkillBox(
                label: 'Planting',
              ),
              kWidth10,
              SkillBox(
                label: 'Washing',
              ),
              kWidth10,
              SkillBox(
                label: 'Cleaning',
              ),
            ],
          )
        ],
      ),
    );
  }
}
