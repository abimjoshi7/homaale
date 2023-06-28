import 'dart:async';

import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/dio/dio_helper.dart';
import 'package:cipher/features/sign_in/presentation/widgets/widgets.dart';
import 'package:cipher/features/sign_up/presentation/pages/sign_up.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/network_info/network_bloc.dart';
import '../../../../core/network_info/network_event.dart';
import '../../../error_pages/no_internet_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});
  static const routeName = '/sign-in-page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late StreamSubscription subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  getConnectivity() =>
      subscription = Connectivity().onConnectivityChanged.listen(
        (ConnectivityResult result) async {
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox();
            setState(() => isAlertSet = true);
          }
        },
      );
  showDialogBox() => showCupertinoDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: CupertinoAlertDialog(
            title: const Text('No Connection'),
            content: const CommonErrorContainer(
              assetsPath: 'assets/no_internet_connection.png',
              errorTile: 'Oops, No Internet Connection.',
              errorDes:
                  "Make sure Wi-Fi or cellular data is turned on and then try again.",
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  Navigator.pop(context, 'Cancel');
                  setState(() => isAlertSet = false);
                  isDeviceConnected =
                      await InternetConnectionChecker().hasConnection;
                  if (!isDeviceConnected && isAlertSet == false) {
                    showDialogBox();
                    setState(() => isAlertSet = true);
                  }
                },
                child: const Text('Try Again !'),
              ),
            ],
          ),
        ),
      );
  @override
  void initState() {
    getConnectivity();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NetworkBloc()..add(NetworkObserve()),
      child: SignInScaffold(
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  addVerticalSpace(10.0),
                  InkWell(
                    onTap: () async {
                      DioHelper().refreshToken();
                    },
                    child: Text('Welcome',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ),
                  Text(
                    'Login to your account',
                    style: Theme.of(context).textTheme.bodySmall,
                    // kHelper13,
                  ),
                  // addVerticalSpace(20),
                  SignInFormFields(),
                  // addVerticalSpace(MediaQuery.of(context).size.height * 0.026),
                  // const FingerPrintSection(), //TODO:implement fingerprint login
                  addVerticalSpace(20.0),
                  const SocialLoginSection(),
                  addVerticalSpace(10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Don't have any account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            SignUpPage.routeName,
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
