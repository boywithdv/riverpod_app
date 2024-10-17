

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/product.dart';

final productDropDownStateProvider = StateProvider<ProductSortType>(
  // ソートの種類 nameを返す。 これがデフォルトのステートになる。
  (ref) => ProductSortType.name,
);