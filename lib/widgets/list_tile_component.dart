import 'package:cipher/core/constants/colors.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import 'package:cipher/core/constants/date_time_representation.dart';

class ListTileComponent extends StatelessWidget {
  final String userImage;
  final String userName;
  final String statusTitle;
  final String statusDetails;
  final DateTime? time;
  final Color bgColor;
  final DateTime? readDate;
  final bool hasStatusBox;
  final bool hasAssets;
  final VoidCallback? onTapCallback;

  const ListTileComponent({
    Key? key,
    required this.userImage,
    required this.userName,
    required this.statusTitle,
    required this.statusDetails,
    required this.bgColor,
    this.time,
    this.readDate,
    this.hasStatusBox = true,
    this.onTapCallback,
    this.hasAssets = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapCallback ?? () {},
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: hasAssets ? null : NetworkImage(userImage),
          child: !hasAssets
              ? SizedBox.shrink()
              : SvgPicture.asset(
                  userImage,
                  fit: BoxFit.cover,
                ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 8),
          child: Text(
            "$statusDetails",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (statusTitle == "status completed" || statusTitle == "rejected")
              TextButton(
                onPressed: () {}, 
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
        // trailing: hasStatusBox
        //     ? Container(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
        //         decoration: BoxDecoration(
        //           borderRadius: BorderRadius.circular(10),
        //           color: bgColor,
        //         ),
        //         child: Text(
        //           statusTitle,
        //           style: const TextStyle(color: Colors.white),
        //         ),
        //       )
        //     : null,
      ),
    );
  }
}
