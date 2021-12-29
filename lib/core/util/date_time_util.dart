class DateTimeUtil {
  static String toStringDate(DateTime date) =>
      "${pad(date.year, 4)}-${pad(date.month, 2)}-${pad(date.day, 2)}";
  static String pad(int val, int digits) {
    String valString = val.toString();
    while (valString.length < digits) {
      valString = '0$valString';
    }
    return valString;
  }
}
