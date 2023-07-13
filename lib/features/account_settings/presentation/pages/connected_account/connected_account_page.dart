// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/data/repositories/connected_account_repo.dart';
import 'package:cipher/features/account_settings/presentation/cubit/connected_account_cubit.dart';
import 'package:cipher/features/account_settings/presentation/widgets/widgets.dart';
import 'package:cipher/features/error_pages/no_internet_page.dart';
import 'package:cipher/features/sign_in/presentation/cubit/google_sign_in_cubit.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/widgets/widgets.dart';

class ConnectedAccountPage extends StatelessWidget {
  const ConnectedAccountPage({super.key});
  static const routeName = '/connected-account-page';

  @override
  Widget build(BuildContext context) {
    return ConnectedAccountPageView();
  }
}

class ConnectedAccountPageView extends StatefulWidget {
  const ConnectedAccountPageView({super.key});

  @override
  State<ConnectedAccountPageView> createState() =>
      _ConnectedAccountPageViewState();
}

class _ConnectedAccountPageViewState extends State<ConnectedAccountPageView> {
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: "Connected Accounts",
        trailingWidget: SizedBox.shrink(),
      ),
      body: BlocBuilder<ConnectedAccountCubit, ConnectedAccountState>(
        builder: (context, state) {
          if (state.states == TheStates.loading)
            return Center(
              child: CustomLoader(),
            );
          if (state.states == TheStates.success) {
            var list = state.accountList;
            var isGoogle = list.any(
              (element) => element.provider!.contains("google"),
            );
            var isFacebook = list.any(
              (element) => element.provider!.contains("facebook"),
            );
            return Column(
              children: [
                ConnectedAccountCard(
                  label: "Google",
                  buttonText: isGoogle ? "Disconnect" : "Connect",
                  description: isGoogle
                      ? list
                          .firstWhere(
                              (element) => element.provider!.contains("google"))
                          .uid!
                      : "Sign in with Google",
                  imagePath: "assets/logos/google_logo.png",
                  onTap: () async {
                    isGoogle
                        ? await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text(
                                "Confirm",
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Please enter your password",
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  addVerticalSpace(
                                    8,
                                  ),
                                  CustomTextFormField(
                                    controller: passwordController,
                                  ),
                                  addVerticalSpace(
                                    8,
                                  ),
                                  BlocListener<ConnectedAccountCubit,
                                      ConnectedAccountState>(
                                    listenWhen: (previous, current) {
                                      if (previous.states !=
                                              TheStates.success &&
                                          current.states == TheStates.success) {
                                        return true;
                                      }
                                      if (previous.states !=
                                              TheStates.failure &&
                                          current.states == TheStates.failure) {
                                        return true;
                                      }
                                      return false;
                                    },
                                    listener: (context, state) async {
                                      if (state.states == TheStates.success) {
                                        await context
                                            .read<ConnectedAccountCubit>()
                                            .getList();
                                        Navigator.pop(context);
                                      }

                                      // if (state.states == TheStates.failure) {
                                      //   ScaffoldMessenger.of(context)
                                      //       .showSnackBar(
                                      //     SnackBar(
                                      //       content: Text(
                                      //         "Error",
                                      //       ),
                                      //     ),
                                      //   );
                                      // }
                                    },
                                    child: CustomElevatedButton(
                                      callback: () async {
                                        await context
                                            .read<ConnectedAccountCubit>()
                                            .unlinkAccount(
                                              id: list
                                                  .firstWhere((element) =>
                                                      element.provider!
                                                          .contains("google"))
                                                  .id!,
                                              password: passwordController.text,
                                            );
                                      },
                                      label: "Continue",
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        : await context
                            .read<GoogleSignInCubit>()
                            .signIn(context)
                            .then((value) async => await context
                                .read<ConnectedAccountCubit>()
                                .getList());
                  },
                ),
                ConnectedAccountCard(
                  label: "Facebook",
                  buttonText: isFacebook ? "Disconnect" : "Connect",
                  description: isFacebook
                      ? list
                          .firstWhere((element) =>
                              element.provider!.contains("facebook"))
                          .uid!
                      : "Sign in with Facebook",
                  imagePath: "assets/logos/fb_logo.png",
                  onTap: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Feature coming soon...",
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }
          return CommonErrorContainer(
            errorTile: "Connected account not available.",
          );
        },
      ),
    );
  }
}
