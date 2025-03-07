import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tax_calculator/data/models/tax_req.dart';
import 'package:cipher/features/tax_calculator/presentation/manager/cubit/tax_calculator_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final genderController = TextEditingController();
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
    genderController.dispose();
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
                const CustomFormField(
                  label: 'Calculate your tax',
                  child: Text(
                    'This tax calculator tool is designed as per the new salary tax which was announced during Budget Announcement of 2078/2079.',
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomFormField(
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
                    ),
                    addHorizontalSpace(
                      8,
                    ),
                    Flexible(
                      child: CustomFormField(
                        label: 'Gender',
                        isRequired: true,
                        child: CustomDropDownField(
                          list: const [
                            'Male',
                            'Female',
                          ],
                          hintText: 'Specify',
                          onChanged: (value) {
                            setState(
                              () {
                                genderController.text = value!;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                CustomFormField(
                  label: 'Income',
                  isRequired: true,
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
                      CustomFormField(
                        label: "Salary",
                        isRequired: true,
                        child: CustomTextFormField(
                            hintText: 'Salary in Rs',
                            controller: salaryController,
                            validator: validateNotEmpty,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,
                        ),
                      ),
                      CustomFormField(
                        label: 'Festival Bonus',
                        child: CustomTextFormField(
                            hintText: 'Festival Bonus',
                            controller: festivalBonusController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,
                        ),
                      ),
                      CustomFormField(
                        label: 'Allowance',
                        child: CustomTextFormField(
                            hintText: 'Allowance',
                            controller: allowanceController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,
                        ),
                      ),
                      CustomFormField(
                        label: 'Others',
                        child: CustomTextFormField(
                            hintText: 'Others',
                            controller: othersController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomFormField(
                  label: 'Deduction',
                  child: Wrap(
                    runSpacing: 10,
                    children: [
                      CustomFormField(
                        label: 'Provident fund',
                        child: CustomTextFormField(
                            hintText: 'Provident fund',
                            controller: pfController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,


                        ),
                      ),
                      CustomFormField(
                        label: 'Citizen Investment Trust',
                        child: CustomTextFormField(
                            hintText: 'Citizen Investment Trust',
                            controller: citController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,

                        ),
                      ),
                      CustomFormField(
                        label: 'Life Insurance Amount',
                        child: CustomTextFormField(
                            hintText: 'Life Insurance',
                            controller: lInsuranceController,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          textInputType: TextInputType.number,

                        ),
                      ),
                      CustomFormField(
                        label: 'Medical Insurance Amount',
                        child: CustomTextFormField(
                          hintText: 'Medical Insurance',
                          controller: mInsuranceController,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textInputType: TextInputType.number,
                          inputAction: TextInputAction.done,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomElevatedButton(
                  callback: () async {
                    if (_key.currentState!.validate()) {
                      if (incomeTypeController.text.isEmpty &&
                          mstatusController.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => CustomToast(
                            heading: 'Error',
                            content: 'Please specify the fields',
                            onTap: () {},
                            isSuccess: false,
                          ),
                        );
                      } else {
                        if (mstatusController.text.isNotEmpty &&
                            incomeTypeController.text.isNotEmpty &&
                            salaryController.text.isNotEmpty) {
                          await context.read<TaxCalculatorCubit>().calculateTax(
                                TaxReq(
                                  maritalStatus: mstatusController.text,
                                  salary: double.parse(salaryController.text),
                                  incomeType: incomeTypeController.text,
                                  allowance: double.parse(
                                    allowanceController.text.isEmpty
                                        ? '0'
                                        : allowanceController.text,
                                  ),
                                  festivalBonus: double.parse(
                                    festivalBonusController.text.isEmpty
                                        ? '0'
                                        : festivalBonusController.text,
                                  ),
                                  others: double.parse(
                                    othersController.text.isEmpty
                                        ? '0'
                                        : othersController.text,
                                  ),
                                  pf: double.parse(
                                    pfController.text.isEmpty
                                        ? '0'
                                        : pfController.text,
                                  ),
                                  cit: double.parse(
                                    citController.text.isEmpty
                                        ? '0'
                                        : citController.text,
                                  ),
                                  lifeInsurance: double.parse(
                                    lInsuranceController.text.isEmpty
                                        ? '0'
                                        : lInsuranceController.text,
                                  ),
                                  medicalInsurance: double.parse(
                                    mInsuranceController.text.isEmpty
                                        ? '0'
                                        : mInsuranceController.text,
                                  ),
                                  gender: genderController.text,
                                ),
                              );
                        }
                      }
                    }
                  },
                  label: 'Calculate Tax',
                ),
                addVerticalSpace(10),
                CustomElevatedButton(
                  callback: () async {
                    salaryController.clear();
                    incomeTypeController.clear();
                    allowanceController.clear();
                    festivalBonusController.clear();
                    othersController.clear();
                    pfController.clear();
                    citController.clear();
                    lInsuranceController.clear();
                    mInsuranceController.clear();
                    genderController.clear();
                  },
                  label: 'Reset',
                  mainColor: Colors.white,
                  textColor: kColorPrimary,
                  borderColor: kColorPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
