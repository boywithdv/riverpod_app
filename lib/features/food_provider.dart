import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/api_client/model/food.dart';

import '../api_client/api_client_provider.dart';
import '../api_client/model/api_response_body.dart';


part 'food_provider.g.dart';

@riverpod
Future<Data<List<Food>>> foods(
  FoodsRef ref, {
  int offset = 0,
  int limit = 25,
}) async {
  final r = await ref.watch(apiClientProvider).getFoods(
        populate: '',
      );
  return r;
}
