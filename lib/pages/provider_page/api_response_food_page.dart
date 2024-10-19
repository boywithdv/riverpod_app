import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/food_provider.dart';

class ApiResponseFoodPage extends ConsumerStatefulWidget {
  @override
  _ApiResponseFoodPageState createState() => _ApiResponseFoodPageState();
}

class _ApiResponseFoodPageState extends ConsumerState<ApiResponseFoodPage> {
  // 再読み込み用のキー
  late int _reloadKey;
  late String _imageUrl = 'https://loremfdfdfdlickr.com/g/320/240/paris,girl/all';

  @override
  void initState() {
    super.initState();
    _reloadKey = 0; // 初期化
  }

  void _reloadImage() {
    setState(() {
      _imageUrl = 'https://loremflickr.com/g/320/240/paris,girl/all';
      _reloadKey++; // 状態を変更して再読み込みをトリガー
    });
  }

  @override
  Widget build(BuildContext context) {
    final foodAsyncValue = ref.watch(foodsProvider());

    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      body: foodAsyncValue.when(
        data: (foods) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: foods.data.length,
              itemBuilder: (context, index) {
                final food = foods.data[index];
                return Column(
                  children: [
                    ListTile(
                      title: Text(food.foodName),
                      subtitle: Text(food.description),
                    ),
                    const Gap(8),
                    Text(food.image?.first.id.toString() ?? 'dd'),
                    CachedNetworkImage(
                      key: ValueKey(_reloadKey), // キーを変更して再レンダリングを促す
                      imageUrl: _imageUrl,
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      placeholder: (context, url) {
                        return CircularProgressIndicator();
                      },
                      errorWidget: (context, url, error) {
                        return Column(
                          children: [
                            ElevatedButton(
                              // 画像の再読み込みを行う
                              onPressed: _reloadImage, 
                              child: Text('再読み込みを行う'),
                            ),
                          ],
                        );
                      },
                    ),
                    const Divider(),
                  ],
                );
              },
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
