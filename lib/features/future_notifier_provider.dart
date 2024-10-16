import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'future_notifier_provider.g.dart';

@riverpod
class S3Notifier extends _$S3Notifier {
  @override
  Future<String> build()async {
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    return Future.value('あ');
  }

  void UpdateState()async{
    /// データを上書き
    state =  AsyncValue.loading();
    // 3秒まつ
    const sec3 = Duration(seconds: 3);
    await Future.delayed(sec3);
    // データを上書き
    state = const AsyncValue.data('Hello World');
  }
}