import 'package:intl/intl.dart';

String dateTimeToDDMMYYYY(DateTime dateTime) {
  return DateFormat('d.M.yyyy').format(dateTime);
}

String dateTimeToHHMM(DateTime dateTime) {
  return DateFormat('h:m').format(dateTime);
}

String duration(String start, String end) {
  var dt1 = DateTime.parse('2020-01-02T$start');
  var dt2 = DateTime.parse('2020-01-02T$end');
  var duration = dt2.difference(dt1);

  if (duration.inHours == 0) {
    return '${duration.inMinutes}min';
  } else {
    return '${duration.inHours}h ${duration.inMinutes % 60}min';
  }
}
