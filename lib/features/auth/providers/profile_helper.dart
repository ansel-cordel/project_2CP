// Create this as a separate file: profile_helper.dart
import 'package:project_2cp/features/auth/data/token_storage.dart';

class ProfileHelper {
  // Get profile name
  static Future<String> getProfileName() async {
    final profile = await TokenStorage.getProfile();
    return profile?['name'] ?? 'User';
  }

  // Get profile address
  static Future<String> getProfileAddress() async {
    final profile = await TokenStorage.getProfile();
    return profile?['address'] ?? '';
  }

  // Get profile phone
  static Future<String> getProfilePhone() async {
    final profile = await TokenStorage.getProfile();
    return profile?['phone_number'] ?? '';
  }

  // Get username
  static Future<String> getUsername() async {
    final user = await TokenStorage.getUser();
    return user?['username'] ?? '';
  }

  // Get email
  static Future<String> getEmail() async {
    final user = await TokenStorage.getUser();
    return user?['email'] ?? '';
  }

  // Get full user info for display
  static Future<Map<String, String>> getDisplayInfo() async {
    final profile = await TokenStorage.getProfile();
    final user = await TokenStorage.getUser();
    
    return {
      'name': profile?['name'] ?? 'User',
      'email': user?['email'] ?? '',
      'phone': profile?['phone_number'] ?? '',
      'address': profile?['address'] ?? '',
      'username': user?['username'] ?? '',
    };
  }
}