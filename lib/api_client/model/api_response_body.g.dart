// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseBody<T> _$ApiResponseBodyFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponseBody<T>(
      data: fromJsonT(json['data']),
      meta: json['meta'] == null
          ? null
          : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseBodyToJson<T>(
  ApiResponseBody<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
      'meta': instance.meta,
    };

Datum<T> _$DatumFromJson<T extends Object>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Datum<T>(
      id: (json['id'] as num).toInt(),
      attributes: fromJsonT(json['attributes']),
    );

Map<String, dynamic> _$DatumToJson<T extends Object>(
  Datum<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'id': instance.id,
      'attributes': toJsonT(instance.attributes),
    };

Data<T> _$DataFromJson<T extends Object?>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Data<T>(
      data: fromJsonT(json['data']),
    );

Map<String, dynamic> _$DataToJson<T extends Object?>(
  Data<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'data': toJsonT(instance.data),
    };

_$MetaImpl _$$MetaImplFromJson(Map<String, dynamic> json) => _$MetaImpl(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
    };
