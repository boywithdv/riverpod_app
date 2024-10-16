import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'list_notifier_provider.g.dart';

@riverpod
class S2Notifier extends _$S2Notifier  {
  @override
  List<String> build(){
    return ['A','B','C'];
  }

  void add(){
    // 変更前のデータ
    final oldState = state;
    // 変更後のデータ
    final newState = [...oldState,'DC'];
    // データを上書き
    state = newState;
  }
}