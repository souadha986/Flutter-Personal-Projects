import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Android options (encrypted storage)
  AndroidOptions _getAndroidOptions() =>
      const AndroidOptions(encryptedSharedPreferences: true);

  // Instance of FlutterSecureStorage
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  // Keys (to avoid typos everywhere)
  static const String _tokenKey = "auth_token";

  /// Save token
  Future<void> setToken(String? token) async {
    await _storage.write(
      key: _tokenKey,
      value: token ?? "",
      aOptions: _getAndroidOptions(),
    );
  }

  /// Get token
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey, aOptions: _getAndroidOptions());
  }

  /// Remove token
  Future<void> removeToken() async {
    await _storage.delete(key: _tokenKey, aOptions: _getAndroidOptions());
  }
}
