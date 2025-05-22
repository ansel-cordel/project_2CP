import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/data/fetch.dart';


// 1. Create a StateNotifier for handling registration state
class RegisterNotifier extends StateNotifier<AsyncValue<void>> {
  final Auth authRepository;

  RegisterNotifier(this.authRepository) : super(const AsyncValue.data(null));

  Future<void> register({
    required String username,
    required int phoneNumber,
    required String name,
    required String lastName,
    required String password,
    required String email,
    required String address,
    required String role,
  }) async {
    state = const AsyncValue.loading();
    try {
      await authRepository.signup(
        username: username,
        phoneNumber: phoneNumber,
        name: name,
        lastName: lastName,
        password: password,
        email: email,
        address: address,
        role: role,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// 2. Create the provider
final registerResponseProvider =
    StateNotifierProvider<RegisterNotifier, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterNotifier(authRepository);
});

// 3. You'll also need a provider for your AuthRepository
final authRepositoryProvider = Provider<Auth>((ref) {
  return Auth();
});