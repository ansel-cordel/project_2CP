import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/data/fetch.dart';
import 'package:project_2cp/features/auth/data/token_storage.dart';

final authServiceProvider = Provider((ref) => Auth());

final loginResponseProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<Map<String, dynamic>?>>((ref) {
  return LoginNotifier(ref.read(authServiceProvider));
});

// New profile providers (optional - won't affect existing UI)
final profileProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  return await TokenStorage.getProfile();
});

final userProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  return await TokenStorage.getUser();
});

class LoginNotifier extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final Auth _apiService;

  LoginNotifier(this._apiService) : super(const AsyncValue.data(null));

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.login(
        email: email,
        password: password,
      );

      final token = response['token'];
      final role = response['role'];
      
      print("Received role: $role"); // Debug print

      // Save existing data (unchanged)
      await TokenStorage.saveToken(token);
      await TokenStorage.saveRole(role);
      
      // Save new profile data (won't affect existing UI)
      await TokenStorage.saveProfile(response['profile']);
      await TokenStorage.saveUser(response['user']);

      // Return the same format as before - your UI will work unchanged
      state = AsyncValue.data({
        'token': token,
        'role': role,
        // Include additional data for future use
        'profile': response['profile'],
        'user': response['user'],
      });
    } catch (e, stack) {
      print("Error in loginUser: $e");
      state = AsyncValue.error(e, stack);
    }
  }

  Future<void> logout() async {
  try {
    final token = await TokenStorage.getToken();
    if (token != null) {
      await _apiService.logout(token); // Call the backend
    }
  } catch (e) {
    print("Logout API failed: $e");
  } finally {
    await TokenStorage.clearAll();
    state = const AsyncValue.data(null);
  }
}
}