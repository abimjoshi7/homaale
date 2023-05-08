import 'dart:developer';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../user/presentation/bloc/user_bloc.dart';
import '../../data/models/transactions_res.dart';
import '../bloc/transaction_bloc.dart';
import '../widgets/transaction_card.dart';
import 'views/views.dart';

class MyTransactionsPage extends StatefulWidget {
  static const routeName = "/my-transactions-page";
  const MyTransactionsPage({super.key});

  @override
  State<MyTransactionsPage> createState() => _MyTransactionsPageState();
}

class _MyTransactionsPageState extends State<MyTransactionsPage> {
  List<Transactions> list = [];

  final PagingController<int, Transactions> _controller = PagingController(
    firstPageKey: 1,
  );

  Color _buildColor(Transactions transactions, UserState user) {
    if (transactions.receiver!.fullName!
        .contains(user.taskerProfile!.fullName!)) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Icon _buildIcon(Transactions transactions, UserState user) {
    if (transactions.receiver!.fullName!
        .contains(user.taskerProfile!.fullName!)) {
      return Icon(
        Icons.keyboard_arrow_up_rounded,
      );
    } else {
      return Icon(
        Icons.keyboard_arrow_down_rounded,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    log("init");
    _controller.addPageRequestListener(
      (pageKey) => context.read<TransactionBloc>().add(
            TransactionLoaded(
              pageNumber: pageKey,
            ),
          ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Transactions",
        trailingWidget: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.file_present_outlined,
          ),
        ),
      ),
      body: BlocConsumer<TransactionBloc, TransactionState>(
        listener: (context, state) {
          if (state.theStates == TheStates.failure) {
            _controller.error = 'Error';
          }

          if (state.theStates == TheStates.success) {
            list = state.res!.result!;
            final lastPage = state.res!.totalPages!;
            final next = 1 + state.res!.current!;

            if (next > lastPage) {
              _controller.appendLastPage(list);
            } else {
              _controller.appendPage(list, next);
            }
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          // context.read<TransactionBloc>().add(
                          //       TransactionLoaded(
                          //         pageNumber: 1,
                          //       ),
                          //     );
                        },
                        icon: Icon(
                          Icons.filter_alt_outlined,
                          color: kColorSilver,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomDropDownField(
                            list: kTransactionStatus,
                            hintText: "Status",
                            borderRadius: 16,
                            onChanged: (value) {
                              context.read<TransactionBloc>().add(
                                    TransactionLoaded(
                                      pageNumber: 1,
                                      status: value?.toLowerCase(),
                                    ),
                                  );
                              _controller.refresh();
                            },
                          ),
                        ),
                      ),
                      addHorizontalSpace(
                        8,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CustomDropDownField(
                            list: kTransactionStatus,
                            hintText: "Dr/Cr",
                            borderRadius: 16,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      addHorizontalSpace(
                        8,
                      ),
                      InkWell(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(
                              2000,
                            ),
                            lastDate: DateTime(
                              2050,
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kColorGrey,
                            ),
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          constraints: BoxConstraints.loose(
                            Size(
                              100,
                              100,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("From"),
                                addHorizontalSpace(
                                  8,
                                ),
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: kColorSilver,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      addHorizontalSpace(
                        8,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kColorGrey,
                          ),
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                        ),
                        constraints: BoxConstraints.loose(
                          Size(
                            100,
                            100,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("To"),
                              addHorizontalSpace(
                                8,
                              ),
                              Icon(
                                Icons.calendar_today_outlined,
                                color: kColorSilver,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(
                  thickness: 0.8,
                ),
              ),
              ProfileRewardBalanceSection(user: "self"),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "03 Dec 2022, Sunday",
                      style: kHelper13,
                    ),
                    Expanded(
                      child: PagedListView(
                        pagingController: _controller,
                        builderDelegate: PagedChildBuilderDelegate(
                          itemBuilder: (context, Transactions item, index) =>
                              TransactionCard(
                            leadingWidget: Image.network(
                              item.paymentMethod?.logo ?? kNoImageNImg,
                            ),
                            actionName: item.transactionType?.toCapitalized(),
                            actionFrom: item.paymentMethod?.name,
                            price: item.amount,
                            priceColor: _buildColor(
                              item,
                              context.read<UserBloc>().state,
                            ),
                            priceIcon: _buildIcon(
                              item,
                              context.read<UserBloc>().state,
                            ),
                            time: "${DateFormat.yMMMd().format(
                              item.createdAt ?? DateTime.now(),
                            )}  ${DateFormat.jm().format(
                              item.createdAt ?? DateTime.now(),
                            )}",
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
