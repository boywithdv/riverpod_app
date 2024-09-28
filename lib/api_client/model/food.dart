import 'package:freezed_annotation/freezed_annotation.dart';

part 'food.freezed.dart';
part 'food.g.dart';

/// 果物名
@freezed
class Food with _$Food {
  const factory Food({
    required String foodName,
    required String description,
     String? image,
    required String place,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) =>
      _$FoodFromJson(json);
}
