import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

import 'package:project_2cp/features/auth/presentation/log_in_page.dart';
import 'package:project_2cp/features/auth/providers/auth_service.dart';

class ProfileText extends ConsumerWidget {
  const ProfileText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double a = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "  Profile",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w900,
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(a * 0.03),
          ),
          onPressed: () async {
            await ref.read(loginResponseProvider.notifier).logout();
            Get.to(LoginScreen());
          },
          child: Text(
            "Log Out",
            style: TextStyle(
              color: Colors.red,
              fontSize: a * 0.05,
            ),
          ),
        ),
      ],
    );
  }
}
