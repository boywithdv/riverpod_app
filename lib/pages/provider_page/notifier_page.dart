import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/future_notifier_provider.dart';
import 'package:riverpod_app/features/int_notifier_provider.dart';

import '../../features/list_notifier_provider.dart';


class NotifierPage extends ConsumerWidget {
  
  const NotifierPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final s1Notifier = ref.watch(s1NotifierProvider);
    final s2Notifier = ref.watch(s2NotifierProvider);
    final s3Notifier = ref.watch(s3NotifierProvider);
    final widget = s3Notifier.when(data:(d)=> d , error:(e,_)=> Icon(Icons.error), loading:()=> '接続中');

    ref.listen(
      s1NotifierProvider,(oldState,newState){
        // スナックバーを表示する
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${oldState}から $newState に変更されました。')));
      }
    );
    ref.listen(
      s2NotifierProvider,(previousState,newState){
        // スナックバーを表示する
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$previousState から $newState に変更されました。')));
      }
    );
    ref.listen(
      s3NotifierProvider,(previousState,newState){
        // スナックバーを表示する
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$previousState から $newState に変更されました。')));
      } 
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('NotifierPage'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Increment :$s1Notifier'),
              IconButton(onPressed: (){
                ref.read(s1NotifierProvider.notifier).increment();
              }, icon: Icon(Icons.add))
              
              
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('List :$s2Notifier'),
              IconButton(onPressed: (){
                ref.read(s2NotifierProvider.notifier).add();
              }, icon: Icon(Icons.add))
            ],
          ),
                    Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Future :$widget'),
              IconButton(onPressed: (){
                ref.read(s3NotifierProvider.notifier).UpdateState();
              }, icon: Icon(Icons.add))
            ],
          ),
        ],
      ),
    );
  }
}