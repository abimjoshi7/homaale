import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_branch_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/bank_names_response_dto.dart';
import 'package:cipher/features/billing_payment_page/data/model/save_payment_method_dto.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/widgets/loading_widget.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AddPaymentMethodForm extends StatefulWidget {
  static const String routeName = '/add-payment-method-form';
  const AddPaymentMethodForm({super.key});

  @override
  State<AddPaymentMethodForm> createState() => _AddPaymentMethodFormState();
}

class _AddPaymentMethodFormState extends State<AddPaymentMethodForm> {
  final accountNameController = TextEditingController(); // in case of wallet, this is username
  final accountNumberController = TextEditingController(); // in case of wallet, this is phone number
  final _formKey = GlobalKey<FormState>();

  BankNamesResponseDto bankName = BankNamesResponseDto();
  BankBranchResponseDto branch = BankBranchResponseDto();

  bool typeSelected = false;
  bool isPrimary = false;
  bool walletTypeError = false;
  bool branchTypeError = false;

  String methodType = '';

  @override
  void initState() {
    super.initState();
    context.read<BillsPaymentBloc>().add(InitializeState());
  }

  void onBankNameSelected(String? bank) {
    if (bank != null) {
      setState(() {
        bankName = context.read<BillsPaymentBloc>().state.bankNameList.firstWhere((element) => element.name == bank);
        branch = BankBranchResponseDto();
        walletTypeError = false;
      });
      if (methodType == 'Bank') {
        context.read<BillsPaymentBloc>().add(FetchBankBranch(bankId: bankName.id!));
      }
    } else {
      return;
    }
  }

