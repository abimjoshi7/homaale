import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_bloc.dart';
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

class _SupportTicketPageState extends State<SupportTicketPage> {
  // late TabController _tabController;
  @override
  void initState() {
    super.initState();
    // _tabController = TabController(
    //   length: 2,
    //   vsync: this,
    // );
    context.read<SupportTicketBloc>().add(SupportTicketInitialEvent());
    // setState(() {});
  }

  // @override
  // void dispose() {
  //   _tabController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(appBarTitle: 'Support Ticket'),
      body: BlocBuilder<SupportTicketBloc, SupportTicketState>(
          builder: (context, state) {
        return state.supportTicketList == null
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/support/support_img.png",
                      fit: BoxFit.contain,
                    ),
                    Text('No support Ticket Found.'),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: state.supportTicketList?.length ?? 0,
                itemBuilder: (context, index) {
                  return BillingTicketDisplayCard(
                    status: state.supportTicketList![index].status ?? "",
                    statusDetails:
                        state.supportTicketList![index].description ?? "",
                    timeStatus: state.supportTicketList![index].createdAt,
                  );
                });
      }),
    );
  }
}

class BillingTicketDisplayCard extends StatelessWidget {
  final String status;
  final String statusDetails;
  final DateTime? timeStatus;
  const BillingTicketDisplayCard(
      {Key? key,
      required this.status,
      required this.statusDetails,
      this.timeStatus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "assets/homaale_logo_title.png",
                    fit: BoxFit.contain,
                    height: 50,
                    width: 50,
                  ),
                  Text(
                    'Billing Related Issue',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: status == 'open'
                          ? Colors.green
                          : status == 'assigned'
                              ? Colors.orange
                              : Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        status,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                child: Text(
                  statusDetails,
                  textAlign: TextAlign.justify,
                ),
              ),
              addVerticalSpace(5),
              if (timeStatus != null)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: Text(
                    getVerboseDateTimeRepresentation(timeStatus!),
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.grey),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
