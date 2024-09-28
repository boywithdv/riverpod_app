import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_body.freezed.dart';
part 'api_response_body.g.dart';

/// APIでリクエストが成功した場合のレスポンスボディを表現するデータクラス。
/// [T] にはエンドポイントごとのオブジェクトや配列が入っている。
///
/// ```json
/// {
///     "data": {} or [],
///     "meta": {}
/// }
/// ```
///
/// Freezedを用いたクラスだと、謎の型不一致警告が検出されてしまうので、JsonSerializableを使う。
@immutable
@JsonSerializable(genericArgumentFactories: true)
class ApiResponseBody<T> {
  const ApiResponseBody({
    required this.data,
    this.meta,
  });

  factory ApiResponseBody.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseBodyFromJson(json, fromJsonT);

  Map<String, Object?> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseBodyToJson(this, toJsonT);

  final T data;
  final Meta? meta;

  ApiResponseBody<T> copyWith({T? data, Meta? meta}) {
    return ApiResponseBody(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ApiResponseBody<T> &&
        const DeepCollectionEquality().equals(other.data, data) &&
        other.meta == meta;
  }

  @override
  int get hashCode => data.hashCode ^ meta.hashCode;
}

/// データ配列の中身。 一意の [id] と情報のまとまりである [attributes] が入っている。
///
/// ```json
/// [
///     {
///         "id": 1,
///         "attributes": {}
///     }
/// ]
/// ```
///
/// Freezedを用いたクラスだと、謎の型不一致警告が検出されてしまうので、JsonSerializableを使う。
@immutable
@JsonSerializable(genericArgumentFactories: true)
class Datum<T extends Object> {
  const Datum({
    required this.id,
    required this.attributes,
  });

  factory Datum.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$DatumFromJson(json, fromJsonT);

  Map<String, Object?> toJson(Object? Function(T) toJsonT) =>
      _$DatumToJson(this, toJsonT);

  final int id;
  final T attributes;

  Datum<T> copyWith({int? id, T? attributes}) {
    return Datum(
      id: id ?? this.id,
      attributes: attributes ?? this.attributes,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Datum<T> &&
        other.id == id &&
        other.attributes == attributes;
  }

  @override
  int get hashCode => id.hashCode ^ attributes.hashCode;
}

/// Generics型のdataのみを持つクラス。
@immutable
@JsonSerializable(genericArgumentFactories: true)
class Data<T extends Object?> {
  const Data({
    required this.data,
  });

  factory Data.fromJson(
    Map<String, Object?> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$DataFromJson(json, fromJsonT);

  Map<String, Object?> toJson(Object? Function(T) toJsonT) =>
      _$DataToJson(this, toJsonT);

  final T data;

  Data<T> copyWith({T? data}) {
    return Data(
      data: data ?? this.data,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is Data<T> && other.data == data;
  }

  @override
  int get hashCode => data.hashCode;
}

/// APIレスポンスのメタ情報を表現するデータクラス。
///
/// ```json
/// {
///     "meta": {
///         "pagination": {}
///     }
/// }
/// ```
@freezed
class Meta with _$Meta {
  const factory Meta({
    Pagination? pagination,
  }) = _Meta;

  factory Meta.fromJson(Map<String, Object?> json) => _$MetaFromJson(json);
}

/// APIレスポンスのメタ情報を表現するデータクラス。
///
/// ```json
/// {
///     "pagination": {
///         "page": 1,
///         "pageSize": 10,
///         "pageCount": 1,
///         "total": 5
///     }
/// }
/// ```
///
/// or
///
/// ```json
/// {
///    "pagination": {
///        "start": 0,
///        "limit": 10,
///        "total": 42
///    }
/// }
/// ```
///
/// unionKey がないため、`@Freezed(unionKey: xxx)` を使用せず
/// `fromJson` と `toJson` を独自で実装している。
@freezed
sealed class Pagination with _$Pagination {
  /// [PagePagination] は、アプリでは使用しない。
  /// ページング利用箇所では [OffsetPagination] を使用している。
  ///
  /// デフォルトで [PagePagination] が [Meta] に入ってくるエンドポイントがあるため、
  /// パースエラーを防ぐために、sealedクラスで定義を残している。
  const factory Pagination.page({
    /// 現在のページ番号。
    required int page,

    /// 1ページあたりの表示件数。
    required int pageSize,

    /// 合計ページ数。
    required int pageCount,

    /// 合計件数。
    required int total,
  }) = PagePagination;

  const factory Pagination.offset({
    /// 取得開始位置。
    required int offset,

    /// 取得件数。
    required int limit,

    /// 合計件数。
    required int total,
  }) = OffsetPagination;

  const Pagination._();

  factory Pagination.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('page')) {
      return PagePagination(
        page: json['page'] as int,
        pageSize: json['pageSize'] as int,
        pageCount: json['pageCount'] as int,
        total: json['total'] as int,
      );
    } else if (json.containsKey('start')) {
      return OffsetPagination(
        offset: json['start'] as int,
        limit: json['limit'] as int,
        total: json['total'] as int,
      );
    } else {
      throw const FormatException('Invalid JSON format for Pagination');
    }
  }

  Map<String, dynamic> toJson() {
    return when(
      page: (page, pageSize, pageCount, total) => {
        'page': page,
        'pageSize': pageSize,
        'pageCount': pageCount,
        'total': total,
      },
      offset: (start, limit, total) => {
        'start': start,
        'limit': limit,
        'total': total,
      },
    );
  }
}
