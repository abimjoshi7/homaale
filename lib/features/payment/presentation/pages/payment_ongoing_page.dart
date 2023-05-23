import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import '../../../../core/app/root.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../core/constants/enums.dart';
import '../../../../widgets/custom_toast.dart';
import '../bloc/payment_bloc.dart';

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

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Payments',
        trailingWidget: SizedBox(),
      ),
      body: BlocBuilder<PaymentBloc, PaymentIntentState>(
          builder: (context, state) {
        return state.theState == TheStates.initial
            ? state.theState == TheStates.failure
                ? Text('Try Again!')
                : CardLoading(height: 100)
            : InAppWebView(
                initialUrlRequest: URLRequest(
                    url:
                        Uri.parse(state.paymentIntent?.data?.paymentUrl ?? "")),
                contextMenu: contextMenu,
                initialOptions: options,
                onWebViewCreated: (controller) {
                  controller.addJavaScriptHandler(
                      handlerName: 'handlerFoo',
                      callback: (args) {
                        return args;
                      });

                  controller.addJavaScriptHandler(
                      handlerName: 'handlerFooWithArgs',
                      callback: (args) {
                        // print(args);
                        if (args.length > 3)
                          showDialog(
                            barrierColor: Colors.white,
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => CustomToast(
                              heading: 'Continue to App.',
                              content: 'Go to Home',
                              onTap: () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, Root.routeName, (route) => false);
                              },
                              isSuccess: true,
                            ),
                          );
                      });
                },
              );
      }),
    );
  }
}
