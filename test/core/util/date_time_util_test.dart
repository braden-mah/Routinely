import 'package:flutter_test/flutter_test.dart';
import 'package:routinely/core/util/date_time_util.dart';

void main() {
  group('Date tests', () {
    test('Date: 0001-01-01', () {
      DateTime date = DateTime.parse("0001-01-01");
      final result = DateTimeUtil.toStringDate(date);
      expect(result, "0001-01-01");
    });
    test('Date: 2021-07-12', () {
      DateTime date = DateTime.parse("2021-07-12");
      final result = DateTimeUtil.toStringDate(date);
      expect(result, "2021-07-12");
    });
    test('Date: 2021-10-05', () {
      DateTime date = DateTime.parse("2021-10-05");
      final result = DateTimeUtil.toStringDate(date);
      expect(result, "2021-10-05");
    });
    test('Date: 0584-10-21', () {
      DateTime date = DateTime.parse("0584-10-21");
      final result = DateTimeUtil.toStringDate(date);
      expect(result, "0584-10-21");
    });
  });
}
