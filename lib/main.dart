import 'package:flutter/material.dart';
import 'package:project_2cp/features/home/presentation/main_home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'features/auth/presentation/log_in_page.dart';
import 'features/auth/presentation/sign_up.dart';
import 'features/auth/presentation/sign_up_as.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/signupas', page: () => SignUpAs()),
      ],
    );
  }
}
