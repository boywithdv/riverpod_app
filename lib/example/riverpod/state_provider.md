
# StateProvider

https://riverpod.dev/docs/providers/state_provider

StateProvider は、状態を変更する方法を提供するプロバイダです。

これは、NotifierProvider の簡易版として設計されており、非常にシンプルなユースケースに使用されます。

StateProvider は、ユーザーインターフェースからシンプルな変数を変更することが主な目的です。

StateProvider の状態は通常、以下のいずれかです：

- フィルタの種類のような列挙型（enum）
- テキストフィールドの生の内容を保持する `String`
- チェックボックスのための `boolean`
- ページネーションや年齢入力フィールドのための `number`

### StateProvider を使わない方が良いケース

次の場合には StateProvider を使用しないでください：

- 状態にバリデーションロジックが必要な場合
- 状態が複雑なオブジェクトの場合（カスタムクラスやリスト/マップなど）
- 状態を変更するロジックが count++ のようにシンプルではない場合

### 使用例: ドロップダウンを使用したフィルタタイプの変更

実際のユースケースでは、StateProvider を使用してドロップダウンやチェックボックスなどのシンプルなフォームコンポーネントの状態を管理します。
ここでは、製品リストをフィルタリングするドロップダウンを StateProvider で実装する方法を紹介しています。

1. **製品リストの作成**
    - シンプルな Product クラスを定義し、いくつかの製品をリストとして定義。
        製品リストを提供する productsProvider を作成。
1. **製品リストの表示**
    - ListView.builder を使用して、productsProvider から取得した製品を画面に表示。
1. **ドロップダウンメニューの追加**
    - DropDownButton を追加し、価格や名前で製品を並べ替える機能を実装。
1. **StateProvider との同期**
    - ドロップダウンの選択に基づいて StateProvider の状態を変更し、製品リストを並べ替える。

#### 製品リストを作成する

```dart
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

final productsProvider = Provider<List<Product>>((ref) {
  return _products;
});
```

#### ここで製品リストを表示する

```dart
Widget build(BuildContext context, WidgetRef ref) {
  final products = ref.watch(productsProvider);
  return Scaffold(
    body: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return ListTile(
          title: Text(product.name),
          subtitle: Text('${product.price} \$'),
        );
      },
    ),
  );
}
```

### DropDownメニューの追加

土台ができたところで、ここにドロップダウンメニューを追加しましょう。 このドロップダウンメニューは商品リストを値段順か名前順かでソートしてくれます。 メニューを表示するボタンには Flutter の DropDownButton を使います。

```dart

// フィルタの種類を表す列挙型
enum ProductSortType {
  name,
  price,
}

Widget build(BuildContext context, WidgetRef ref) {
  final products = ref.watch(productsProvider);
  return Scaffold(
    appBar: AppBar(
      title: const Text('Products'),
      actions: [
        DropdownButton<ProductSortType>(
          value: ProductSortType.price,
          onChanged: (value) {},
          items: const [
            DropdownMenuItem(
              value: ProductSortType.name,
              child: Icon(Icons.sort_by_alpha),
            ),
            DropdownMenuItem(
              value: ProductSortType.price,
              child: Icon(Icons.sort),
            ),
          ],
        ),
      ],
    ),
    body: ListView.builder(
      // ... /* SKIP */
      itemBuilder: (c, i) => Container(), /* SKIP END */
    ),
  );
}
```

### StateProviderの作成をする

StateProviderを作成してプロバイダとドロップダウンメニューのステートを同期させる。

```dart
final productSortTypeProvider = StateProvider<ProductSortType>(
  // ソートの種類 name を返します。これがデフォルトのステートとなります。
  (ref) => ProductSortType.name,
);
```

### プロバイダとドロップダウンメニューを紐付ける

```dart
DropdownButton<ProductSortType>(
  // ソートの種類が変わると、ドロップダウンメニューが更新されて
  // 表示されるアイコン（メニューアイテム）が変わります。
  value: ref.watch(productSortTypeProvider),
  // ユーザがドロップダウンメニューを操作するとプロバイダのステートが更新されます。
  onChanged: (value) =>
      ref.read(productSortTypeProvider.notifier).state = value!,
  items: [
    // ...
  ],
),
```

### ProductsProviderを更新することで実際のソートを行えるようにする

実装の鍵となるのは`ref.watch`。
`ref.watch`を使って`ProductsProvider`に現在のソートの種類を監視・取得させ、その値が変わるたびに商品リストを再評価させる。

```dart
final productsProvider = Provider<List<Product>>((ref) {
  final sortType = ref.watch(productSortTypeProvider);
  switch (sortType) {
    case ProductSortType.name:
      return _products.sorted((a, b) => a.name.compareTo(b.name));
    case ProductSortType.price:
      return _products.sorted((a, b) => a.price.compareTo(b.price));
  }
});
```
