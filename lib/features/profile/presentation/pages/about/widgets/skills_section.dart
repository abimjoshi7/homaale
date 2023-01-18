import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/pages/about/widgets/widgets.dart';
import 'package:cipher/widgets/custom_modal_sheet_drawer_icon.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomModalSheetDrawerIcon(),
                        Padding(
                          padding: kPadding20,
                          child: Column(
                            children: [
                              CustomFormField(
                                label: 'Skills',
                                child: Row(
                                  children: [
                                    SkillBox(label: 'Planting'),
                                    kWidth20,
                                    SkillBox(label: 'Washing'),
                                  ],
                                ),
                                isRequired: false,
                              ),
                              CustomFormField(
                                label: 'Suggested Skills',
                                child: Row(
                                  children: [
                                    SkillBox(label: 'Planting'),
                                    kWidth20,
                                    SkillBox(label: 'Washing'),
                                  ],
                                ),
                                isRequired: false,
                              ),
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
                  );
                },
                icon: Icon(
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
