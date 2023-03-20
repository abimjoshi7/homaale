import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      title: Row(
        children: const [
          Icon(
            Icons.info_outline,
            size: 15,
          ),
          kWidth10,
          Text('Additional Information'),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconText(
                    label: 'Date & Time',
                    iconData: Icons.calendar_today_rounded,
                    color: Colors.orangeAccent,
                  ),
                  Text('03:30 PM . June 03, 2022')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconText(
                    label: 'Location',
                    iconData: Icons.location_on_outlined,
                    color: Colors.deepOrange,
                  ),
                  Text('3 Km away')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconText(
                    label: 'Views',
                    iconData: Icons.remove_red_eye_outlined,
                  ),
                  Text('3.003')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconText(
                    label: 'Happy Clients',
                    iconData: Icons.emoji_emotions_outlined,
                    color: Colors.orange,
                  ),
                  Text('300')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  IconText(
                    label: 'Success Rate',
                    iconData: Icons.app_shortcut_sharp,
                    color: Colors.blue,
                  ),
                  Text('03:30 PM . June 03, 2022')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
