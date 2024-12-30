import 'package:intl/intl.dart';

String formatDate(
  DateTime dateTime,
) {
  return DateFormat('h:mm a, dd MMM yyyy').format(dateTime);
}
