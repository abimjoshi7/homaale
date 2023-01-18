import 'package:cipher/core/app/root.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/bloc/support_help_bloc.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_req.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/models/support_help_topics.dart';
import 'package:cipher/features/account_settings/presentation/pages/help_legal_page/repositories/support_help_repositories.dart';
import 'package:cipher/widgets/custom_drop_down_field.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpAndLegalPage extends StatefulWidget {
  const HelpAndLegalPage({super.key});
  static const routeName = '/help-legal-page';

  @override
  State<HelpAndLegalPage> createState() => _HelpAndLegalPageState();
}

class _HelpAndLegalPageState extends State<HelpAndLegalPage> {
  String? problemStatement;
  String? reason;
  String? description;
  List<SupportHelpTopics>? list;
  int? topic;

  Future<void> getList() async {
    await context.read<SupportHelpRepositories>().getHelpTopicList().then(
          (value) => setState(
            () {
              list = value;
            },
          ),
        );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await getList();
      },
    );
    // Future.delayed(
    //   const Duration(),
    //   () => getList(),
    // );
    // getList().then((value) => list = value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final val = [
      'Somebody harassed me.',
      'Fraudulent Case',
      'Payment Issue',
      'Conflict with another HOMAALE member.',
      'Other'
    ];

    return BlocConsumer<SupportHelpBloc, SupportHelpState>(
      listener: (context, state) {
        if (state is SupportHelpSuccess) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
                heading: 'Success',
                content: 'Your report is registered successfully',
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                      context,
                      Root.routeName,
                      (route) => false,
                    ),
                isSuccess: true),
          );
        }
        if (state is SupportHelpFailure) {
          showDialog(
            context: context,
            builder: (context) => CustomToast(
              heading: 'Success',
              content: 'Your report cannot be registered.',
              onTap: () => Navigator.pop(context),
              isSuccess: false,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
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
                  'Help & Legal',
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
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Report a problem',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    CustomTextFormField(
                      hintText: 'Other',
                      onChanged: (p0) => setState(
                        () {
                          problemStatement = p0;
                        },
                      ),
                    ),
                    kHeight20,
                    const Text(
                      'Please Specify',
                      style: kPurpleText16,
                    ),
                    kHeight5,
                    CustomDropDownField(
                      list: list?.map((e) => e.topic).toList() ?? val,
                      hintText: 'Specify your reason',
                      onChanged: (value) => setState(
                        () {
                          reason = value;
                        },
                      ),
                    ),
                    kHeight20,
                    CustomFormField(
                      label: 'Problem Detail',
                      isRequired: false,
                      child: CustomTextFormField(
                        hintText: 'Please explain your problem briefly',
                        maxLines: 3,
                        onChanged: (p0) => setState(
                          () {
                            description = p0;
                          },
                        ),
                      ),
                    ),
                    kHeight50,
                    Center(
                      child: CustomElevatedButton(
                        callback: () async {
                          for (final element in list!) {
                            if (element.topic == reason) {
                              setState(() {});
                              topic = element.id;
                            }
                          }
                          final supportHelpReq = SupportHelpReq(
                            topic: topic,
                            details: description,
                            reason: reason,
                          );
                          context.read<SupportHelpBloc>().add(
                                SupportHelpInitiated(
                                  supportHelpReq: supportHelpReq,
                                ),
                              );
                          // final x = await context
                          //     .read<SupportHelpRepositories>()
                          //     .getHelpTopicList();
                          // print(x);
                          // final x = await SupportHelpRepositories()
                          //     .getHelpTopicList();
                          // print("qwe $x");
                        },
                        label: 'Save',
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
