import 'package:flutter_riverpod/flutter_riverpod.dart';


// Providerの定数をグローバルに宣言しましょう。
// このProviderの値の型は推論されてString型となります。
// 型を明示する場合：'Provider<String((ref)=>'My TODO)'
final appNameProvider = Provider<String>((ref) {
  return 'My TODO';
});