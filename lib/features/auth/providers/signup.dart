import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/data/fetch.dart';

// 1. Create a StateNotifier for handling regular registration state
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
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// 2. Create a StateNotifier for handling deliverer registration state
class RegisterDelivererNotifier extends StateNotifier<AsyncValue<void>> {
  final Auth authRepository;

  RegisterDelivererNotifier(this.authRepository) : super(const AsyncValue.data(null));

  Future<void> registerDeliverer({
    required String username,
    required int phoneNumber,
    required String name,
    required String lastName,
    required String password,
    required String email,
    required String workingZone,
    required String vehicleType,
  }) async {
    state = const AsyncValue.loading();
    try {
      await authRepository.signupDeliverer(
        username: username,
        phoneNumber: phoneNumber,
        name: name,
        lastName: lastName,
        password: password,
        email: email,
        workingZone: workingZone,
        vehicleType: vehicleType,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// 3. Create the provider for regular registration
final registerResponseProvider =
    StateNotifierProvider<RegisterNotifier, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterNotifier(authRepository);
});

// 4. Create the provider for deliverer registration
final registerDelivererResponseProvider =
    StateNotifierProvider<RegisterDelivererNotifier, AsyncValue<void>>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return RegisterDelivererNotifier(authRepository);
});

// 5. Provider for your AuthRepository
final authRepositoryProvider = Provider<Auth>((ref) {
  return Auth();
});