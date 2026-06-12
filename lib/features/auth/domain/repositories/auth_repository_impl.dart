import 'package:masterclass/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:masterclass/features/auth/domain/entities/user_entity.dart';
import 'package:masterclass/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _dataSource = AuthRemoteDataSource();

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) => _dataSource.login(email: email, password: password);

  @override
  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) => _dataSource.register(
    username: username,
    email: email,
    password: password,
  );

  @override
  Future<void> logout() => _dataSource.logout();

  @override
  Future<String?> getToken() => _dataSource.getToken();
}