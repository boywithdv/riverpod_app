import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/pages/api_response_food_page.dart';
import 'package:riverpod_app/pages/change_notifier_provider_page.dart';

import 'package:riverpod_app/pages/consumer_widget_sample_page.dart';
import 'package:riverpod_app/pages/counter_state_provider_page.dart';
import 'package:riverpod_app/pages/flutter_hooks_page.dart';
import 'package:riverpod_app/pages/product_detail_page.dart';
import 'package:riverpod_app/pages/provider_scope_page.dart';
import 'package:riverpod_app/pages/shared_preferences_cache_provider_page.dart';
import 'package:riverpod_app/pages/stream_provider_page.dart';
import 'package:riverpod_app/pages/use_ref_listen_provider_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'features/features.dart';
import 'pages/state_notifier_provider_page.dart';
import 'top_level_providers/shared_preferences.dart';



Future<void> main() async{
  // runApp 関数が終わる前に何か処理を実行する場合には ` ensureInitialized()`メソッドを追記する
  WidgetsFlutterBinding.ensureInitialized();
  runApp( ProviderScope(overrides: [
    // SharedPreferencesProviderでSharedPreferencesのインスタンスに差し替える
    sharedPreferencesProvider.overrideWithValue(
    // ここでインスタンス化し、Providerの値を上書きする
    await SharedPreferences.getInstance(),
  )],child:  MyApp()));
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
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>StreamProviderPage()));
                  }, child: Text('StreamProvider Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProviderPage()));
                  }, child: Text('Change Notifier Provider Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailPage()));
                  }, child: Text('Product Detail Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProviderScopePage()));
                  }, child: Text('Provider Scope Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>FlutterHooksPage()));
                  }, child: Text('Flutter Hooks Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedPreferencesCacheProviderPage()));
                  }, child: Text('SharedPreferences Cache Provider Page',style: TextStyle(color: Colors.blue),),),
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ApiResponseFoodPage()));
                  }, child: Text('Api Response Food Page',style: TextStyle(color: Colors.blue),),),
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