import 'package:flutter_riverpod/flutter_riverpod.dart';

// 外部から変更可能ならStateProviderを例に用いる
final counterProvider = StateProvider((ref) => 0);

// カウンターの値を二倍にした値を提供するProvider
final doubleCounterProvider = Provider((ref) {
  final count = ref.watch(counterProvider);
  return count * 2;
});