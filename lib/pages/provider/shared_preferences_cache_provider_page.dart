import 'package:flutter/material.dart';

/// ユーザが変更したアプリ内設定や、フラグなどの値を保存したい場合に使用できる
/// SharedPreferencesを使いたい時に毎回非同期でインスタンスを取得するのは面倒なので、
/// Providerを使ってインスタンスをキャッシュする。
/// 
/// また、一度取得したインスタンスは基本的んいは一貫して使うもののため、Stateも必要ない
/// 変化する状態を持たない、最も基本的なProviderを使用する。
/// 
/// ** 非同期でのインスタンス取得は初回だけにする**
/// 
/// 以下のようにそのままアクセスすると、例外を投げるProviderを作成する。
/// final sharedPreferencesProvider = Provider<SharedPreferences>((_) => throw UnimplementedError());
/// 

class SharedPreferencesCacheProviderPage extends StatelessWidget {
  const SharedPreferencesCacheProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SharedPreferencesCacheProviderPage'),), 
      body: Center(
        child: Text('SharedPreferencesCacheProviderPage',style: Theme.of(context).textTheme.headlineMedium,),
      ),  
    );
  }
}