import 'package:intl/intl.dart';

DateTime? fromStringToDateTime(String string) {
  return DateFormat('yyyy-MM-ddThh:mm:ss').parse(string);
}
