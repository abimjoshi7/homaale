import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({
    super.key,
    this.date,
    this.location,
    this.views,
    this.happyClients,
    this.successRate,
  });

  final String? date;
  final String? location;
  final String? views;
  final String? happyClients;
  final String? successRate;

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
                children: [
                  IconText(
                    label: 'Date & Time',
                    iconData: Icons.calendar_today_rounded,
                    color: Colors.orangeAccent,
                  ),
                  Text(date ?? '')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(
                    label: '',
                    iconData: Icons.location_on_outlined,
                    color: Colors.deepOrange,
                  ),
                  Expanded(child: Text(location ?? ''))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(
                    label: 'Views',
                    iconData: Icons.remove_red_eye_outlined,
                  ),
                  Text(views ?? '')
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
                  Text(happyClients ?? '0')
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
                  Text(successRate ?? '0')
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
