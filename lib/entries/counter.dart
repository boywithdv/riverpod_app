import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _count = 0;
  /// countという名前のgetterを作成
  /// getterは _countというプライベート変数を返すだけのメソッド
  int get count => _count;

  void increment() {
    // 現在のcounterに1を加算
    _count++;
    notifyListeners();
  }
  void decrement() {
    // 現在のcounterに1を減算
    _count--;
    notifyListeners();
  }
  void reset() {
    // 現在のcounterを0にリセット
    _count = 0;
    notifyListeners();
  }
}