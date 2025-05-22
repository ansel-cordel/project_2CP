import 'package:flutter/material.dart';
import 'package:project_2cp/features/auth/providers/profile_helper.dart';
import 'package:project_2cp/features/client/profile/presentation/Profile_pic.dart';
import 'package:project_2cp/features/client/profile/presentation/Personal_info.dart';
import 'package:project_2cp/features/client/profile/presentation/Profile_text.dart';
import 'package:project_2cp/features/client/profile/presentation/edit.dart';
import 'package:project_2cp/features/client/profile/presentation/contact_info.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Map<String, String>> _profileData;

  @override
  void initState() {
    super.initState();
    _profileData = ProfileHelper.getDisplayInfo(); // Fetch profile + user
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Map<String, String>>(
        future: _profileData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text("No profile data found"));
          }

          final data = snapshot.data!;
          final name = data['name'] ?? '';
          
          final phone = data['phone'] ?? '';
          final address = data['address'] ?? '';
          

          return Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(26, 50, 26, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProfileText(),             // You can pass `username` here if needed
                ProfilePic(),
                PersonalInfo_text(),
                const SizedBox(height: 14),
               PersonalInfo(name: name, location: address),         // You can pass `name`, etc. here
                const SizedBox(height: 14),
                ContactInfo_text(),
                const SizedBox(height: 14),
                ContactInfo(phonenumber: phone,),            // You can pass `email`, `phone`, etc.
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                edit(),                   // Optional edit button
              ],
            ),
          );
        },
      ),
    );
  }
}
