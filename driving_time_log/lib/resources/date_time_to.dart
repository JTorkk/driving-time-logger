import 'package:intl/intl.dart';

String dateTimeToDDMMYYYY(DateTime dateTime) {
  return DateFormat('d.M.yyyy').format(dateTime);
}

//TODO: validate if this works
String dateTimeToHHMM(DateTime dateTime) {
  return DateFormat('h:m').format(dateTime);
}
