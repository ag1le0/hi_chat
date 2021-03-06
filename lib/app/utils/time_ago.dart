import 'package:intl/intl.dart';

class TimeAgo {
  static String timeAgoSinceDate(DateTime notificationDate,
      {bool numericDates = true}) {
    final date2 = DateTime.now();
    final difference = date2.difference(notificationDate);

    if (difference.inDays > 8) {
      return DateFormat('dd/MM').format(notificationDate);
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 week ago' : 'Last week';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 day ago' : 'Yesterday';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} hours ago';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 hour ago' : 'An hour ago';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 minute ago' : 'A minute ago';
    } else if (difference.inSeconds >= 3) {
      return '${difference.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }

  static String messageDateTime(DateTime messageDateTime) {
    final dateNow = DateTime.now();
    if (dateNow.year > messageDateTime.year) {
      return DateFormat("HH:mm, dd/MM/yyyy").format(messageDateTime);
    } else if (dateNow.month > messageDateTime.month) {
      return DateFormat("HH:mm, dd/MM").format(messageDateTime);
    } else if (dateNow.weekday > messageDateTime.weekday) {
      return DateFormat("HH:mm, EEE").format(messageDateTime);
    } else {
      return DateFormat("HH:mm").format(messageDateTime);
    }
  }
}
