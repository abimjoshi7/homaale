import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/content_client/presentation/cubit/privacy_policy/privacy_policy_cubit.dart';
import 'package:cipher/features/content_client/presentation/widgets/widgets.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatefulWidget {
  const PrivacyPolicyPage({
    super.key,
  });
  static const String routeName = '/privacy-policy-page';

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  final _contentClientTitle = 'Homaale Privacy & Policy';
  @override
  void initState() {
    super.initState();
    context.read<PrivacyPolicyCubit>().getPrivacyPolicyStatement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Privacy Policy'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Divider(
              thickness: 0.5,
              color: Color(0xffCED4DA),
            ),
            addVerticalSpace(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.88,
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      BlocConsumer<PrivacyPolicyCubit, PrivacyPolicyState>(
                        listener: (_, state) async {
                          if (state.theStates == TheStates.failure) {
                            showDialog(
                              context: context,
                              builder: (_) => CustomToast(
                                heading: 'Failure',
                                content:
                                    'Failed to load updated privacy policy.',
                                onTap: () => {},
                                isSuccess: false,
                              ),
                            );
                          }
                        },
                        builder: (_, state) {
                          if (state.theStates == TheStates.success) {
                            return ContentClientWidget(
                                state: state,
                                date: DateFormat.yMMMEd()
                                    .format(state.contentClient!.createdAt!),
                                contentClientTitle: _contentClientTitle);
                          }
                          if (state.theStates == TheStates.failure) {
                            return ContentClientWidget(
                                state: state,
                                date: DateFormat.yMMMEd()
                                    .format(state.contentClient!.createdAt!),
                                contentClientTitle: _contentClientTitle);
                          }

                          if (state.theStates == TheStates.initial) {
                            return const Center(
                              child: CardLoading(
                                height: 200,
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
