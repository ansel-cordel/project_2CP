import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _tokenKey = 'auth_token';
  static const _roleKey = 'user_role';
  static const _profileKey = 'user_profile';
  static const _userKey = 'user_data';

  // Existing token methods (unchanged)
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  static Future<bool> hasToken() async {
    return await _storage.containsKey(key: _tokenKey);
  }

  // Existing role methods (unchanged)
  static Future<void> saveRole(String role) async {
    await _storage.write(key: _roleKey, value: role);
  }

  static Future<String?> getRole() async {
    return await _storage.read(key: _roleKey);
  }

  static Future<bool> hasRole() async {
    return await _storage.containsKey(key: _roleKey);
  }

  // New profile methods
  static Future<void> saveProfile(Map<String, dynamic>? profile) async {
    if (profile != null) {
      final profileJson = jsonEncode(profile);
      await _storage.write(key: _profileKey, value: profileJson);
    }
  }

  static Future<Map<String, dynamic>?> getProfile() async {
    final profileJson = await _storage.read(key: _profileKey);
    if (profileJson != null) {
      return jsonDecode(profileJson);
    }
    return null;
  }

  // New user methods
  static Future<void> saveUser(Map<String, dynamic>? user) async {
    if (user != null) {
      final userJson = jsonEncode(user);
      await _storage.write(key: _userKey, value: userJson);
    }
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final userJson = await _storage.read(key: _userKey);
    if (userJson != null) {
      return jsonDecode(userJson);
    }
    return null;
  }

  // Clear all data on logout
  static Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}