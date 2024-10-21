import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// 機能共通で使用する [DateTime] に関する拡張機能を提供する。
extension DateTimeExtension on DateTime {
  /// 年月形式の日付文字列に変換する。
  ///
  /// e.g. `2024年5月`, 'May 2024'
  String get yMMMEd {
    // final locale = LocaleSettings.currentLocale.languageTag;
    // return DateFormat.yMMMM(locale).format(this);
    return DateFormat.yMMMM('en').format(this);
  }

  /// 短縮系の曜日を取得する。
  ///
  /// e.g. `月`, `Tue`
  String get shortWeekday {
    // final locale = LocaleSettings.currentLocale.languageTag;
    // return DateFormat.E(locale).format(this);
    return DateFormat.E('en').format(this);
  }

  /// 対象の月の日付一覧を取得する。
  ///
  /// e.g. `2024年5月` の場合、`2024年5月1日` から `2024年5月31日` までの [DateTime] の一覧を取得する。
  List<DateTime> get datesInMonth {
    final lastDayOfMonth = DateTime(year, month + 1, 0);
    return List.generate(
      lastDayOfMonth.day,
      (index) => DateTime(year, month, index + 1),
    );
  }

  /// 時刻を表す文字列を取得する。
  ///
  /// e.g. `10:00`
  String get hm {
    final timeFormat = DateFormat.Hm();
    return timeFormat.format(this);
  }

  /// 時刻範囲を表す文字列を取得する。
  ///
  /// e.g. `10:00 - 12:00 JST`
  String timeRangeWithTimeZoneTo(DateTime endAt) {
    final timeFormat = DateFormat.Hm();
    final startTime = timeFormat.format(this);
    final endTime = timeFormat.format(endAt);
    return '$startTime — $endTime $timeZoneName';
  }

  /// 開始日時を表す文字列を取得する。
  ///
  /// e.g. 24 Mar 2024 — Starts at 18:00
  String startAtLabel({bool showStartLabel = true}) {
    final dateFormat = DateFormat('d MMM yyyy');
    final timeFormat = DateFormat.Hm();
    final date = dateFormat.format(this);
    final time = timeFormat.format(this);
    if (showStartLabel) {
      return '$date — Starts at $time';
    }
    return '$date — $time';
  }

  /// 相対的な時間を表す文字列を取得する。
  ///
  /// e.g. `Today, 16:31`, `4h ago`, `6 days ago`,
  /// `Last week`, `Last month`, `18 Aug`
  String relativeTime() {
    final now = clock.now();
    final difference = now.difference(this);
    final isToday = DateUtils.isSameDay(this, now);
    final isYesterday = DateUtils.isSameDay(
      this,
      now.subtract(const Duration(days: 1)),
    );
    final isThisMonth = year == now.year && month == now.month;
    final isLastMonth = (year == now.year && month == now.month - 1) ||
        (year == now.year - 1 && month == 12 && now.month == 1);

    if (isToday) {
      if (difference.inHours < 3) {
        final hm = DateFormat.Hm().format(this);
        return 'Today, $hm';
      } else {
        final hours = difference.inHours;
        return '${hours}h ago';
      }
    } else if (isYesterday) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      final days = difference.inDays;
      return '$days days ago';
    } else if (difference.inDays < 14) {
      return 'Last week';
    } else if (isThisMonth) {
      final weeks = difference.inDays ~/ 7;
      return '$weeks weeks ago';
    } else if (isLastMonth) {
      return 'Last month';
    } else {
      return DateFormat('d MMM').format(this);
    }
  }
}
