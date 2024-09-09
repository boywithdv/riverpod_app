import 'package:flutter_riverpod/flutter_riverpod.dart';


// Providerの定数をグローバルに宣言
final counterStateProvider = StateProvider<int>((ref) => 0);