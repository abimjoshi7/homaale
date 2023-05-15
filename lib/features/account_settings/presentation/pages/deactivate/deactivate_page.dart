import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/bloc/user_deactive_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/bloc/user_deactive_state.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/const_info_list.dart';
import 'bloc/user_deactive_event.dart';

class DeactivatePage extends StatelessWidget {
  const DeactivatePage({super.key});
  static const routeName = '/deactivate-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarTitle: 'Deactivate',
        trailingWidget: SizedBox(),
      ),
      body: Column(
        children: [
          DeactivationHeaderInfo(),
          const Expanded(child: DeactivateFormSection()),
        ],
      ),
    );
  }
}

class DeactivateFormSection extends StatefulWidget {
  const DeactivateFormSection({super.key});

  @override
  State<DeactivateFormSection> createState() => _DeactivateFormSectionState();
}

class _DeactivateFormSectionState extends State<DeactivateFormSection> {
  final _key = GlobalKey<FormState>();
  String? reason;
  DateTime? reactivationDate;
  String? explaination;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Form(
        key: _key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  label: 'I am leaving because',
                  isRequired: true,
                  child: CustomDropDownField<String?>(
                    onChanged: (p0) => setState(
                      () {
                        final options = deactiveReasonList.firstWhere(
                          (element) => p0 == element,
                        );
                        reason = options;
                      },
                    ),
                    list: List.generate(
                      deactiveReasonList.length,
                      (index) => deactiveReasonList[index],
                    ),
                    hintText: "Subject",
                  ),
                ),
                addVerticalSpace(10),
                CustomFormField(
                  label: 'Description',
                  child: CustomTextFormField(
                    validator: validateNotEmpty,
                    onSaved: (p0) => setState(
                      () {
                        explaination = p0;
                      },
                    ),
                    maxLines: 3,
                    hintText: 'Please explain your reason..',
                  ),
                ),
              ],
            ),
            kHeight50,
            BlocBuilder<UserDeactiveBloc, UserDeactiveState>(
                builder: (context, stateUD) {
              return CustomElevatedButton(
                callback: () async {
                  if (_key.currentState!.validate() && reason != null) {
                    _key.currentState!.save();
                    context.read<UserDeactiveBloc>().add(DeactiveActionPost(
                          reason: reason ?? "",
                        ));
                    await showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => CustomToast(
                        heading: reason == null ? 'Failure' : 'Success',
                        content: reason == null
                            ? "Select Reason first"
                            : 'Deactivation Success',
                        onTap: () {
                          reason == null
                              ? Navigator.pop(context)
                              : Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  SignInPage.routeName,
                                  (route) => false,
                                );
                        },
                        isSuccess: reason == null ? false : true,
                      ),
                    );
                    //   }
                    //     await showDialog(
                    //       context: context,
                    //       builder: (context) => CustomToast(
                    //         heading: 'Failure',
                    //         content:
                    //             'Deactivation Failure please choose reason first.',
                    //         onTap: () {
                    //           Navigator.pop(context);
                    //         },
                    //         isSuccess: false,
                    //       ),
                    //     );
                  }
                },
                label: ' Deactivate',
              );
            }),
            kHeight10,
            CustomElevatedButton(
              callback: () {
                Navigator.pop(context);
              },
              label: 'Cancel',
              mainColor: Colors.white,
              borderColor: kColorPrimary,
              textColor: kColorPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

class DeactivationHeaderInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Deactivating your Homaale account',
              style: Theme.of(context).textTheme.headlineSmall),
          kHeight20,
          Text(
            'If you want to take a break from Homaale, you can deactivate your account. You can activate your account any time.',
          )
        ],
      ),
    );
  }
}
