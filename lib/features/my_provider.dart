import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyValue {
  final String value;

  MyValue(this.value);
}

final myProvider = Provider<MyValue>((ref) {
  return MyValue('42');
});