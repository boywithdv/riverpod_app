import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_app/api_client/model/image_data.dart';

part 'food.freezed.dart';
part 'food.g.dart';

/// 果物名
@freezed
class Food with _$Food {
  const factory Food({
    /// 果物名。
    required String foodName,

    /// 果物の説明。
    required String description,

    /// 果物の画像URL。
    List<ImageData>? image,

    /// 果物の価格。
    required int price,
  }) = _Food;

  factory Food.fromJson(Map<String, dynamic> json) =>
      _$FoodFromJson(json);
}
