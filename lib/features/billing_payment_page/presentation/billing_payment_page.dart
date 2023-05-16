import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/billing_payment_page/presentation/add_payment_method_form.dart';
import 'package:cipher/features/billing_payment_page/presentation/bloc/bills_payment_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class BillingAndPaymentPage extends StatelessWidget {
  const BillingAndPaymentPage({super.key});
  static const routeName = '/billing-payment-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: SizedBox(),
            child: const Text(
              'Billing & Payments',
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
          Padding(
            padding: const EdgeInsets.all(10),
            child: BillsPaymentList(),
          ),
        ],
      ),
    );
  }
}

class BillsPaymentList extends StatefulWidget {
  const BillsPaymentList({super.key});

  @override
  State<BillsPaymentList> createState() => _BillsPaymentListState();
}

class _BillsPaymentListState extends State<BillsPaymentList> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<BillsPaymentBloc, BillsPaymentState>(
      builder: (context, state) {
        switch (state.billsPaymentStatus) {
          case BillsPaymentStatus.failure:
            return Text('failure');
          case BillsPaymentStatus.success:
            if (state.linkedBankList.isNotEmpty) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Linked Payment Methods',
                        style: kPurpleText16,
                      ),
                      context.watch<BillsPaymentBloc>().state.linkedBankList.isNotEmpty
                          ? TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, AddPaymentMethodForm.routeName);
                              },
                              child: Text(
                                '+ Add',
                                style: textTheme.bodyMedium,
                              ),
                            )
                          : SizedBox(),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.78,
                    child: ListView.builder(
                      shrinkWrap: true,
                      controller: _scrollController,
                      padding: EdgeInsets.zero,
                      physics: AlwaysScrollableScrollPhysics(),
                      itemCount: state.hasReachedMax ? state.linkedBankList.length : state.linkedBankList.length + 1,
                      itemBuilder: (context, index) {
                        if (index >= state.linkedBankList.length) {
                          return const BottomLoader();
                        } else {
                          return Card(
                            child: SizedBox(
                              height: 80,
                              child: Center(
                                child: ListTile(
                                  leading: SizedBox(
                                    width: MediaQuery.of(context).size.width * 0.1,
                                    child: Image.network(
                                      state.linkedBankList[index].logo ?? kServiceImageNImg,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  title: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${state.linkedBankList[index].bankName}',
                                        style: textTheme.bodyLarge,
                                      ),
                                      Text(
                                        '${state.linkedBankList[index].bankAccountNumber}',
                                        style: textTheme.bodyMedium,
                                      ),
                                    ],
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) => Container(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CustomModalSheetDrawerIcon(),
                                              Text(
                                                'Remove Linked Payment Method?',
                                                style: textTheme.titleMedium,
                                              ),
                                              kHeight20,
                                              CustomElevatedButton(
                                                label: 'Remove',
                                                callback: () {
                                                  Navigator.pop(context);
                                                  context
                                                      .read<BillsPaymentBloc>()
                                                      .add(DeleteLinkedMethod(bankId: state.linkedBankList[index].id!));
                                                },
                                              ),
                                              kHeight10,
                                              CustomElevatedButton(
                                                label: 'Cancel',
                                                callback: () {
                                                  Navigator.pop(context);
                                                },
                                                mainColor: Colors.white,
                                                borderColor: kColorPrimary,
                                                textColor: kColorPrimary,
                                              ),
                                              addVerticalSpace(30)
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.more_vert),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xffFFDFA6),
                        radius: 80,
                        child: Image.asset('assets/sad_face.png'),
                      ),
                      kHeight20,
                      Text(
                        'No Linked Account Found',
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(color: kColorPrimary),
                      ),
                      kHeight10,
                      Text(
                        'Please link your bank/ wallet account to further continue',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      kHeight10,
                      CustomElevatedButton(
                        label: 'Add account',
                        callback: () {
                          Navigator.pushNamed(context, AddPaymentMethodForm.routeName);
                        },
                      )
                    ],
                  ),
                ),
              );
            }
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<BillsPaymentBloc>().add(FetchLinkedBankAccount());
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
