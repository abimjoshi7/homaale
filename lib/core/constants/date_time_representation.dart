
import 'package:dependencies/dependencies.dart';

String getVerboseDateTimeRepresentation(DateTime dateTime) {
  DateTime now = DateTime.now().toLocal();

  DateTime localDateTime = dateTime.toLocal();

  if (localDateTime.difference(now).inDays == 0) {
    var differenceInHours = localDateTime.difference(now).inHours.abs();
    var differenceInMins = localDateTime.difference(now).inMinutes.abs();

    if (differenceInHours > 0) {
      return '$differenceInHours hours ago';
    } else if (differenceInMins > 2) {
      return '$differenceInMins mins ago';
    } else {
      return 'Just now';
    }
  }

  String roughTimeString = DateFormat('jm').format(dateTime);

  if (localDateTime.day == now.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return roughTimeString;
  }

  DateTime yesterday = now.subtract(const Duration(days: 1));

  if (localDateTime.day == yesterday.day &&
      localDateTime.month == now.month &&
      localDateTime.year == now.year) {
    return 'Yesterday';
  }

  if (now.difference(localDateTime).inDays < 4) {
    String weekday = DateFormat(
      'EEEE',
    ).format(localDateTime);

    return '$weekday, $roughTimeString';
  }

  return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
}

extension DateHelpers on DateTime {

  String toTimeAgoLabel({bool isIntervalNumericVisible = true}) {
    final now = DateTime.now();
    final durationSinceNow = now.difference(this);

    final inDays = durationSinceNow.inDays;
    if (inDays >= 1) {
      return (inDays / 7).floor() >= 1
          ? isIntervalNumericVisible ? '1 week ago' : 'Last week'
          : inDays >= 2
          ? '$inDays days ago'
          : isIntervalNumericVisible
          ? '1 day ago'
          : 'Yesterday';
    }

    final inHours = durationSinceNow.inHours;
    if (inHours >= 1) {
      return inHours >= 2
          ? '$inHours hours ago'
          : isIntervalNumericVisible
          ? '1 hour ago'
          : 'An hour ago';
    }

    final inMinutes = durationSinceNow.inMinutes;
    if (inMinutes >= 2) {
      return inMinutes >= 2
          ? '$inMinutes minutes ago'
          : isIntervalNumericVisible
          ? '1 minute ago'
          : 'A minute ago';
    }

    final inSeconds = durationSinceNow.inSeconds;
    return inSeconds >= 3 ? '$inSeconds seconds ago' : 'Just now';
  }
}
