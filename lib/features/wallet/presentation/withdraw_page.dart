import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/billing_payment_page/data/model/linked_bank_response_dto.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/features/wallet/data/models/withdraw_req_res_dto.dart';
import 'package:cipher/features/wallet/presentation/bloc/wallet_bloc.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../billing_payment_page/presentation/add_payment_method_form.dart';

class WithdrawPage extends StatelessWidget {
  static const String routeName = '/withdraw-fund';

  const WithdrawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletBloc()..add(WalletLoaded()),
      child: WithdrawMainView(),
    );
  }
}

class WithdrawMainView extends StatefulWidget {
  const WithdrawMainView({super.key});

  @override
  State<WithdrawMainView> createState() => _WithdrawMainViewState();
}

class _WithdrawMainViewState extends State<WithdrawMainView> {
  LinkedBankDto selectedBankAccount = LinkedBankDto();

  // final amountController = TextEditingController();
  final noteController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<WalletBloc, WalletState>(
      listenWhen: (previous, current) {
        if (previous.withdrawState != WithdrawState.success && current.withdrawState == WithdrawState.success) {
          return true;
        } else if (previous.withdrawState != WithdrawState.failure && current.withdrawState == WithdrawState.failure) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) async {
        if (state.withdrawState == WithdrawState.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Withdraw fund success!',
              ),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }
        if (state.withdrawState == WithdrawState.failure) {
          final errMsg = await CacheHelper.getCachedString(kErrorLog);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errMsg ?? 'Something went wrong!',
              ),
              backgroundColor: Colors.red,
            ),
          );
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          switch (state.theStates) {
            case TheStates.success:
              return LoadingWidget(
                isLoading: state.withdrawState == WithdrawState.loading,
                child: Scaffold(
                  appBar: CustomAppBar(
                    appBarTitle: 'Withdraw fund',
                    trailingWidget: SizedBox(),
                  ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            color: kColorLightSkyBlue,
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              children: [
                                Text(
                                  'Your Current Balance',
                                  style: textTheme.displaySmall?.copyWith(fontSize: 12, color: kColorPrimary),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'NPR ',
                                    style: textTheme.displaySmall?.copyWith(
                                      color: kColorPrimary,
                                    ),
                                    children: [
                                      TextSpan(
                                        text:
                                            '${state.walletModel.isNotEmpty ? Decimal.parse(state.walletModel.first.availableBalance.toString()) : '0'}',
                                        style: textTheme.displayLarge
                                            ?.copyWith(color: kColorPrimary, fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          addVerticalSpace(16),
                          Expanded(
                            child: ListView(
                              children: [
                                Text(
                                  'Transfer to saved account',
                                  style: textTheme.titleMedium?.copyWith(color: kColorPrimary),
                                ),
                                context.read<BillsPaymentBloc>().state.linkedBankList.isEmpty
                                    ? Container(
                                        width: double.infinity,
                                        color: kColorGrey,
                                        padding: EdgeInsets.symmetric(vertical: 16),
                                        child: Center(
                                          child: Text('No saved account'),
                                        ),
                                      )
                                    : ListView.builder(
                                        shrinkWrap: true,
                                        padding: EdgeInsets.zero,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: context.read<BillsPaymentBloc>().state.linkedBankList.length,
                                        itemBuilder: (context, index) {
                                          return Card(
                                            child: SizedBox(
                                              height: 80,
                                              child: Center(
                                                child: ListTile(
                                                  onTap: () {
                                                    if (context
                                                            .read<BillsPaymentBloc>()
                                                            .state
                                                            .linkedBankList[index]
                                                            .isVerified ??
                                                        false) {
                                                      setState(() {
                                                        selectedBankAccount = context
                                                            .read<BillsPaymentBloc>()
                                                            .state
                                                            .linkedBankList[index];
                                                      });
                                                    } else {
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Selected account is not verified',
                                                          ),
                                                          backgroundColor: Colors.red,
                                                        ),
                                                      );
                                                    }
                                                  },
                                                  leading: SizedBox(
                                                    width: MediaQuery.of(context).size.width * 0.1,
                                                    child: Image.network(
                                                      context
                                                              .read<BillsPaymentBloc>()
                                                              .state
                                                              .linkedBankList[index]
                                                              .logo ??
                                                          kServiceImageNImg,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  title: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        '${context.read<BillsPaymentBloc>().state.linkedBankList[index].bankName}',
                                                        style: textTheme.bodyLarge,
                                                      ),
                                                      Text(
                                                        '${context.read<BillsPaymentBloc>().state.linkedBankList[index].bankAccountNumber}',
                                                        style: textTheme.bodyMedium,
                                                      ),
                                                    ],
                                                  ),
                                                  trailing: Icon(
                                                    selectedBankAccount.id ==
                                                            context
                                                                .read<BillsPaymentBloc>()
                                                                .state
                                                                .linkedBankList[index]
                                                                .id
                                                        ? Icons.radio_button_checked
                                                        : Icons.radio_button_off,
                                                    color: selectedBankAccount.id ==
                                                            context
                                                                .read<BillsPaymentBloc>()
                                                                .state
                                                                .linkedBankList[index]
                                                                .id
                                                        ? kColorAmber
                                                        : kColorLightGrey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                addVerticalSpace(8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () => Navigator.pushNamed(context, AddPaymentMethodForm.routeName),
                                      child: Text(
                                        '+ Add payment method',
                                        style: textTheme.titleMedium?.copyWith(color: kColorPrimary, fontSize: 14),
                                      ),
                                    ),
                                    Text(
                                      'View all',
                                      style: textTheme.titleSmall?.copyWith(
                                          color: kColorAmber, fontSize: 14, decoration: TextDecoration.underline),
                                    ),
                                  ],
                                ),
                                addVerticalSpace(16),
                                // RichText(
                                //     text: TextSpan(
                                //         text: 'Withdraw Amount',
                                //         style: textTheme.titleMedium?.copyWith(color: kColorPrimary),
                                //         children: [
                                //       TextSpan(
                                //         text: ' *',
                                //         style: textTheme.titleMedium?.copyWith(color: Colors.red),
                                //       ),
                                //     ])),
                                // addVerticalSpace(8),
                                // Text(
                                //   '(Transfer my take a few minutes and vary bank.)',
                                //   style: textTheme.displaySmall,
                                // ),
                                // addVerticalSpace(16),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //   children: [
                                //     SizedBox(
                                //       width: MediaQuery.of(context).size.width * 0.75,
                                //       child: CustomTextFormField(
                                //         controller: amountController,
                                //         hintText: 'eg. 100',
                                //         hintStyle: textTheme.displaySmall,
                                //         textInputType: TextInputType.number,
                                //         inputAction: TextInputAction.done,
                                //         validator: (amount) {
                                //           if (amountController.text.trim().isEmpty) {
                                //             return 'Required Field';
                                //           } else if (int.parse(amountController.text.trim()) < 100) {
                                //             return 'Amount cannot be less than 100!';
                                //           } else if (Decimal.parse(amountController.text.trim()) >
                                //               Decimal.parse(state.walletModel.first.availableBalance.toString())) {
                                //             return 'Greater than current balance!';
                                //           } else {
                                //             return null;
                                //           }
                                //         },
                                //       ),
                                //     ),
                                //     DropdownButton(
                                //       items: [
                                //         DropdownMenuItem(
                                //           child: Text('NPR'),
                                //         ),
                                //       ],
                                //       onChanged: (value) {},
                                //     )
                                //   ],
                                // ),
                                // addVerticalSpace(8),
                                // Container(
                                //   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                //   color: kColorLightSkyBlue,
                                //   child: Row(
                                //     crossAxisAlignment: CrossAxisAlignment.start,
                                //     children: [
                                //       Icon(
                                //         Icons.info_outline,
                                //         color: Colors.blue,
                                //         size: 20,
                                //       ),
                                //       addHorizontalSpace(4),
                                //       Expanded(
                                //         child: Text(
                                //           'The minimum amount that can be withdrawn from the account is NPR.100.',
                                //           maxLines: 2,
                                //           style: TextStyle(color: Colors.blue, fontSize: 12),
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // ),
                                // addVerticalSpace(16),
                                Text(
                                  'Add note',
                                  style: textTheme.titleMedium?.copyWith(color: kColorPrimary),
                                ),
                                CustomTextFormField(
                                  controller: noteController,
                                  maxLines: 4,
                                  hintText: 'Note',
                                  hintStyle: textTheme.displaySmall,
                                  inputAction: TextInputAction.done,
                                ),
                                addVerticalSpace(22),
                                CustomElevatedButton(
                                  theWidth: double.infinity,
                                  label: 'Proceed',
                                  callback: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (selectedBankAccount.id != null) {
                                        WithdrawReqResDto withdrawReqResDto = WithdrawReqResDto(
                                          // amount: amountController.text.trim(),
                                          bankAccount: selectedBankAccount.id,
                                          description: noteController.text.trim(),
                                        );

                                        context.read<WalletBloc>().add(WithdrawFundEvent(withdrawReqResDto));
                                      } else {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Transfer account required!',
                                            ),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                                addVerticalSpace(22),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            default:
              return CardLoading(height: 200);
          }
        },
      ),
    );
  }
}
