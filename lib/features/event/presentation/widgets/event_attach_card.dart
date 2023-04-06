import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/core/mixins/mixins.dart';
import 'package:cipher/features/event/presentation/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class EventAttachCard extends StatelessWidget with TheModalBottomSheet {
  const EventAttachCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      height: 100,
      decoration: BoxDecoration(
        color: kColorGrey.withOpacity(
          0.3,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.edit_calendar_outlined,
                color: kColorSilver,
              ),
              addHorizontalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "No event created yet",
                    style: kText15,
                  ),
                  AutoSizeText(
                    "Let's create your first event",
                  ),
                ],
              )
            ],
          ),
          TextButton.icon(
            onPressed: () {
              showCustomBottomSheet(
                context: context,
                widget: EventForm(),
              );
            },
            icon: Icon(Icons.add),
            label: AutoSizeText("Attach an event"),
          )
        ],
      ),
    );
  }
}
