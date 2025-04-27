import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:project_2cp/features/auth/data/fetch.dart';
import 'dart:convert';


import '../data/token_storage.dart';

final authServiceProvider = Provider((ref) => Auth());

/// REGISTER
final registerResponseProvider =
    StateNotifierProvider<RegisterNotifier, AsyncValue<http.Response?>>((ref) {
  return RegisterNotifier(ref.read(authServiceProvider));
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
    required int number,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.signup(
        username: username,
        name: name,
        last_name: lastName,
        email: email,
        password: password,
        adress: adress,
        phone_number: number,
      );
      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}

/// LOGIN
final loginResponseProvider =
    StateNotifierProvider<LoginNotifier, AsyncValue<http.Response?>>((ref) {
  return LoginNotifier(ref.read(authServiceProvider));
});

class LoginNotifier extends StateNotifier<AsyncValue<http.Response?>> {
  final Auth _apiService;

  LoginNotifier(this._apiService) : super(const AsyncValue.data(null));

  Future<void> loginUser({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();
    try {
      final response = await _apiService.login(
        username: username,
        password: password,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final token = data['token'];
        await TokenStorage.saveToken(token);
      }

      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }
}
