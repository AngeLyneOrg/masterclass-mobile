class UserEntity {
  final String id;
  final String email;
  final String username;
  final String token;
  final String refreshToken;

  const UserEntity({
    required this.id,
    required this.email,
    required this.username,
    required this.token,
    required this.refreshToken,
  });
}