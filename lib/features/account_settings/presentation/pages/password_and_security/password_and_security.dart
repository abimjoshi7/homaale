import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/password_and_security/change_password_modal_sheet.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/mixins/the_modal_bottom_sheet.dart';
import '../../../../security_question/presentation/bloc/security_bloc.dart';
import '../../../../security_question/presentation/bloc/security_event.dart';
import '../../../../security_question/presentation/pages/security_modal_sheet.dart';

class PasswordAndSecurity extends StatelessWidget  with TheModalBottomSheet {
  const PasswordAndSecurity({super.key});
  static const routeName = '/password-and-security';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          appBarTitle: 'Password & Security',
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kHeight20,
                    Text(
                      'Password',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    kHeight5,
                    const Text(
                      'You will be asked to enter password before logging in Homaale.',
                      // style: kHelper13,
                    ),
                    kHeight20,
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 200,
                            child: CustomElevatedButton(
                              callback: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                      bottom: MediaQuery.of(context)
                                          .viewInsets
                                          .bottom,
                                    ),
                                    child: const ChangePasswordModalSheet(),
                                  ),
                                );
                              },
                              label: 'Change password',
                            ),
                          ),
                        ],
                      ),
                    ),
                    kHeight20,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: AddPhoneNumberModalSheet(
                              updateText: 'Update Phone',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Add new phone number',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (context) => Padding(
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: AddPhoneNumberModalSheet(
                              updateText: 'Update Email',
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Update email',
                              style: Theme.of(context).textTheme.headlineSmall),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                    addVerticalSpace(20),
                    InkWell(
                      onTap: () {
                        context.read<SecurityBloc>().add(SecurityInitiated());
                        showCustomBottomSheet(
                          context: context,
                          widget: const SecurityModalSheet(),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Security Question',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall),
                              Icon(
                                Icons.edit,
                                size: 20,
                              ),
                            ],
                          ),
                          Text(
                              'Answer a question you choose to confirm it’s you.'),
                        ],
                      ),
                    ),

                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             const Text('Two Factor Authentication'),
                    //             Switch(
                    //               value: false,
                    //               onChanged: (value) {},
                    //             ),
                    //           ],
                    //         ),
                    //         kHeight5,
                    //         const Text(
                    //           'Add an extra layer of security to block unauthorized access and protect your account.',
                    //           style: kHelper13,
                    //         ),
                    //         kHeight20,
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             const Text(
                    //               'Authenticator App Code',
                    //             ),
                    //             OutlinedButton(
                    //               onPressed: () {
                    //                 showModalBottomSheet(
                    //                   constraints: const BoxConstraints(
                    //                     maxHeight: 750,
                    //                     minWidth: double.infinity,
                    //                   ),
                    //                   isScrollControlled: true,
                    //                   context: context,
                    //                   builder: (context) => const AuthenticatorAppCode(),
                    //                 );
                    //               },
                    //               child: const Text(
                    //                 'Setup',
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         kHeight5,
                    //         const Text(
                    //           "Enter a code generated by Google authenticator app to confirm it's you.",
                    //           style: kHelper13,
                    //         ),
                    //         kHeight20,
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             const Text('SMS Recovery'),
                    //             OutlinedButton(
                    //               onPressed: () {},
                    //               child: const Text(
                    //                 'Setup',
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //         kHeight5,
                    //         const Text(
                    //           "Recieve a four digit code by text message to confirm it's you",
                    //           style: kHelper13,
                    //         ),
                    //         kHeight20,
                    //         Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             const Text(
                    //               'Security Question',
                    //               style: kPurpleText16,
                    //             ),
                    //             Switch(
                    //               value: false,
                    //               onChanged: (value) {},
                    //             ),
                    //           ],
                    //         ),
                    //         kHeight5,
                    //         const Text(
                    //           "Answer a question you choose to confirm it's you.",
                    //           style: kHelper13,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // CustomElevatedButton(
                    //   callback: () {},
                    //   label: 'Save',
                    // ),
                    // kHeight50,
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
