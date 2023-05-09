import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/features/support/presentation/bloc/support_ticket_bloc.dart';
import 'package:cipher/features/support/presentation/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SupportTicketList extends StatelessWidget {
  const SupportTicketList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportTicketBloc, SupportTicketState>(
      builder: (_, state) {
        if (state.theStates == TheStates.success) {
          if (state.supportTicketList == null ||
              state.supportTicketList!.isEmpty) {
            return Center(
              child: Text(
                'No Active Tickets',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            );
          }
          if (state.supportTicketList != null &&
              state.supportTicketList!.isNotEmpty) {
            return ListView.builder(
              itemCount: state.supportTicketList!.length,
              itemBuilder: (BuildContext context, int index) {
                return SupportTicketCard(
                  supportTicket: state.supportTicketList![index],
                  isTicketClosed: true,
                );
              },
            );
          }
        }
        if (state.theStates == TheStates.failure) {
          return Center(
              child: Text(
            'Could not load Tickets',
            style: Theme.of(context).textTheme.displayMedium,
          ));
        }

        return CardLoading(height: 100.0);
      },
    );
  }
}
