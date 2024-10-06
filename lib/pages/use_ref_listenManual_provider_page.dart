import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/features.dart';


class UseRefListenmanualProviderPage extends ConsumerWidget {
  const UseRefListenmanualProviderPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    useEffect((){

      ref.listenManual(
          counterProvider,
          fireImmediately: true,
          (prev, next) {
            // Widgetツリーが全体がビルドされた後にダイアログを表示する。
            WidgetsBinding.instance.addPostFrameCallback((_) async {
              // countStateProviderの値が変更される度にダイアログを表示する例です。
              await showDialog<void>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Prev number is $prev, Next number is $next!'),
                  );
                },
              );
            });
          },
          // エラーハンドリング（省略可能）
          onError: (error, stackTrace) => print('Error: $error'),
        );
      return null;
    },[]);
    return Scaffold(
      appBar: AppBar(title: Text('UseRefListenmanualProviderPage'),),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final myData = ref.watch(myProvider);
            return Text(
              myData.value,
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        )
      ),
    );
  }
}