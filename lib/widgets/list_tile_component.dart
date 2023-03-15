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
          padding: const EdgeInsets.only(top: 8.0,),
          child: Text("$userName $statusDetails"),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (statusTitle == "status completed" || statusTitle == "rejected")
              TextButton(
                onPressed: () {},
                child: const Text("Browse New Task",style: TextStyle(color: Colors.blue),
                ),
              ),
            if (time != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(getVerboseDateTimeRepresentation(time!)),
              )
            else
              const SizedBox(),
          ],
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: statusTitle == "status completed" ? Colors.green :Colors.red,
          ),
          child: Text(
            statusTitle,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
