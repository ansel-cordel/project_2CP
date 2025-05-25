import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/auth/providers/auth_service.dart';
import 'package:project_2cp/features/client/profile/presentation/Profile_pic.dart';
import 'package:project_2cp/features/client/profile/presentation/Personal_info.dart';
import 'package:project_2cp/features/client/profile/presentation/Profile_text.dart';
import 'package:project_2cp/features/client/profile/presentation/edit.dart';
import 'package:project_2cp/features/client/profile/presentation/contact_info.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileAsync = ref.watch(fullProfileProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text("Error: \$error")),
        data: (data) {
          final user = data['user'];
          final profile = data['profile'];

          final name = profile['restaurant_id'] ?? '';
          final phone = profile['phone_number'] ?? '';
          final address = profile['address'] ?? '';

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(26, 50, 26, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ProfileText(),
                const ProfilePic(),
                const PersonalInfo_text(),
                const SizedBox(height: 14),
                PersonalInfo(name: name.toString(), location: address),
                const SizedBox(height: 14),
                const ContactInfo_text(),
                const SizedBox(height: 14),
                ContactInfo(phonenumber: phone),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const edit(),
              ],
            ),
          );
        },
      ),
    );
  }
}
