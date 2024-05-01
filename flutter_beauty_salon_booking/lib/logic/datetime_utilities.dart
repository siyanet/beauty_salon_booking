class DateTimeUtils {
  static String formatDateTime(DateTime dateTime) {
    return '${dateTime.year}-${_addLeadingZero(dateTime.month)}-${_addLeadingZero(dateTime.day)} '
        '${_addLeadingZero(dateTime.hour)}:${_addLeadingZero(dateTime.minute)}';
  }

  static String _addLeadingZero(int number) {
    return number < 10 ? '0$number' : '$number';
  }
}
