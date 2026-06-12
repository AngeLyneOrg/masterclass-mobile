import 'package:masterclass/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> login({
    required String email,
    required String password,
  });

  Future<void> register({
    required String username,
    required String email,
    required String password,
  });

  Future<void> logout();
  Future<String?> getToken();
}