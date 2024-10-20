# (Async)NotifierProvider

https://riverpod.dev/ja/docs/providers/notifier_provider

- NotifierProviderはNotifierをリッスンして公開するために使用されるプロバイダ。
- AsyncNotifierProviderは非同期に初期化できるAsyncNotifierをリッスンして公開するためのプロバイダ。

## 使用用途

- 状態がカスタムイベントに応じて変わる場合の状態の公開
- ビジネスロジック(状態を変更するロジック)の集中管理によるメンテナビリティの向上。

## NotifierProviderの特徴

- **状態の変更に反応する** : カスタムイベントに反応して状態を変更する際に利用される。
- **ビジネスロジックの集中管理** : 状態を変更するロジックを一箇所に集約させる。
- **immutableな状態管理** : 状態の直接変更をせずに、新しいリストやオブジェクトを作成して状態を更新する。
- **notifyListenersの必要がない** : `state =`を使って状態を更新するだけで自動的にUIが再構築されるため、`notifyListeners`などで明示的な通知は不要。

```dart

@freezed
class Todo with _$Todo {
  factory Todo({
    required String id,
    required String description,
    required bool completed,
  }) = _Todo;
}

// NotifierとNotifierProviderを生成する。
// NotifierクラスはNotifierProviderに格納される。
// このクラスはStateプロパティ以外で状態を後悔しないようにする必要がある。
// つまり、公開されたgetterやプロパティは存在しない。
// このクラスの公開メソッドが、UIが状態を変更できる手段となる。
// 最後にUIがTodoクラスとやりとりできるようにTodoProviderを使用する。

// 初回はbuild()メソッドを実行する。
@riverpod
class Todos extends _$Todos {
  @override
  List<Todo> build() {
    return [];
  }

  //UI側でTodoを追加できるようにする。
  void addTodo(Todo todo) {
    // 状態は不変(immutable)なので、`state.add(todo)`を行うことはできない。
    // 代わりに、以前のアイテムと新しいアイテムを含む新しいTODOリストを作成する必要がある。
    // ここでは、Dartのスプレット演算子を使用する。
    state = [...state, todo];
    // "notifyListeners"などを呼び出す必要はない。"state = "を呼び出すと
    // 必要に応じてUIが自動的に再構築される
  }

  // TODOを削除できるようにする
  void removeTodo(String todoId) {
    // ここでも状態は不変である。そのため、既存のリストを変更する代わりに
    // 新しいリストを作成する。
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  // TODOを完了済みにする機能
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        // 対応するTODOのみを完了済みにする。
        if (todo.id == todoId)
          // 再度確認ですが、状態は不変なので、TODOのコピーを作成する必要がある。
          // そのため、事前に実装した`copyWith`メソッドを使用してコピーを作成する。
          todo.copyWith(completed: !todo.completed)
        else
          //他のTODOは変更されない。
          todo,
    ];
  }
}
```
