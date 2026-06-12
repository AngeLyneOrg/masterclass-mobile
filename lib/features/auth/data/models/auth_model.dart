import 'package:masterclass/features/auth/domain/entities/user_entity.dart';

class AuthModel extends UserEntity {
  const AuthModel({
    required super.id,
    required super.email,
    required super.username,
    required super.token,
    required super.refreshToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
    id:           json['id']            ?? '',
    email:        json['email']         ?? '',
    username:     json['username']      ?? '',
    token:        json['access']        ?? '',
    refreshToken: json['refresh']       ?? '',
  );
}