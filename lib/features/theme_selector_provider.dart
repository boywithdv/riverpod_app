import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/shared_preferences_provider.dart';

part 'theme_selector_provider.g.dart';

/// themeの選択はStateNotifierProviderを使って実装
/// なぜ？
/// ユーザが選択したテーマの状態を一時的に保持するためには保持領域に記憶する必要がある
/// 記憶領域への保存とアプリ起動時に取得することが必要になる
/// 

/// sharedPreferenceを使ってテーマの選択を保存する
// SharedPreferencesで使用するテーマのキー

/// Provider for selecting the theme.
@riverpod
class ThemeSelector extends _$ThemeSelector {
  SharedPreferences get _prefs => ref.read(sharedPreferencesProvider);

  /// Key for storing the selected theme.
  @visibleForTesting
   static const themePrefsKey = 'selectedThemeKey';

  @override
  ThemeMode build() {
    final pref = ref.watch(sharedPreferencesProvider);
    final themeIndex = pref.getInt(themePrefsKey);
    if (themeIndex == null) {
      return ThemeMode.system;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    return themeMode;
  }

  /// Change the theme and save it.
  Future<void> changeAndSave(ThemeMode theme) async {
    await _prefs.setInt(themePrefsKey, theme.index);
    state = theme;
  }
}