  void onBankBranchSelected(String? bnch) {
    if (bnch != null) {
      setState(() {
        branch = context.read<BillsPaymentBloc>().state.bankBranchList.firstWhere((element) => element.name == bnch);
        branchTypeError = false;
      });
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BillsPaymentBloc, BillsPaymentState>(
      listenWhen: (previous, current) {
        if (previous.savePaymentMethodStatus != SavePaymentMethodStatus.success &&
            current.savePaymentMethodStatus == SavePaymentMethodStatus.success) {
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state.savePaymentMethodStatus == SavePaymentMethodStatus.success) {
          Navigator.pop(context);
        }
      },
      child: BlocBuilder<BillsPaymentBloc, BillsPaymentState>(
        builder: (context, state) {
          return LoadingWidget(
            isLoading:
                context.read<BillsPaymentBloc>().state.savePaymentMethodStatus == SavePaymentMethodStatus.loading,
            child: Scaffold(
              appBar: CustomAppBar(
                appBarTitle: 'Add Payment Method',
                trailingWidget: SizedBox(),
              ),
              body: Form(
                key: _formKey,
                child: ListView(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  children: [
                    CustomFormField(
                      label: 'Method type',
                      isRequired: true,
                      child: CustomDropDownField(
                        list: ['Wallet', 'Bank'],
                        hintText: 'Select method type',
                        onChanged: (value) {
                          setState(() {
                            methodType = value.toString();
                            typeSelected = true;
                            bankName = BankNamesResponseDto();
                            branch = BankBranchResponseDto();
                            accountNameController.clear();
                            accountNumberController.clear();
                          });
                          context.read<BillsPaymentBloc>().add(FetchBankNames(isWallet: methodType == 'Wallet'));
                        },
                      ),
                    ),
                    addVerticalSpace(8),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      height: typeSelected ? MediaQuery.of(context).size.height * 0.6 : 0,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          CustomFormField(
                            isRequired: true,
                            label: '${methodType == 'Wallet' ? 'Wallet Type' : 'Bank Name'}',
                            child: DropdownSearch<String?>(
                              selectedItem: bankName.name,
                              enabled: context.watch<BillsPaymentBloc>().state.bankNameStatus == BankNameStatus.success,
                              items: List<String?>.generate(context.read<BillsPaymentBloc>().state.bankNameList.length,
                                  (index) => context.read<BillsPaymentBloc>().state.bankNameList[index].name),
                              onChanged: (String? bank) {
                                onBankNameSelected(bank);
                              },
                              popupProps: PopupProps.menu(
                                showSearchBox: context.read<BillsPaymentBloc>().state.bankNameList.length > 5,
                                constraints: BoxConstraints.loose(Size(double.infinity, 300)),
                              ),
                            ),
                          ),
                          addVerticalSpace(8),
                          if (methodType == 'Wallet')
                            SizedBox()
                          else ...[
                            addVerticalSpace(8),
                            CustomFormField(
                              isRequired: true,
                              label: 'Branch',
                              child: DropdownSearch<String?>(
                                selectedItem: branch.name,
                                enabled: context.watch<BillsPaymentBloc>().state.bankBranchNameStatus ==
                                    BankBranchNameStatus.success,
                                items: List<String?>.generate(
                                    context.read<BillsPaymentBloc>().state.bankBranchList.length,
                                    (index) => context.read<BillsPaymentBloc>().state.bankBranchList[index].name),
                                onChanged: (String? branch) {
                                  onBankBranchSelected(branch);
                                },
                                popupProps: PopupProps.menu(
                                  showSearchBox: context.read<BillsPaymentBloc>().state.bankBranchList.length > 5,
                                  constraints: BoxConstraints.loose(Size(double.infinity, 300)),
                                ),
                              ),
                            ),
                            addVerticalSpace(4),
                            branchTypeError
                                ? Text(
                                    'Required Field',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red[900]),
                                  )
                                : SizedBox.shrink(),
                            addVerticalSpace(8),
                          ],
                          CustomFormField(
                            isRequired: true,
                            label: '${methodType == 'Wallet' ? 'Wallet name' : 'Bank Account Name'}',
                            child: CustomTextFormField(
                              controller: accountNameController,
                              validator: validateNotEmpty,
                            ),
                          ),
                          addVerticalSpace(8),
                          CustomFormField(
                            isRequired: true,
                            label: '${methodType == 'Wallet' ? 'Account number' : 'Bank Account Number'}',
                            child: CustomTextFormField(
                              controller: accountNumberController,
                              validator: validateNotEmpty,
                            ),
                          ),
                          addVerticalSpace(4),
                          walletTypeError
                              ? Text(
                                  'Required Field',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.red[900]),
                                )
                              : SizedBox.shrink(),
                          addVerticalSpace(8),
                          Row(
                            children: [
                              CustomCheckBox(
                                isChecked: isPrimary,
                                onTap: () {
                                  setState(() {
                                    isPrimary = !isPrimary;
                                  });
                                },
                              ),
                              addHorizontalSpace(4),
                              Text('Set as primary')
                            ],
                          ),
                          addVerticalSpace(16),
                          CustomElevatedButton(
                            label: 'Save',
                            callback: () {
                              if (_formKey.currentState!.validate()) {
                                if (bankName.id != null) {
                                  if (methodType == 'Wallet') {
                                    SavePaymentMethodDto savePaymentMethodDto = SavePaymentMethodDto(
                                      bankAccountName: accountNameController.text.trim(),
                                      bankAccountNumber: accountNumberController.text.trim(),
                                      bankName: bankName.id,
                                      branchName: branch.id,
                                      isPrimary: isPrimary,
                                    );
                                    context
                                        .read<BillsPaymentBloc>()
                                        .add(SavePaymentMethodEvent(savePaymentMethodDto: savePaymentMethodDto));
                                  } else {
                                    if (branch.id != null) {
                                      SavePaymentMethodDto savePaymentMethodDto = SavePaymentMethodDto(
                                        bankAccountName: accountNameController.text.trim(),
                                        bankAccountNumber: accountNumberController.text.trim(),
                                        bankName: bankName.id,
                                        branchName: branch.id,
                                        isPrimary: isPrimary,
                                      );
                                      context
                                          .read<BillsPaymentBloc>()
                                          .add(SavePaymentMethodEvent(savePaymentMethodDto: savePaymentMethodDto));
                                    } else {
                                      setState(() {
                                        branchTypeError = true;
                                      });
                                    }
                                  }
                                } else {
                                  setState(() {
                                    walletTypeError = true;
                                  });
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
