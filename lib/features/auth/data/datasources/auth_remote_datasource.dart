import 'package:dio/dio.dart';
import 'package:masterclass/core/services/api_client.dart';
import '../models/auth_model.dart';

class AuthRemoteDataSource {
  final _client = ApiClient.instance;

  Future<AuthModel> login({
    required String email,
    required String password,
  }) async {
    final response = await _client.dio.post(
      '/token/',
      data: {'email': email, 'password': password},
    );
    final user = AuthModel.fromJson(response.data);
    await _client.saveTokens(
      access:  user.token,
      refresh: user.refreshToken,
    );
    return user;
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    await _client.dio.post(
      '/users/register/',
      data: {
        'username': username,
        'email':    email,
        'password': password,
      },
    );
  }

  Future<void> logout() => _client.clearTokens();

  Future<String?> getToken() => _client.getToken();
}