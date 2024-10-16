import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'int_notifier_provider.g.dart';

@riverpod
class S1Notifier extends _$S1Notifier  {
  @override
  int build(){
    return 0;
  }

  void increment(){
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = oldState + 1;
    // データを上書き
    state = newState;

  }
}