import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_certifications.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddEducation extends StatelessWidget {
  const AddEducation({super.key});
  static const routeName = '/add-education';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                    ),
                  ),
                  const Text(
                    'Add Education',
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                    ),
                  ),
                ],
              ),
              const CustomHorizontalDivider(),
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'School',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        hintText: 'Eg: Tribhuvan University',
                      ),
                      kHeight20,
                      const Text(
                        'Description',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        maxLines: 3,
                        hintText: 'Write something...',
                      ),
                      kHeight20,
                      const Text(
                        'Degree',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        hintText: "Eg: Bachelor's",
                      ),
                      kHeight20,
                      const Text(
                        'Field of Study',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        hintText: 'Eg: Business',
                      ),
                      kHeight20,
                      const Text(
                        'Location',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomFormContainer(
                        label: 'Eg: New Baneshwor, Kathmandu',
                        leadingWidget: Icon(
                          Icons.location_on_outlined,
                          color: kColorPrimary,
                        ),
                      ),
                      kHeight20,
                      const Text(
                        'Employment Type',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomFormContainer(
                        label: 'Please Select',
                        trailingWidget:
                            Icon(Icons.keyboard_arrow_down_outlined),
                      ),
                      kHeight20,
                      Row(
                        children: [
                          CustomCheckBox(
                            onTap: () {},
                            boxColor: const Color(0xff0693E3),
                            isChecked: true,
                          ),
                          kWidth10,
                          const Text('Save as location'),
                        ],
                      ),
                      kHeight20,
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Issued Date',
                                  style: kLabelPrimary,
                                ),
                                kHeight5,
                                CustomFormContainer(
                                  label: '03/06/1999',
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          kWidth20,
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      'End Date',
                                      style: kLabelPrimary,
                                    ),
                                    Text(
                                      ' (Expected)',
                                      style: kHelper1,
                                    )
                                  ],
                                ),
                                kHeight5,
                                const CustomFormContainer(
                                  label: '03/06/1999',
                                  leadingWidget: Icon(
                                    Icons.calendar_month_rounded,
                                    color: kColorPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      kHeight20,
                      CustomElevatedButton(
                        callback: () {
                          Navigator.pushNamed(
                            context,
                            AddCertifications.routeName,
                          );
                        },
                        label: 'Add',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
