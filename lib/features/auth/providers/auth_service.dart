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
    required String username,
    required String name,
    required String lastName,
    required String email,
    required String password,
    required String adress,
    required int number
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.signup(
        username: username,
        name:name,
        last_name:  lastName,
        email: email,
        password: password,
        adress:adress,
        phone_number:number
      );
      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
