import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/portfolio/presentation/pages/add_exprience.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AddPortfolio extends StatelessWidget {
  const AddPortfolio({super.key});
  static const routeName = '/add-portfolio';

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
                    'Add Portfolio',
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
                        'Title',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        hintText: 'Please enter the title',
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
                        'Issued Date',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      CustomTextFormField(
                        prefixWidget: GestureDetector(
                          onTap: () async {
                            await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2012),
                              lastDate: DateTime(2050),
                            );
                          },
                          child: const Icon(
                            Icons.calendar_month,
                            color: kColorPrimary,
                          ),
                        ),
                        hintText: '03/06/1999',
                        onSaved: (p0) async {},
                      ),
                      kHeight20,
                      const Text(
                        'Credential URL',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const CustomTextFormField(
                        hintText: 'URL',
                      ),
                      kHeight20,
                      const Text(
                        'Gallery',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const Text('Add relevant images or videos'),
                      kHeight5,
                      SizedBox(
                        height: 150,
                        child: Card(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images.png'),
                                kHeight20,
                                const Text(
                                  'Upload or Browse image',
                                ),
                                kHeight10,
                                const Text(
                                  'Maximum Image Size 20 MB',
                                  style: kHelper1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      kHeight20,
                      const Text(
                        'Files',
                        style: kLabelPrimary,
                      ),
                      kHeight5,
                      const Text('Add relevant images or videos'),
                      kHeight5,
                      SizedBox(
                        height: 150,
                        child: Card(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/qwe.png'),
                                kHeight20,
                                const Text(
                                  'Upload or Browse image',
                                ),
                                kHeight10,
                                const Text(
                                  'Maximum Image Size 20 MB',
                                  style: kHelper1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      kHeight20,
                      CustomElevatedButton(
                        callback: () {
                          Navigator.pushNamed(
                            context,
                            AddExperience.routeName,
                          );
                        },
                        label: 'Add',
                      )
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
