import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/pages/enum_page/enum_main_page.dart';
import 'package:riverpod_app/pages/main/main_page.dart';
import 'package:riverpod_app/widgets/button/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'top_level_providers/shared_preferences.dart';
import 'widgets/button/app_button_type.dart';



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
      home:  FlutterApp(),
    );
  }
}


class FlutterApp extends StatelessWidget {
  const FlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        actions: [
          InkWell(
            onTap: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const RiverpodSamplePage(),
                  ),
                );
              },
            child: Row(
              children: [
                Icon(Icons.bug_report),
                Text('Riverpod App'),
              ],
            ),
          ),
        ],
      ) ,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(buttonType: AppButtonType.AppButton,onPressed: ()async{
              // AppButtonのページに遷移する。
                await Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (context) => const EnumMainPage(),
                  ),
                );
            },),
          ],
        ),
      ),
    );
  }
}