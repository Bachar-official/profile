import 'package:intl/intl.dart';

class ParseUtils {
  static String parseDate(DateTime? date, String localeCode, String untilNow) {
    if (date == null) {
      return untilNow;
    }
    return DateFormat.yMMMM(localeCode).format(date);
  }

  static String parseGradeDate(DateTime date, String localeCode) {
    return DateFormat.yMMMM(localeCode).format(date);
  }
}