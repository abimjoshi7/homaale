import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
            children: [
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
            children: [
              IconText(
                label: 'Views',
                iconData: Icons.remove_red_eye_outlined,
                color: kColorPrimary,
              ),
              Text('3.003')
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
            children: [
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
    );
  }
}
