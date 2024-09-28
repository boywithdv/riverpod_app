import 'package:flutter/material.dart';
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  foods.data.first.foodName,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                Text(
                  foods.data.first.description,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
              ],
            ),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}