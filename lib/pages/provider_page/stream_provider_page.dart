import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/stream_provider_sample.dart';

class StreamProviderPage extends ConsumerWidget {
  const StreamProviderPage({super.key});

@override
Widget build(BuildContext context, WidgetRef ref) {
  // StreamProviderを読み取る（取得できる型は `AsyncValue<T>`）
  final items = ref.watch(itemStreamProvider);

  return Scaffold(
    // AsyncValue は `.when` を使ってハンドリングする
    body: items.when(
      // 処理中は `loading` で指定したWidgetが表示される
      loading: () => const CircularProgressIndicator(),
      // エラーが発生した場合に表示されるWidgetを指定
      error: (error, stack) => Center(child: Text('Error: $error'),),
      // 取得した `items` が `data` で使用できる
      data: (items) {
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return ListTile(title: Text(item.name));
          }
        );
      }
    ),
  );
}
}