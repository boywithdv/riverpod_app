import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entries/product_detail.dart';

/// 商品IDを保持するProvider
final selectedIdProvider = StateProvider<String>((ref) {
  return '';
});

/// 商品データを取得するProvider
final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

/// 商品詳細データを取得するProvider
final productDetailProvider = FutureProvider.autoDispose<ProductDetail>((ref){
  final id = ref.watch(selectedIdProvider);
  return ref.watch(productRepositoryProvider).fetch(productId:id);
});


/*
final productDetailProvider = FutureProvider<ProductDetail>((ref){
  final id = ref.watch(selectedIdProvider);
  return ref.watch(productRepository).fetch(productId:id);
})
*/

/// 上記のように商品データを取得・表示させていた場合には、一度商品画面へ戻って、数分後にまた同じ商品詳細ページに遷移してきても、前回表示された情報がそのまま表示されてしまう。
/// 詳細画面に遷移するたびに「ref.refresh(productDetailProvider)」を呼び出すことで、常に最新のデータの取得・表示を行えることができるが、スマートではない。
/// 
/// 
/// 

class ProductRepository {
  Future<ProductDetail> fetch({required String productId}) async {
    // ここに商品データを取得するロジックを実装します
    // 例えば、APIからデータを取得する場合など
    await Future.delayed(Duration(seconds: 1));
    return ProductDetail(
      id: productId,
      name: 'Sample Product',
      description: 'This is a sample product description.',
      price: 29.99,
    );
  }
}