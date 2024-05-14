import 'package:intl/intl.dart';

class TimeFormatter {
  TimeFormatter._();

  static String dateFormatter(DateTime? dateTime) {
    if (dateTime == null) return "N/A";

    return DateFormat('yyyy-MM-dd–kk:mm').format(dateTime);
  }
}
