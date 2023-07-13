import 'package:cipher/core/constants/coma_seperated_on_digit.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/tax_calculator/data/repositories/tax_repositories.dart';
import 'package:cipher/features/tax_calculator/presentation/manager/cubit/tax_calculator_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/const_info_list.dart';
import 'sections/tax_section.dart';

class TaxCalculator extends StatelessWidget {
  static const routeName = '/tax-calculator';
  const TaxCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaxCalculatorCubit(
        TaxRepositories(),
      ),
      child: Scaffold(
        appBar: CustomAppBar(
          appBarTitle: 'Tax Calculator',
          trailingWidget: SizedBox(),
        ),
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
                            margin: EdgeInsets.all(10),
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
                                Text(
                                  'Annual Gross Salary',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                ComaSeparatedOnDigit(
                                    digitText: state
                                            .taxRes.details?.annualGrossSalary
                                            .toString() ??
                                        "")
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
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
                                Text(
                                  'Taxable Income',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                ComaSeparatedOnDigit(
                                  digitText: state
                                          .taxRes.details?.netTaxableIncome
                                          .toString() ??
                                      "",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
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
                                Text(
                                  '  Net Payable Tax Yearly',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  state.taxRes.details?.netPayableTaxYearly
                                          .toString() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
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
                                Text(
                                  'Your Tax slab is:',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  'Upto ${state.taxRes.details?.taxRate ?? ''}',
                                  style: Theme.of(context).textTheme.bodySmall,
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
                              children: [
                                Text(
                                  'Taxable Salary',
                                  style: kPurpleText13,
                                ),
                                Text(
                                  'Taxable Amount',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.taxRes.data?.first.name
                                          ?.toTitleCase() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  state.taxRes.details?.netTaxableIncome
                                          .toString() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax Rate',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  'Tax Liability',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  state.taxRes.details?.taxRate ?? '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                Text(
                                  state.taxRes.data?.first.taxLiability
                                          .toString() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Net Tax Liability (yearly)',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  state.taxRes.details?.netTaxLiabilityYearly
                                          .toString() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Net Tax Liability (monthly)',
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                Text(
                                  state.taxRes.details?.netTaxLiabilityMonthly
                                          .toString() ??
                                      '',
                                  style: Theme.of(context).textTheme.bodySmall,
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
                    ),
                    addVerticalSpace(10),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.info_outline,
                            color: Colors.orangeAccent,
                            size: 18,
                          ),
                          addHorizontalSpace(10),
                          Expanded(
                            child: Text(
                              'Note: This tool is made for general tax calculation only. Information from this tool should not be used for any other purpose.',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall
                                  ?.copyWith(fontSize: 12),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                          addHorizontalSpace(10),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const TaxFormSection();
              }
            }

            return Column(
              children: [
                mainDisplay(),
              ],
            );
          },
        ),
      ),
    );
  }
}
