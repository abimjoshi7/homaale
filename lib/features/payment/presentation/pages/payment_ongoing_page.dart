import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import '../../../../core/app/root.dart';
import 'dart:io';
import 'package:cipher/features/payment/presentation/bloc/payment_verify_state.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/enums.dart';
import '../../../../widgets/custom_toast.dart';
import '../../../home/presentation/pages/home.dart';
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
      // trailingWidget: BlocBuilder<PaymentVerifyBloc, PaymentVerifyState>(
      //     builder: (context, paymentVerifyState) {
      //   print('payment verify ${paymentVerifyState.paymentVerify?.status}');
      //   return Row(
      //     children: [
      //       if (paymentVerifyState.paymentVerify?.status != null)
      //         TextButton(
      //             onPressed: () {
      //               Navigator.pushNamedAndRemoveUntil(context, Root.routeName,(route)=>false);
      //             },
      //             child: Text('Go To Home'))
      //     ],
      //   );
      // }),
      // ),
      body: BlocBuilder<PaymentBloc, PaymentIntentState>(
          builder: (context, state) {
        return state.theState == TheStates.initial
            ? state.theState == TheStates.failure
                ? Text('Try Again!')
                : CardLoading(height: 100)
            : InAppWebView(
//                 initialData: InAppWebViewInitialData(data:
//                 """
// <!DOCTYPE html>
// <html lang="en">
//     <head>
//         <meta charset="UTF-8">
//         <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
//     </head>
//     <body>
//         <h1>JavaScript Handlers</h1>
//         <script>
//             window.addEventListener("flutterInAppWebViewPlatformReady", function(event) {
//                 window.flutter_inappwebview.callHandler('handlerFoo')
//                   .then(function(result) {
//                     // print to the console the data coming
//                     // from the Flutter side.
//                     console.log(JSON.stringify(result));
//
//                     window.flutter_inappwebview
//                       .callHandler('handlerFooWithArgs', 1, true, ['bar', 5], {foo: 'baz'}, result);
//                 });
//             });
//         </script>
//     </body>
// </html>
//                       """),

                /// Need to enable this lines of COD
                ///
                initialUrlRequest: URLRequest(
                    url:
                        Uri.parse(state.paymentIntent?.data?.paymentUrl ?? "")),
                contextMenu: contextMenu,
                initialOptions: options,
                onWebViewCreated: (controller) {
                  controller.addJavaScriptHandler(
                      handlerName: 'handlerFoo',
                      callback: (args) {
                        // return data to the JavaScript side!
                        return {'bar': 'bar_value', 'baz': 'baz_value'};
                      });

                  controller.addJavaScriptHandler(
                      handlerName: 'handlerFooWithArgs',
                      callback: (args) {
                        print(args);
                        // it will print: [1, true, [bar, 5], {foo: baz}, {bar: bar_value, baz: baz_value}]
                      });
                },
                onConsoleMessage: (controller, consoleMessage) {
                  print(consoleMessage);
                  // it will print: {message: {"bar":"bar_value","baz":"baz_value"}, messageLevel: 1}
                  /// need to change this condition when args is ready from backend
                  if (consoleMessage.messageLevel == 1)
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomToast(
                        heading: 'Success',
                        content: 'Payment Success , Continue to App. ',
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, Root.routeName, (route) => false);

                          // Navigator.pushNamed(context, Home.routeName);
                        },
                        isSuccess: true,
                      ),
                    );
                },
              );
      }),
    );
  }
}
