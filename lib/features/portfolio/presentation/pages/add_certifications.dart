import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_education.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddCertifications extends StatelessWidget {
  static const routeName = "/add-certifications";
  const AddCertifications({super.key});

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
                  "Add Certifications",
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
                      "Name",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: "Eg: Certified Gardener",
                    ),
                    kHeight20,
                    const Text(
                      "Issuing Organization",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: "Eg: Cagtu",
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
                    Row(
                      children: [
                        CustomCheckBox(
                          onTap: () {},
                          boxColor: Color(0xff0693E3),
                          isChecked: true,
                        ),
                        kWidth10,
                        Text("This certificate does not expire"),
                      ],
                    ),
                    kHeight20,
                    const Text(
                      "Credential Id",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    const CustomTextFormField(
                      hintText: "Eg: 213224-212-212",
                    ),
                    kHeight20,
                    const Text(
                      "Certification URL",
                      style: kLabelPrimary,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: "Eg: https//www.cagtu.com.np",
                      prefixWidget: Icon(
                        Icons.location_on_outlined,
                        color: kColorPrimary,
                      ),
                    ),
                    kHeight20,
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
