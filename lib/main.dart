import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:project_2cp/features/client/home/presentation/main_home_fr.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/main_orders_fr.dart';
import 'package:project_2cp/features/restaurantpage/presentation/mainpage.dart';
import 'features/auth/presentation/log_in_page.dart';
import 'features/auth/presentation/sign_up.dart';
import 'features/auth/presentation/sign_up_as.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/signup',
      getPages: [
        GetPage(name: "/resto", page: () => HomePageresto()),
        GetPage(name: "/deliverer", page: () => Deliverer()),
        GetPage(name: '/home', page: () => const HomePage()),
        GetPage(name: '/login', page: () => const LoginScreen()),
        GetPage(
            name: '/signup',
            page: () => const SignUpScreen(
                  role: "deliverer",
                )),
        GetPage(name: '/signupas', page: () => const SignUpAs()),
      ],
    );
  }
}
