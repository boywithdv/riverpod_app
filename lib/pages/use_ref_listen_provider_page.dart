import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../features/features.dart';


class UseRefListenProviderPage extends ConsumerWidget {
  const UseRefListenProviderPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    ref.listen(counterProvider, (previous,next){
      // 実行したい処理をここに書く
      print('counterProvider previous:$previous next:$next');
    },onError: (error,stackTrace)=> debugPrint(wrapWidth: 1024, error.toString())); 
    final appName = ref.watch(appNameProvider);
    return Scaffold(
      appBar: AppBar(title: Text(appName),),
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