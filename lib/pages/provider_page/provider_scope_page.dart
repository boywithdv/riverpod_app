import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/current_todo_index.dart';



class ProviderScopePage extends StatelessWidget {
  const ProviderScopePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ProviderScopePage'),
      ),body:
      ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProviderScope(overrides: [currentTodoIndex.overrideWithValue(index)],child: TodoItemTile(),);
      }),
    );
  }
}


/// 受け取りたい側では通常のProviderを読み取る時と同じように、watchでProviderを読み取ることができる
class TodoItemTile extends ConsumerWidget {
  const TodoItemTile({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // TodoアイテムのIndexを取得
    final index = ref.watch(currentTodoIndex);
    return ListTile(
      title: Text('Item $index'),
    );
  }
}