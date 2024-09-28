import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart' hide Headers;

import 'api_response_body.dart';
import 'food.dart';


part 'api_client.g.dart';

/// APIクライアント。
@RestApi()
abstract class ApiClient {
  factory ApiClient.internal(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;

  /// 各パラメーターを引数で受け取り、内部で[Dio]のインスタンスを使用して[ApiClient]を生成する。
  factory ApiClient.fromParameters({
    required String baseUrl,
    required Duration timeoutDuration,
    required String token,
  }) {
    return _ApiClient(
      Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: timeoutDuration,
          sendTimeout: timeoutDuration,
          receiveTimeout: timeoutDuration,
          contentType: Headers.jsonContentType,
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      )..interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
        ),
    );
  }

  @GET('/foods')
  Future<Data<List<Food>>> getFoods({
    @Query('populate') required String populate,
  });
}
