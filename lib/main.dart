import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/log_in_page.dart';
import 'pages/sign_up.dart';
import 'pages/sign_up_as.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/signup', page: () => SignUpScreen()),
        GetPage(name: '/signupas', page: () => SignUpAs()),
      ],
    );
  }
}
