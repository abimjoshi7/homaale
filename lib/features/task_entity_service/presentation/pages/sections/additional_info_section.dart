import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widgets.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({
    super.key,
    this.date,
    this.location,
    this.views,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
  });

  final String? date;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final String? location;
  final String? views;

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
              if (startDate != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconText(
                      label: 'Start Date',
                      iconData: Icons.calendar_today_rounded,
                      color: Colors.orangeAccent,
                    ),
                    Text(startDate ?? '')
                  ],
                ),
              ],
              if (endDate != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconText(
                      label: 'End Date',
                      iconData: Icons.calendar_today_rounded,
                      color: Colors.orangeAccent,
                    ),
                    Text(endDate ?? '')
                  ],
                ),
              ],
              if (startTime != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconText(
                      label: 'Start Time',
                      iconData: Icons.timer_outlined,
                      color: kColorPrimary,
                    ),
                    Text(
                      DateFormat.jm().format(
                        DateFormat('hh:mm:ss').parse(startTime!),
                      ),
                    ),
                  ],
                ),
              ],
              if (endTime != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconText(
                      label: 'End Time',
                      iconData: Icons.timer_outlined,
                      color: kColorPrimary,
                    ),
                    Text(
                      DateFormat.jm().format(
                        DateFormat('hh:mm:ss').parse(endTime!),
                      ),
                    ),
                  ],
                ),
              ],
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconText(
                    label: 'Location',
                    iconData: Icons.location_on_outlined,
                    color: Colors.deepOrange,
                  ),
                  Text(location == null || location!.isEmpty ? "Remote" : location!)
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
            ],
          ),
        ),
      ],
    );
  }
}
