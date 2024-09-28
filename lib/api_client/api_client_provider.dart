import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'model/api_client.dart';

part 'api_client_provider.g.dart';

/// APIを使用するためのクライアントである[ApiClient]を提供する。
@Riverpod(keepAlive: true)
ApiClient apiClient(ApiClientRef ref) {
  return ApiClient.fromParameters(
    baseUrl: 'http://localhost:1337/api/', timeoutDuration: const Duration(seconds: 45), token: '',
  );
}
