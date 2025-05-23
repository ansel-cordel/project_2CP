import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart' show Get;
import 'package:project_2cp/features/auth/presentation/log_in_page.dart';

class ProfileText extends StatelessWidget {
  const ProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    double a = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "  Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(a * 0.03)),
          onPressed: () {
            Get.to(LoginScreen());
          },
          child: Text(
            "Log Out",
            style: TextStyle(color: Colors.red, fontSize: a * 0.05),
          ),
        )
      ],
    );
  }
}