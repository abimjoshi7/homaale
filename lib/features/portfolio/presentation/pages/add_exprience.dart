import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_education.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddExperience extends StatelessWidget {
  static const routeName = "/add-experience";
  const AddExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                  "Add Experience",
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
                      "Title",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: "Please enter the title",
                    ),
                    kHeight20,
                    const Text(
                      "Description",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      maxLines: 3,
                      hintText: "Write something...",
                    ),
                    kHeight20,
                    const Text(
                      "Employment Type",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomFormContainer(
                      label: "Please Select",
                      trailingWidget: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                    kHeight20,
                    const Text(
                      "Company Name",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: "Eg: Cagtu",
                    ),
                    kHeight20,
                    const Text(
                      "Location",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: "Eg: New Baneshwor, Kathmandu",
                      prefixWidget: Icon(
                        Icons.location_on_outlined,
                        color: kColorPrimary,
                      ),
                    ),
                    kHeight20,
                    Row(
                      children: [
                        CustomCheckBox(
                          onTap: () {},
                          boxColor: Color(0xff0693E3),
                          isChecked: true,
                        ),
                        kWidth10,
                        Text("Save as location"),
                      ],
                    ),
                    kHeight20,
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Issued Date",
                                style: kLabelPrimary,
                              ),
                              kHeight5,
                              CustomFormContainer(
                                label: "03/06/1999",
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
                              const Text(
                                "Expiry Date",
                                style: kLabelPrimary,
                              ),
                              kHeight5,
                              CustomFormContainer(
                                label: "03/06/1999",
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
                          AddEducation.routeName,
                        );
                      },
                      label: "Add",
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
