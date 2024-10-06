/// ChangeNotifier - Flutter SDK に内蔵されている
/// 状態とそれを操作するメソッドを同一クラスにかける
/// 
/// 使用用途
/// 状態の保持、状態の操作を行う。
/// 状態を変更し、widgetに伝達するには notifyListeners()を呼ぶ
/// 

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/notifier_counter_provider.dart';


class ChangeNotifierProviderPage extends ConsumerWidget {
  const ChangeNotifierProviderPage({super.key});

// 〜中略〜 buildメソッド
Widget build(BuildContext context, WidgetRef ref) {
  // Providerを読み取る。watchを使用しているので、
  // `Counter` の状態が更新されるとbuildメソッドが再実行され、画面が更新される
  final counter = ref.watch(counterProvider);
  return Scaffold(
    // 最新の `count` 数を表示
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text('Count: ${counter.count}',style: TextStyle(fontSize: 30),),
        Row(
          children: [
            ElevatedButton(
              // ボタンタップで Counterの `increase()` メソッドを実行
              onPressed: counter.increment,
              child: Text('Increment'),
            ),
            ElevatedButton(onPressed: counter.decrement, child: Text('Decrement'),),
            ElevatedButton(onPressed: counter.reset, child: Text('Reset'),),
          ],
        ),      ],
    ),
  );
}
}




