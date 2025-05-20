import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/Profile_pic.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/Profile_text.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/contact_info.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/edit.dart';
 // renamed to EditButton
import 'package:project_2cp/features/delivrer/ProfileScreen/personal_info.dart';

import 'package:project_2cp/features/delivrer/providers/toggleprovider.dart'; // your isEditingProvider file

class DelivererProfileScreen extends ConsumerWidget {
  const DelivererProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditing = ref.watch(isEditingProvider);

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(26, 50, 26, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileText(),
            const SizedBox(height: 20),
            const ProfilePic(),
            const SizedBox(height: 20),
            const PersonalInfo_text(),
            const SizedBox(height: 14),
            PersonalInfo(isEditing: isEditing),
            const SizedBox(height: 14),
            const ContactInfo_text(),
            const SizedBox(height: 14),
            ContactInfo(isEditing: isEditing),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const EditButton(),
          ],
        ),
      ),
    );
  }
}
