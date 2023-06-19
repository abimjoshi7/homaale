import 'package:cipher/features/faq_and_data_deletion/faq_page.dart';
import 'package:cipher/features/support/presentation/widgets/report_page.dart';
import 'package:cipher/widgets/custom_app_bar.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../../../../core/mixins/the_modal_bottom_sheet.dart';
import '../../../account_settings/presentation/widgets/account_list_tile_section.dart';
import '../../../feedback/bloc/feedback_bloc.dart';
import '../../../feedback/bloc/feedback_event.dart';
import '../../../feedback/presentation/pages/feedback.dart';
import '../../../user_suspend/presentation/bloc/user_suspend_bloc.dart';
import '../../../user_suspend/presentation/pages/account_suspend_custom_tost.dart';
import '../bloc/support_ticket_type_options_bloc.dart';
import '../bloc/support_ticket_type_options_event.dart';

class HelpAndSupportPage extends StatefulWidget {
  static const routeName = '/help-and-support';

  const HelpAndSupportPage({Key? key}) : super(key: key);

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> with TheModalBottomSheet {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Help & Support', trailingWidget: SizedBox()),
      body: Column(
        children: [
          AccountListTileSection(
            onTap: () {
              Navigator.pushNamed(context, FaqPage.routeName);
            },
            icon: const Icon(
              Icons.question_mark,
            ),
            label: "FAQ's",
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
          AccountListTileSection(
            icon: const Icon(
              Icons.info_outline,
            ),
            label: 'Report a Problem',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              context.read<SupportTicketTypeOptionsBloc>().add(SupportTicketTypeOptionsLoaded(target: ''));
              context.read<UserSuspendBloc>().state.userAccountSuspension?.isSuspended == true
                  ? showDialog(
                      context: context,
                      builder: (context) => AccountSuspendCustomToast(
                        heading: 'ACCOUNT SUSPENDED',
                        content: 'User is suspended',
                      ),
                    )
                  : Navigator.pushNamed(context, CommonReportPage.routeName);
            },
          ),
          AccountListTileSection(
            icon: const Icon(
              Icons.feed_outlined,
            ),
            label: 'Feedback',
            trailingWidget: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
            onTap: () {
              context.read<FeedbackBloc>().add(FeedbackLoaded());
              showCustomBottomSheet(
                context: context,
                widget: const FeedbackPage(),
              );
            },
          ),
        ],
      ),
    );
  }
}
