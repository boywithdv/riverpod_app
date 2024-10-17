import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'product_drop_down_state_provider.dart';

// フィルタの種類を表す列挙型
enum ProductSortType {
  name,
  price,
}

class Product {
  Product({required this.name, required this.price});

  final String name;
  final double price;
}

final _products = [
  Product(name: 'iPhone', price: 999),
  Product(name: 'cookie', price: 2),
  Product(name: 'ps5', price: 500),
];

/// 商品のリストを提供するProvider
/// このProviderをソートできるようにする必要がある
final productsProvider = Provider<List<Product>>((ref) {
  return _products;
});
// productsProviderをソートできるようにしたもの。
final newProductsProvider = Provider<List<Product>>((ref){
  // ソートの種類の初期値を取得する
  final sortType = ref.watch(productDropDownStateProvider);
  // ソートの種類によって商品リストをソートする。
  switch(sortType){
    case ProductSortType.name:
      // _productsに対してsort()メソッドを呼び出す。
      // sortメソッドは引数に比較関数を取る。
      // aとbのnameプロパティを比較する。
      // aがbより小さい場合には負の値、等しい場合は0、大き場合は性の値を返す。
      // リストを辞書順にソートする。
      return _products..sort((a,b)=>a.name.compareTo(b.name));
    case ProductSortType.price:
      return _products..sort((a,b)=>a.price.compareTo(b.price));
  }
});