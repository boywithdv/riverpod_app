///　このファイルではProviderScopeをでの状態の上書きをする
///
///
///


import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';



/// indexは必須とするので、デフォルトではエラーを設定するか、関数の代わりにnullを返すようにする
/// `null`を使った場合、型が`int?`(Nulll許容)になる
final currentTodoIndex = Provider<int>((watch)=>throw UnimplementedError());
/// 上とはほぼ同じ動作だがnullを許容した例
/// final currentTodoIndex = Provider<int?>(null);


