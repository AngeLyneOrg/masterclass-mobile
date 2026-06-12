import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient instance = ApiClient._();

  final _storage = const FlutterSecureStorage();

  late final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://10.0.2.2:8000/api', // Android emulator → localhost
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {'Content-Type': 'application/json'},
    ),
  )..interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Injecte le token sur chaque requête
        final token = await _storage.read(key: 'access_token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
      onError: (error, handler) async {
        // Auto-logout sur 401
        if (error.response?.statusCode == 401) {
          await _storage.deleteAll();
          // Le redirect sera géré par le provider
        }
        handler.next(error);
      },
    ),
  );

  Future<void> saveTokens({
    required String access,
    required String refresh,
  }) async {
    await _storage.write(key: 'access_token',   value: access);
    await _storage.write(key: 'refresh_token',  value: refresh);
  }

  Future<void> clearTokens() async => _storage.deleteAll();

  Future<String?> getToken() => _storage.read(key: 'access_token');
}