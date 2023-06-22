import 'package:cipher/core/constants/constants.dart';
import 'package:cipher/widgets/widget_text.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class TaskerDescriptionSection extends StatelessWidget {
  const TaskerDescriptionSection({
    super.key,
    this.bio,
    this.contact,
    this.activeHourStart,
    this.activeHourEnd,
    this.skills,
    this.location,
    this.joinedDate,
  });

  final String? bio;
  final String? contact;
  final String? activeHourStart;
  final String? activeHourEnd;
  final DateTime? joinedDate;
  final String? skills;
  final String? location;

  @override
  Widget build(BuildContext context) {
    Widget displayBio() {
      if (bio != null && bio!.isNotEmpty) {
        return Text(bio!);
      } else {
        return const Text(
          '',
        );
      }
    }

    Widget displayUsername() {
      if (contact != null && contact!.isNotEmpty) {
        return WidgetText(
            widget: Image.asset('assets/mail.png'), label: contact!);
      } else {
        return WidgetText(
          widget: Image.asset('assets/mail.png'),
          label: 'harrysmith@gmail.com',
        );
      }
    }

    Widget displayActiveHours() {
      if ((activeHourStart != null && activeHourStart!.isNotEmpty) &&
          (activeHourEnd != null && activeHourEnd!.isNotEmpty)) {
        return WidgetText(
          widget: Image.asset('assets/clock.png'),
          label: "Active Hours: ${DateFormat.jm().format(
            DateFormat('hh:mm:ss').parse(activeHourStart!),
          )} - ${DateFormat.jm().format(
            DateFormat('hh:mm:ss').parse(activeHourEnd!),
          )}",
        );
      } else {
        return WidgetText(
          widget: Image.asset('assets/clock.png'),
          label: '',
        );
      }
    }

    Widget displayJoinedDate() {
      if ((joinedDate != null)) {
        return WidgetText(
            widget: Icon(Icons.date_range,color: kColorSecondary),
            label: "Joined Date: ${DateFormat.yMMMd().format(
              DateFormat('yyyy-MM-dd').parse(joinedDate.toString()),
            )}");
      } else {
        return WidgetText(
          widget: Image.asset('assets/clock.png'),
          label: '',
        );
      }
    }

    Widget displaySkill() {
      if (skills != null && skills!.isNotEmpty) {
        final x = skills?.replaceAll(RegExp(r"[^\s\w]"), '');
        final skill = x?.split(' ');
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/sparkle.png'),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                skill?.join(', ') ?? 'No skills added',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        );
      } else {
        return WidgetText(
          widget: Image.asset('assets/sparkle.png'),
          label: 'No skills added',
        );
      }
    }

    Widget displayLocation() {
      if (location != null && location!.isNotEmpty) {
        return WidgetText(
          widget: Image.asset('assets/location.png'),
          label: location!,
        );
      } else {
        return WidgetText(
          widget: Image.asset('assets/location.png'),
          label: 'New baneshwor, Kathmandu, Nepal',
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          displayBio(),
          kHeight15,
          displayJoinedDate(),
          // displayUsername(),
          displayActiveHours(),
          displaySkill(),
          displayLocation(),
        ],
      ),
    );
  }
}
