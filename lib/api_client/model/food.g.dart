// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodImpl _$$FoodImplFromJson(Map<String, dynamic> json) => _$FoodImpl(
      foodName: json['foodName'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
      place: json['place'] as String,
    );

Map<String, dynamic> _$$FoodImplToJson(_$FoodImpl instance) =>
    <String, dynamic>{
      'foodName': instance.foodName,
      'description': instance.description,
      'image': instance.image,
      'place': instance.place,
    };
