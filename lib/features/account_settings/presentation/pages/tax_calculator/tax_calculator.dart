import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TaxCalculator extends StatelessWidget {
  static const routeName = '/tax-calculator';
  const TaxCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          addVerticalSpace(50),
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Tax Calculator',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
          const TaxFormSection(),
        ],
      ),
    );
  }
}

class TaxFormSection extends StatefulWidget {
  const TaxFormSection({
    super.key,
  });

  @override
  State<TaxFormSection> createState() => _TaxFormSectionState();
}

class _TaxFormSectionState extends State<TaxFormSection> {
  final mstatusController = TextEditingController();
  final incomeTypeController = TextEditingController();
  final salaryController = TextEditingController();
  final festivalBonusController = TextEditingController();
  final allowanceController = TextEditingController();
  final othersController = TextEditingController();
  final pfController = TextEditingController();
  final citController = TextEditingController();
  final lInsuranceController = TextEditingController();
  final mInsuranceController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  void dispose() {
    mstatusController.dispose();
    incomeTypeController.dispose();
    salaryController.dispose();
    festivalBonusController.dispose();
    allowanceController.dispose();
    othersController.dispose();
    pfController.dispose();
    citController.dispose();
    lInsuranceController.dispose();
    mInsuranceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _key,
            child: Column(
              children: [
                CustomFormField(
                  isRequired: false,
                  label: 'Calculate your tax',
                  child: Text(
                    'This tax calculator tool is designed as per the new salary tax which was announced during Budget Announcement of 2078/2079.',
                  ),
                ),
                CustomFormField(
                  label: 'Marital Status',
                  isRequired: true,
                  child: CustomDropDownField(
                    list: const [
                      'Married',
                      'Unmarried',
                    ],
                    hintText: 'Specify',
                    onChanged: (value) {
                      setState(
                        () {
                          mstatusController.text = value!;
                        },
                      );
                    },
                  ),
                ),
                CustomFormField(
                  label: 'Income',
                  isRequired: false,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      CustomDropDownField(
                        list: const [
                          'Yearly',
                          'Monthly',
                        ],
                        hintText: 'Specify',
                        onChanged: (value) {
                          setState(
                            () {
                              incomeTypeController.text = value!;
                            },
                          );
                        },
                      ),
                      CustomTextFormField(
                        hintText: 'Salary in Rs',
                        controller: salaryController,
                        validator: validateNotEmpty,
                      ),
                      CustomTextFormField(
                        hintText: 'Festival Bonus',
                        controller: festivalBonusController,
                      ),
                      CustomTextFormField(
                        hintText: 'Allowance',
                        controller: allowanceController,
                      ),
                      CustomTextFormField(
                        hintText: 'Others',
                        controller: othersController,
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'Deduction',
                  isRequired: false,
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      CustomTextFormField(
                        hintText: 'Provident fund',
                        controller: pfController,
                      ),
                      CustomTextFormField(
                        hintText: 'Citizen Investment Trust',
                        controller: citController,
                      ),
                      CustomTextFormField(
                        hintText: 'Life Insurance',
                        controller: lInsuranceController,
                      ),
                      CustomTextFormField(
                        hintText: 'Medical Insurance',
                        controller: mInsuranceController,
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  callback: () {
                    if (_key.currentState!.validate()) {
                      if (incomeTypeController.text.isEmpty &&
                          mstatusController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomToast(
                            heading: 'Error',
                            content: 'Please specify the dropdown fields',
                            onTap: () {},
                            isSuccess: false,
                          ),
                        );
                      } else {
                        final req = {};
                      }
                    }
                  },
                  label: 'Calculate Tax',
                ),
                addVerticalSpace(10),
                CustomElevatedButton(
                  callback: () {},
                  label: 'Reset',
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
