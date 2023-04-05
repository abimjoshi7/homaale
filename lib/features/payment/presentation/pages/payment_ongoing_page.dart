import 'package:dependencies/dependencies.dart';
import '../../../../core/app/root.dart';
import 'dart:io';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/enums.dart';
import '../bloc/payment_bloc.dart';
import '../bloc/payment_verify_bloc.dart';

class PaymentOnGoingPage extends StatefulWidget {
  static const routeName = '/payment-ongoing';

  const PaymentOnGoingPage({Key? key}) : super(key: key);

  @override
  State<PaymentOnGoingPage> createState() => _PaymentOnGoingPageState();
}

class _PaymentOnGoingPageState extends State<PaymentOnGoingPage> {
  InAppWebViewController? _webViewController;
  ContextMenu? contextMenu;

  @override
  void initState() {
    super.initState();
    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              androidId: 1,
              iosId: "1",
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                var selectedText = await _webViewController?.getSelectedText();
                await _webViewController?.clearFocus();
                await _webViewController?.evaluateJavascript(
                    source: "window.alert('You have selected: $selectedText')");
              })
        ],
        options: ContextMenuOptions(hideDefaultSystemContextMenuItems: false),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await _webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },
        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = (Platform.isAndroid)
              ? contextMenuItemClicked.androidId
              : contextMenuItemClicked.iosId;
          print("onContextMenuActionItemClicked: " +
              id.toString() +
              " " +
              contextMenuItemClicked.title);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        centerTitle: true,
        title: const Text(
          'Payments',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 1,
        leading: BlocBuilder<PaymentVerifyBloc, PaymentVerifyState>(
            builder: (context, paymentVerifyState) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () async {
                  Navigator.pop(context);
                },
              ),
              if (paymentVerifyState.paymentVerify?.status == 'success')
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Root.routeName);
                    },
                    child: Text('Go To Home'))
            ],
          );
        }),
      ),
      body: BlocBuilder<PaymentBloc, PaymentIntentState>(
          builder: (context, state) {
            print('paymentUrl:${state.paymentIntent?.data?.paymentUrl}');
        return state.theState == TheStates.initial
            ? state.theState == TheStates.failure
                ? Text('Try Again!')
                : CardLoading(height: 100)
            : InAppWebView(
                initialUrlRequest: URLRequest(
                    url:
                        Uri.parse(state.paymentIntent?.data?.paymentUrl ?? "")),
                contextMenu: contextMenu,
                initialOptions: InAppWebViewGroupOptions(
                  crossPlatform: InAppWebViewOptions(),
                ),
                onWebViewCreated: (InAppWebViewController controller) {
                  _webViewController = controller;
                },
              );
      }),
    );
  }
}
