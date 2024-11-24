import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/features.dart';
import 'provider_page.dart';


class RiverpodMainPage extends ConsumerWidget {
  const RiverpodMainPage({super.key});


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
              MaterialButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>NotifierPage()));
                  }, child: Text('Notifier Page',style: TextStyle(color: Colors.blue),),),
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