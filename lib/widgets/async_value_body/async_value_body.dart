

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueBody<T> extends HookConsumerWidget {
  const AsyncValueBody(this.value,{
    super.key,
    required this.asyncValue,
    this.skipLoadingOnReload = false,
  });

  final AsyncValue<T> value;

  final Widget Function(T) asyncValue;

  final bool skipLoadingOnReload;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return value.when(
      skipLoadingOnReload: skipLoadingOnReload,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error,stackTrace) => Center(child: Text('$error'),),
      data:asyncValue,
    );
  }
}