// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_selector_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeSelectorHash() => r'48fc54b4fc30c87d31c8e505ec2b0bb0102b2b5b';

/// themeの選択はStateNotifierProviderを使って実装
/// なぜ？
/// ユーザが選択したテーマの状態を一時的に保持するためには保持領域に記憶する必要がある
/// 記憶領域への保存とアプリ起動時に取得することが必要になる
///
/// sharedPreferenceを使ってテーマの選択を保存する
/// Provider for selecting the theme.
///
/// Copied from [ThemeSelector].
@ProviderFor(ThemeSelector)
final themeSelectorProvider =
    AutoDisposeNotifierProvider<ThemeSelector, ThemeMode>.internal(
  ThemeSelector.new,
  name: r'themeSelectorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeSelectorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeSelector = AutoDisposeNotifier<ThemeMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
