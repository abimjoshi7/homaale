import 'package:cipher/core/constants/date_time_representation.dart';
import 'package:flutter/material.dart';

class ListTileComponent extends StatelessWidget {
  final String userImage;
  final String userName;
  final String statusTitle;
  final String statusDetails;
  final DateTime? time;
  const ListTileComponent({
    super.key,
    required this.userImage,
    required this.statusTitle,
    required this.statusDetails,
    this.time,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.red,
          ),
          child: Image.network(userImage),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8),
          child: RichText(
            text: TextSpan(
              text: userName,
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: " $statusDetails",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (statusTitle == "status completed" || statusTitle == "rejected")
              TextButton(
                onPressed: () {
                },
                child: const Text(
                  "Browse New Task",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            if (time != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  getVerboseDateTimeRepresentation(time!),
                ),
              )
            else
              const SizedBox(),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: statusTitle == "status completed" ||
                    statusTitle == "payment completed"
                ? Colors.green
                : statusTitle == "approval" || statusTitle == "Approved"
                    ? Colors.teal
                    : statusTitle == "booking"
                        ? Colors.blue
                        : statusTitle == "waiting"
                            ? Colors.orange
                            : Colors.red,
          ),
          child: Text(
            (statusTitle == "status completed" ||
                    statusTitle == "payment completed")
                ? "Completed"
                : (statusTitle == "approval")
                    ? "Approval"
                    : (statusTitle == "waiting")
                        ? "Waiting"
                        : (statusTitle == "rejected")
                            ? "Rejected"
                            : (statusTitle == "booking")
                                ? "Booking"
                                : statusTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
