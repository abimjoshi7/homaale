// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:cipher/features/support/presentation/bloc/support_ticket_bloc.dart';
import 'package:cipher/features/support/presentation/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/custom_app_bar.dart';

class SupportTicketPage extends StatefulWidget {
  static const String routeName = '/support-ticket-page';
  const SupportTicketPage({super.key});

  @override
  State<SupportTicketPage> createState() => _SupportTicketPageState();
}

class _SupportTicketPageState extends State<SupportTicketPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    context.read<SupportTicketBloc>().add(SupportTicketInitialEvent());
    setState(() {});
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Support'),
      body: Column(
        children: <Widget>[
          const Divider(
            thickness: 0.5,
            color: Color(0xffCED4DA),
          ),
          addVerticalSpace(16),
          Container(
            height: 145.43,
            width: 150.0,
            child: Image.asset(
              "assets/support/support_img.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'If you are facing any trouble, create a Ticket so we can identify and solve the issue right away.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
          ),
          addVerticalSpace(24.0),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       CustomOutlinedButton(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Icon(
          //               Icons.add,
          //               color: Color(0xff868E96),
          //               size: 24.0,
          //             ),
          //             addHorizontalSpace(8.0),
          //             Text(
          //               'Create Ticket',
          //               style:
          //                   TextStyle(color: Color(0xff868E96), fontSize: 14),
          //             ),
          //           ],
          //         ),
          //       ),
          //       addHorizontalSpace(26.0),
          //       CustomOutlinedButton(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: <Widget>[
          //             Icon(
          //               Icons.phone_in_talk_rounded,
          //               color: Color(0xff868E96),
          //               size: 24.0,
          //             ),
          //             addHorizontalSpace(8.0),
          //             Text(
          //               'Call Support',
          //               style:
          //                   TextStyle(color: Color(0xff868E96), fontSize: 14),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // addVerticalSpace(24.0),

          BlocListener<SupportTicketBloc, SupportTicketState>(
            listener: (_, state) {
              if (state.theStates == TheStates.initial) {
                if (_tabController.index < 1) {
                  context.read<SupportTicketBloc>().add(
                      SupportTicketFetchInitiated(
                          supportTicketStatus: SupportTicketStatus.open.name));
                  setState(() {});
                }
                if (_tabController.index >= 1) {
                  context.read<SupportTicketBloc>().add(
                      SupportTicketFetchInitiated(
                          supportTicketStatus:
                              SupportTicketStatus.closed.name));
                  setState(() {});
                }
              }
            },
            child: TabBar(
              onTap: (value) {
                context
                    .read<SupportTicketBloc>()
                    .add(SupportTicketInitialEvent());
                setState(() {});
              },
              unselectedLabelColor: Colors.grey,
              labelPadding: kPadding10,
              controller: _tabController,
              indicatorColor: Colors.amber,
              physics: BouncingScrollPhysics(),
              tabs: [
                Text(
                  'Active',
                  style: GoogleFonts.poppins(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'Closed',
                  style: GoogleFonts.poppins(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  //active tab bar list
                  SupportTicketList(),
                  //closed tab bar list
                  SupportTicketList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
