import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_app/features/food_provider.dart';

class ApiResponseFoodPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    CachedNetworkImage(imageUrl:'https://loremflickr.com/g/320/240/paris,girl/all'),
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