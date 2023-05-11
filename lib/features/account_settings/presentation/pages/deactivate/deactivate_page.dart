import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/cubit/deactivate_cubit.dart';
import 'package:cipher/features/sign_in/presentation/pages/pages.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

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

  List<String> deactiveReasonList = <String>[
    'I am deactivating the account temporarily.',
    'I did not find Homeaale helpful for me',
    'I have another Homaale account.',
    'I am not satisfied with the services of Homaale.',
    'other'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding20,
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
                        // print(reason);
                      },
                    ),
                    list: List.generate(
                      deactiveReasonList.length,
                      (index) => deactiveReasonList[index],
                    ),
                    hintText: "Subject",
                  ),
                ),
                // CustomFormField(
                //   label: 'How long',
                //   isRequired: true,
                //   child: InkWell(
                //     onTap: () async {
                //       await showDatePicker(
                //         context: context,
                //         initialDate: DateTime.now(),
                //         firstDate: DateTime(1700),
                //         lastDate: DateTime(2080),
                //       ).then(
                //         (value) => setState(
                //           () {
                //             reactivationDate = value;
                //           },
                //         ),
                //       );
                //     },
                //     child: const CustomFormContainer(
                //       hintText: 'Specify time period',
                //     ),
                //   ),
                // ),
                CustomFormField(
                  label: 'Description',
                  child: CustomTextFormField(
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
            BlocConsumer<DeactivateCubit, DeactivateState>(
              listener: (context, state) async {
                final error = await CacheHelper.getCachedString(kErrorLog);
                // if (state is DeactivateSuccess) {
                // if (!mounted) return;
                await showDialog(
                  context: context,
                  builder: (context) => CustomToast(
                    heading: 'Success',
                    content: 'Deactivation Success',
                    onTap: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        SignInPage.routeName,
                        (route) => false,
                      );
                    },
                    isSuccess: true,
                  ),
                );
                // } else {
                // if (!mounted) return;
                //   await showDialog(
                //     context: context,
                //     builder: (context) => CustomToast(
                //       heading: 'Failure',
                //       content: error ?? 'Deactivation cannot be completed.',
                //       onTap: () => Navigator.pop(context),
                //       isSuccess: false,
                //     ),
                //   );
                // }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      context.read<DeactivateCubit>().initiateDeactivate(
                            reason: reason ?? "",
                          );
                    }
                    print(reason);
                  },
                  label: ' Deactivate',
                );
              },
            ),
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
