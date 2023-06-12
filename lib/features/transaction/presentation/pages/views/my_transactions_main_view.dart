import 'dart:io';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/profile/presentation/widgets/widgets.dart';
import 'package:cipher/features/transaction/data/models/transactions_res.dart';
import 'package:cipher/features/transaction/data/repositories/transaction_repository.dart';
import 'package:cipher/features/transaction/presentation/bloc/transaction_bloc.dart';
import 'package:cipher/features/transaction/presentation/widgets/transaction_card.dart';
import 'package:cipher/features/user/presentation/bloc/user/user_bloc.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'views.dart';

class MyTransactionsMainView extends StatefulWidget {
  const MyTransactionsMainView({super.key});

  @override
  State<MyTransactionsMainView> createState() => _MyTransactionsMainViewState();
}

class _MyTransactionsMainViewState extends State<MyTransactionsMainView> {
  final _controller = ScrollController();
  late String _localPath;
  late bool _permissionReady;
  late TargetPlatform? platform;
  var _openResult = 'Unknown';
  late File file;

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
    _controller.addListener(_onScroll);
    if (Platform.isAndroid) {
      platform = TargetPlatform.android;
    } else {
      platform = TargetPlatform.iOS;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller
      ..removeListener(_onScroll)
      ..dispose();
  }

  Future<bool> _checkPermission() async {
    if (platform == TargetPlatform.android) {
      final status = await Permission.storage.status;
      if (status == PermissionStatus.denied ||
          status == PermissionStatus.permanentlyDenied)
        await Permission.storage.request();
      // await openAppSettings();
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> _prepareSaveDir() async {
    _localPath = (await _findLocalPath())!;

    print(_localPath);
    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      await savedDir.create();
    }
  }

  Future<String?> _findLocalPath() async {
    if (platform == TargetPlatform.android) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return directory.path + Platform.pathSeparator + 'Download';
    }
  }

  Future<void> openFile(File file) async {
    // final filePath = _localPath + "/" + "codeplayon.csv";
    final filePath = file.path;
    final result = await OpenFilex.open(filePath);

    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "My Transactions",
        trailingWidget:
            // *** To be implemented ***
            IconButton(
          onPressed: () async {
            showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text('File Downloaded'),
                content: Text('Do you want to view the file?'),
                actions: [
                  TextButton(
                    onPressed: () async {
                      _permissionReady = await _checkPermission();
                      if (_permissionReady) {
                        await _prepareSaveDir();
                        print("Downloading");
                        try {
                          print("Download Completed.");
                          // openFile(q);
                        } catch (e) {
                          print(
                            e.toString(),
                          );
                          print("Download Failed.\n\n" + e.toString());
                        }
                      } else {
                        print(123);
                      }
                    },
                    child: Text('Open'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            );
          },
          icon: Icon(
            Icons.file_present_outlined,
          ),
        ),
      ),
      body: Column(
        children: [
          FiltersHeaderView(),
          Expanded(
            child: BlocBuilder<TransactionBloc, TransactionState>(
              builder: (context, state) {
                if (state.theStates == TheStates.success)
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Divider(
                          thickness: 0.8,
                        ),
                      ),
                      ProfileRewardBalanceSection(user: "self"),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "03 Dec 2022, Sunday",
                                style: kHelper13,
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: _controller,
                                  itemCount: state.hasReachedMax == true
                                      ? state.transactions.length
                                      : state.transactions.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index >= state.transactions.length) {
                                      context
                                          .read<TransactionBloc>()
                                          .add(TransactionLoaded());
                                      return const BottomLoader();
                                    } else {
                                      return TransactionCard(
                                        leadingWidget: Image.network(
                                          state.transactions[index]
                                                  .paymentMethod?.logo ??
                                              kNoImageNImg,
                                        ),
                                        actionName: state
                                            .transactions[index].transactionType
                                            ?.toCapitalized(),
                                        actionFrom: state.transactions[index]
                                            .paymentMethod?.name,
                                        price: state.transactions[index].amount,
                                        priceColor: _buildColor(
                                          state.transactions[index],
                                          context.read<UserBloc>().state,
                                        ),
                                        priceIcon: _buildIcon(
                                          state.transactions[index],
                                          context.read<UserBloc>().state,
                                        ),
                                        time: "${DateFormat.yMMMd().format(
                                          state.transactions[index].createdAt ??
                                              DateTime.now(),
                                        )}  ${DateFormat.jm().format(
                                          state.transactions[index].createdAt ??
                                              DateTime.now(),
                                        )}",
                                        paymentMethod: state.transactions[index]
                                            .paymentMethod?.type,
                                        transactionId:
                                            state.transactions[index].id,
                                        sender: state.transactions[index].sender
                                            ?.fullName,
                                        reciever: state.transactions[index]
                                            .receiver?.fullName,
                                        status:
                                            state.transactions[index].status,
                                      );
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                return SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) context.read<TransactionBloc>().add(TransactionLoaded());
  }

  bool get _isBottom {
    if (!_controller.hasClients) return false;
    final maxScroll = _controller.position.maxScrollExtent;
    final currentScroll = _controller.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
