import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:masterclass/features/auth/domain/entities/user_entity.dart';
import 'package:masterclass/features/auth/domain/repositories/auth_repository_impl.dart';

final authProvider = ChangeNotifierProvider<AuthProvider>((ref) {
  return AuthProvider()..checkAuth();
});

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthProvider extends ChangeNotifier {
  final _repo = AuthRepositoryImpl();

  AuthStatus _status = AuthStatus.initial;
  UserEntity? _user;
  String? _errorMessage;

  AuthStatus get status       => _status;
  UserEntity? get user        => _user;
  String? get errorMessage    => _errorMessage;
  bool get isAuthenticated    => _status == AuthStatus.authenticated;

  // Vérifie si un token existe au démarrage
  Future<void> checkAuth() async {
    final token = await _repo.getToken();
    _status = token != null
        ? AuthStatus.authenticated
        : AuthStatus.unauthenticated;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      _user   = await _repo.login(email: email, password: password);
      _status = AuthStatus.authenticated;
    } catch (e) {
      _status       = AuthStatus.error;
      _errorMessage = _parseError(e);
    }
    notifyListeners();
  }

  Future<void> register({
    required String username,
    required String email,
    required String password,
  }) async {
    _status = AuthStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      await _repo.register(
        username: username,
        email: email,
        password: password,
      );
      _status = AuthStatus.unauthenticated; // → redirect to login
    } catch (e) {
      _status       = AuthStatus.error;
      _errorMessage = _parseError(e);
    }
    notifyListeners();
  }

  Future<void> logout() async {
    await _repo.logout();
    _user   = null;
    _status = AuthStatus.unauthenticated;
    notifyListeners();
  }

  String _parseError(dynamic e) {
    if (e.toString().contains('401')) return 'Invalid email or password';
    if (e.toString().contains('400')) return 'Please check your information';
    if (e.toString().contains('connection')) return 'No internet connection';
    return 'Something went wrong. Please try again.';
  }
}