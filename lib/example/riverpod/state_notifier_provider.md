# StateNotifierProvider

https://riverpod.dev/ja/docs/providers/state_notifier_provider

StateNotifierをリッスンして公開するために使用されるプロバイダ。

## 使用用途

- **不変な状態の公開** : カスタムイベントに反応して時間と共に変化する可能性のある普遍の状態を公開する。
- **ビジネスロジックの集中管理** : 状態を変更するロジックを一箇所に集中させ、長期的なメンテナビリティ。

※ NotifierProviderの使用を推奨する。

```dart

// StateNotifier のステート（状態）はイミュータブル（不変）である必要があります。
// ここは Freezed のようなパッケージを利用してimmutableにしても OK です。
@immutable
class Todo {
  const Todo({required this.id, required this.description, required this.completed});

  // immutableなクラスのプロパティはすべて `final` にする必要があります。
  final String id;
  final String description;
  final bool completed;

  // Todo はimmutableであり、内容を直接変更できないためコピーを作る必要があります。
  // これはオブジェクトの各プロパティの内容をコピーして新たな Todo を返すメソッドです。
  Todo copyWith({String? id, String? description, bool? completed}) {
    return Todo(
      id: id ?? this.id,
      description: description ?? this.description,
      completed: completed ?? this.completed,
    );
  }
}

// StateNotifierProvider に渡すことになる StateNotifier クラスです。
// このクラスではステートを `state` プロパティの外に公開しません。
// つまり、ステートに関しては public なゲッターやプロパティは作らないということです。
// public メソッドを通じて UI 側にステートの操作を許可します。
class TodosNotifier extends StateNotifier<List<Todo>> {
  // Todo リストを空のリストとして初期化します。
  TodosNotifier(): super([]);

  // Todo の追加
  void addTodo(Todo todo) {
    // ステート自体もimmutableなため、`state.add(todo)`のような操作はできません。
    // 代わりに、既存 Todo と新規 Todo を含む新しいリストを作成します。
    // Dart のスプレッド演算子を使うと便利ですよ!
    state = [...state, todo];
    // `notifyListeners` などのメソッドを呼ぶ必要はありません。
    // `state =` により必要なときに UI側 に通知が届き、ウィジェットが更新されます。
  }

  // Todo の削除
  void removeTodo(String todoId) {
    // しつこいですが、ステートはimmutableです。 
    // そのため既存リストを変更するのではなく、新しくリストを作成する必要があります。
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // Todo の完了ステータスの変更
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        // ID がマッチした Todo のみ、完了ステータスを変更します。
        if (todo.id == todoId)
          // またまたしつこいですが、ステートはimmutableなので
          // Todo クラスに実装した `copyWith` メソッドを使用して
          // Todo オブジェクトのコピーを作る必要があります。
          todo.copyWith(completed: !todo.completed)
        else
          // ID が一致しない Todo は変更しません。
          todo,
    ];
  }
}

// 最後に TodosNotifier のインスタンスを値に持つ StateNotifierProvider を作成し、
// UI 側から Todo リストを操作することを可能にします。
final todosProvider = StateNotifierProvider<TodosNotifier, List<Todo>>((ref) {
  return TodosNotifier();
});

```

### UI側で使用する場合

```dart

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Todo リストの内容に変化があるとウィジェットが更新される
    List<Todo> todos = ref.watch(todosProvider);

    // スクロール可能なリストビューで Todo リストの内容を表示
    return ListView(
      children: [
        for (final todo in todos)
          CheckboxListTile(
            value: todo.completed,
            // 各 Todo をタップすると、完了ステータスを変更できる
            onChanged: (value) => ref.read(todosProvider.notifier).toggle(todo.id),
            title: Text(todo.description),
          ),
      ],
    );
  }
}
```
