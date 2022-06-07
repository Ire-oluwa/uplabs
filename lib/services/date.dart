import 'package:intl/intl.dart';

class Date {
  String printDate() {
    final now = DateTime.now();
    var formatter = DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
