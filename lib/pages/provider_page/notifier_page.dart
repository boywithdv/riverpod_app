import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/future_notifier_provider.dart';
import 'package:riverpod_app/features/int_notifier_provider.dart';

import '../../features/list_notifier_provider.dart';

class NotifierPage extends ConsumerWidget {
  const NotifierPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s1Notifier = ref.watch(s1NotifierProvider);
    final s2Notifier = ref.watch(s2NotifierProvider);
    final s3Notifier = ref.watch(s3NotifierProvider);
    final widget = s3Notifier.when(
        data: (d) => d,
        error: (e, _) => Icon(Icons.error),
        loading: () => '接続中');

    ref.listen(s1NotifierProvider, (oldState, newState) {
      // スナックバーを表示する
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${oldState}から $newState に変更されました。')));
    });
    ref.listen(s2NotifierProvider, (previousState, newState) {
      // スナックバーを表示する
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$previousState から $newState に変更されました。')));
    });
    ref.listen(s3NotifierProvider, (previousState, newState) {
      // スナックバーを表示する
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$previousState から $newState に変更されました。')));
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifierPage'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Increment :$s1Notifier'),
              IconButton(
                onPressed: () {
                  ref.read(s1NotifierProvider.notifier).increment();
                },
                icon: Icon(Icons.add),
              )
            ],
          ),
          InvalidateButton(
            onTap: () {
              debugPrint('${s1Notifier} が初期の状態に戻りました。');
              ref.invalidate(s1NotifierProvider);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('List :$s2Notifier'),
              IconButton(
                  onPressed: () {
                    ref.read(s2NotifierProvider.notifier).add();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          InvalidateButton(
            onTap: () {
              debugPrint('${s2Notifier} が初期の状態に戻りました。');
              ref.invalidate(s2NotifierProvider);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Future :$widget'),
              IconButton(
                  onPressed: () {
                    ref.read(s3NotifierProvider.notifier).UpdateState();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          InvalidateButton(
            onTap: () {
              debugPrint('${s3Notifier} が初期の状態に戻りました。');
              ref.invalidate(s3NotifierProvider);
            },
          ),
        ],
      ),
    );
  }
}

class InvalidateButton extends StatelessWidget {
  const InvalidateButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 110, 239, 253),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(10),
      child: InkWell(
        onTap: onTap,
        child: const Text(
          'Invalidate',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
