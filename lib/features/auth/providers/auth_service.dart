import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/data/fetch.dart';
import 'package:http/http.dart' as http;


final registerApiServiceProvider = Provider((ref) => Auth());


final registerResponseProvider =
    StateNotifierProvider<RegisterNotifier, AsyncValue<http.Response?>>((ref) {
  return RegisterNotifier(ref.read(registerApiServiceProvider));
});

class RegisterNotifier extends StateNotifier<AsyncValue<http.Response?>> {
  final Auth _apiService;
  RegisterNotifier(this._apiService) : super(const AsyncValue.data(null));

  Future<void> registerUser({
    required String name,
    required String lastName,
    required String email,
    required String password,
    required String role,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.signup(
        name: name,
        lastname:  lastName,
        email: email,
        password: password,
        role: role,
      );
      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
