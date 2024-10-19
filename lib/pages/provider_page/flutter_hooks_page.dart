import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';


class FlutterHooksPage extends HookConsumerWidget {
  const FlutterHooksPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
      useEffect(() {
    // 第二引数に指定した要素に変化がなければ再実行されないため、
    // `StatefullWidget` の `initState` のように初回ビルドのみ実行させたい処理を指定できる
    // fetchData();
    // 戻り値として関数を返す。この関数は dispose されたときに実行されるため、
    // `StatefullWidget` の `onDispose` と同じように利用できる
    // 特に必要ない場合は `null` を返せばOK
    return null;
  // このListで指定した要素が更新されたとき、 `useEffect` が再実行される。つまり、空Listを指定しておけば再実行されない。
  }, const []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hooks'),
      ),
      body: Center(child:Text('Flutter Hooks')),
    );
  }
}

/// Flutter Hooks 
/// flutter_hooks に共通する useXxx() というメソッドは、 StatefullWidget や StatelessWidget では使用できない
/// Hookメソッドを使用するには、 HookConsumerWidget または HookConsumer を使う
/// 
/// 
/// HookConsumerWidget 
/// - build メソッドで、 useXxx メソッドと WidgetRef が使用できるWidget。 StatefullWidget や StatelessWidget の代わりに使う。
/// HookConsumer
/// - Consumer Widgetと同じく、囲った範囲内で useXxx メソッドと WidgetRef が利用できるようになる。
///   StatefulHookWidget ※ v1.0.0で削除されました
///   hooks が使用できる StatefullWidget [3]。
///
///
///
///