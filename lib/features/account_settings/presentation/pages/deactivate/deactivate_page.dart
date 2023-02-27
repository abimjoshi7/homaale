import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/cache/cache_helper.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/validations/validate_not_empty.dart';
import 'package:cipher/features/account_settings/presentation/pages/deactivate/cubit/deactivate_cubit.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeactivatePage extends StatelessWidget {
  const DeactivatePage({super.key});
  static const routeName = '/deactivate-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          kHeight50,
          CustomHeader(
            leadingWidget: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
            trailingWidget: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            child: const Text(
              'Deactivate',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(
                  0xff212529,
                ),
              ),
            ),
          ),
          const Divider(),
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
      padding: kPadding20,
      child: Form(
        key: _key,
        child: Column(
          children: [
            Column(
              children: [
                CustomFormField(
                  label: 'I am leaving because',
                  isRequired: true,
                  child: CustomTextFormField(
                    validator: validateNotEmpty,
                    onSaved: (p0) => setState(
                      () {
                        reason = p0;
                      },
                    ),
                    hintText: 'Specify the reason',
                  ),
                ),
                CustomFormField(
                  label: 'How long',
                  isRequired: true,
                  child: InkWell(
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1700),
                        lastDate: DateTime(2080),
                      ).then(
                        (value) => setState(
                          () {
                            reactivationDate = value;
                          },
                        ),
                      );
                    },
                    child: const CustomFormContainer(
                      hintText: 'Specify time period',
                    ),
                  ),
                ),
                CustomFormField(
                  label: 'Please explain further',
                  child: CustomTextFormField(
                    onSaved: (p0) => setState(
                      () {
                        explaination = p0;
                      },
                    ),
                    maxLines: 3,
                    hintText: 'Please explain your problem briefly',
                  ),
                ),
              ],
            ),
            kHeight50,
            BlocConsumer<DeactivateCubit, DeactivateState>(
              listener: (context, state) async {
                final error = await CacheHelper.getCachedString(kErrorLog);
                if (state is DeactivateSuccess) {
                  if (!mounted) return;
                  await showDialog(
                    context: context,
                    builder: (context) => CustomToast(
                      heading: 'Success',
                      content: 'Deactivation Success',
                      onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context,
                        Root.routeName,
                        (route) => false,
                      ),
                      isSuccess: true,
                    ),
                  );
                } else {
                  if (!mounted) return;
                  await showDialog(
                    context: context,
                    builder: (context) => CustomToast(
                      heading: 'Failure',
                      content: error ?? 'Deactivation cannot be completed.',
                      onTap: () => Navigator.pop(context),
                      isSuccess: false,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return CustomElevatedButton(
                  callback: () {
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();
                      context.read<DeactivateCubit>().initiateDeactivate(
                        {
                          'reason': reason,
                          'reactivate_date': reactivationDate,
                        },
                      );
                    }
                  },
                  label: 'Request Deactivation',
                );
              },
            ),
            kHeight20,
            CustomElevatedButton(
              callback: () {
                Navigator.pop(context);
              },
              label: 'Cancel',
              mainColor: Colors.transparent,
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
        children: const [
          Text('Deactivating your Homaale account', style: kPurpleText19),
          kHeight20,
          Text(
            'If you want to take a break from Homaale, you can deactivate your account. You can activate your account after 5 days of deactivation time.',
          )
        ],
      ),
    );
  }
}
