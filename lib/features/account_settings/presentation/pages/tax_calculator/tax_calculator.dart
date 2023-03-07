import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/constants/extensions.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/data/models/tax_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/tax_calculator/presentation/manager/cubit/tax_calculator_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaxCalculator extends StatelessWidget {
  static const routeName = '/tax-calculator';
  const TaxCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<TaxCalculatorCubit, TaxCalculatorState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          Widget mainDisplay() {
            if (state is TaxCalculatorSuccess) {
              return Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    child: GridView(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorList[1],
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Annual Gross Salary',
                                style: kPurpleText16,
                              ),
                              Text(
                                state.taxRes.details?.annualGrossSalary
                                        .toString() ??
                                    '',
                                style: kText17,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorList[6],
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Taxable Income',
                                style: kPurpleText16,
                              ),
                              Text(
                                state.taxRes.details?.netTaxableIncome
                                        .toString() ??
                                    '',
                                style: kText17,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorList[1],
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Net Payable Tax',
                                style: kPurpleText16,
                              ),
                              Text(
                                state.taxRes.details?.netPayableTax
                                        .toString() ??
                                    '',
                                style: kText17,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: colorList[1],
                            ),
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Your Tax slab is:',
                                style: kPurpleText16,
                              ),
                              Text(
                                'Upto ${state.taxRes.details?.taxRate ?? ''}',
                                style: kText17,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Taxable Salary',
                                style: kPurpleText13,
                              ),
                              Text(
                                'Taxable Amount',
                                style: kPurpleText13,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.taxRes.data?.first.name?.toTitleCase() ??
                                    '',
                                style: kText15,
                              ),
                              Text(
                                state.taxRes.details?.netTaxableIncome
                                        .toString() ??
                                    '',
                                style: kText15,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Tax Rate',
                                style: kPurpleText13,
                              ),
                              Text(
                                'Tax Liability',
                                style: kPurpleText13,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.taxRes.details?.taxRate ?? '',
                                style: kText15,
                              ),
                              Text(
                                state.taxRes.data?.first.taxLiability
                                        .toString() ??
                                    '',
                                style: kText15,
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Net Tax Liability (yearly)',
                                style: kPurpleText13,
                              ),
                              Text(
                                state.taxRes.details?.netTaxLiabilityYearly
                                        .toString() ??
                                    '',
                                style: kText15,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Net Tax Liability (monthly)',
                                style: kPurpleText13,
                              ),
                              Text(
                                state.taxRes.details?.netTaxLiabilityMonthly
                                        .toString() ??
                                    '',
                                style: kText15,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  addVerticalSpace(20),
                  CustomElevatedButton(
                    callback: () {
                      context.read<TaxCalculatorCubit>().init();
                    },
                    label: 'Calculate Again',
                  )
                ],
              );
            } else {
              return const TaxFormSection();
            }
          }

          return Column(
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
              mainDisplay(),
            ],
          );
        },
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
                const CustomFormField(
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
                  callback: () async {
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
                  callback: () async {},
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
