import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/product_drop_down_state_provider.dart';

import '../features/product.dart';


class StateProviderSamplePage extends ConsumerWidget {
  const StateProviderSamplePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final products = ref.watch(newProductsProvider);
return Scaffold(
    appBar: AppBar(
      title: const Text('Products'),
      actions: [
        // ProductSortTypeのドロップダウンボタン
        DropdownButton<ProductSortType>(
          // ドロップダウンボタンの初期値
          value:ref.watch(productDropDownStateProvider),
          // ドロップダウンボタンの選択肢
          onChanged: (value) {
            ref.read(productDropDownStateProvider.notifier).state = value!;
          },
          // ドロップダウンボタンの選択肢
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
      itemCount: products.length,
      itemBuilder: (c, i) => Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(products[i].name),
            Gap(20),
            Text(products[i].price.toString()),
          ],
        ),
      ), 
    ),
  );
}
}