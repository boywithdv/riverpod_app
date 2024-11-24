import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:riverpod_app/utils/extension/date_time_extension.dart';

void main() {
  group('toDateTimeExtension', () {
    setUpAll(() async {
      await initializeDateFormatting('ja');
    });
    final dateTime = DateTime(2024, 5);
    test('年月形式の形式の日付文字列を取得する', () {
      expect(dateTime.yMMMEd, 'May 2024');
    });

    test('短縮系の曜日を取得する', () {
      expect(dateTime.shortWeekday, 'Wed');
    });

    test('対象の月の日付一覧を取得する', () {
      final datesInMonth = dateTime.datesInMonth;
      expect(datesInMonth.first, DateTime(2024, 5));
      expect(datesInMonth.last, DateTime(2024, 5, 31));
    });

    test('時刻を表す文字列を取得する', () {
      final dateTime = DateTime(2024, 5, 1, 10);
      expect(dateTime.hm, '10:00');
    });

    test('時刻範囲を表す文字列を取得する', () {
      final startAt = DateTime(2024, 5, 1, 10);
      final endAt = DateTime(2024, 5, 1, 12);
      expect(startAt.timeRangeWithTimeZoneTo(endAt), '10:00 — 12:00 JST');
    });

    test('開始日時を表す文字列を取得する', () {
      final startAt = DateTime(2024, 3, 24, 18);
      expect(startAt.startAtLabel(), '24 Mar 2024 — Starts at 18:00');
    });

    test('相対的な日付を取得する', () {
      final dateTime = DateTime(2024, 5, 2);
      expect(dateTime.relativeTime(), '2 May');
    });
  });
}
