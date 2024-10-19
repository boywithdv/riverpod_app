import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/features.dart';


class CounterStateProviderPage extends ConsumerWidget {
  const CounterStateProviderPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final counter = ref.watch(counterStateProvider.notifier);
    final appName = ref.watch(appNameProvider);
    return Scaffold(
      appBar: AppBar(title: Text(appName),),
      body: Center(child: ElevatedButton(onPressed: ()=> counter.update((state)=> state+1), child: Text('CounterStateProviderPage Counter:${ref.watch(counterStateProvider)}')),),
    );
  }
}