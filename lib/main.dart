import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/my_provider.dart';

import 'package:riverpod_app/pages/consumer_widget_sample_page.dart';
import 'package:riverpod_app/pages/counter_state_provider_page.dart';
import 'package:riverpod_app/pages/use_ref_listenManual_provider_page.dart';
import 'package:riverpod_app/pages/use_ref_listen_provider_page.dart';
import 'features/features.dart';
import 'pages/state_notifier_provider.page.dart';



void main() {
  runApp(const ProviderScope(child:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appName = ref.watch(appNameProvider);
    final doubleCounter = ref.watch(doubleCounterProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(appName),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer(
                builder: (context, watch, _) {
                  final myData = ref.watch(myProvider);
                  return Text(
                    myData.value,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              Text('Double Counter Provider Value:$doubleCounter',
                  style: Theme.of(context).textTheme.headlineMedium),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ComsumerWidgetSample()));
                  }, child: Text('Consumer Widget Sample Page',style: TextStyle(color: Colors.blue),),),
                            Text('Double Counter Provider Value:$doubleCounter',
                  style: Theme.of(context).textTheme.headlineMedium),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UseRefListenProviderPage()));
                  }, child: Text('Use ref listen provider Page',style: TextStyle(color: Colors.blue),),),
              /*
              // ref.listenManualを使ったページ
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>UseRefListenmanualProviderPage()));
                  }, child: Text('Use ref listenManual provider Page',style: TextStyle(color: Colors.blue),),),
              */
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CounterStateProviderPage()));
                  }, child: Text('Use ref listenManual provider Page',style: TextStyle(color: Colors.blue),),),
              // StateNotifierProviderを使ったページ
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StateNotifierProviderPage()));
                  }, child: Text('StateNotifierProvider Page',style: TextStyle(color: Colors.blue),),),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
      );
  }
}