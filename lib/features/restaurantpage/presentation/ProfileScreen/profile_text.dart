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
        const Text(
          "  Profile",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w900),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(a * 0.03)),
          onPressed: () async {
            try {
              print("Logout button pressed");
              
              // Show loading indicator
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );

              final loginNotifier = ref.read(loginResponseProvider.notifier);
              await loginNotifier.logout();
              
              // Close loading dialog
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              
              // Navigation is handled in the logout method
              print("Logout completed successfully");
              
            } catch (e) {
              // Close loading dialog if still open
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
              
              print("Logout error in UI: $e");
              
              // Still navigate to login even if there's an error
              Get.offAll(() => LoginScreen());
              
              // Optionally show error message
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Logout completed (with issues): ${e.toString()}"),
                  backgroundColor: Colors.orange,
                ),
              );
            }
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
