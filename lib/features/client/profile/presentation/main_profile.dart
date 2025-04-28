import 'package:flutter/material.dart';
import 'package:project_2cp/features/profile/presentation/Profile_pic.dart';
import 'package:project_2cp/features/profile/presentation/Personal_info.dart';
import 'package:project_2cp/features/profile/presentation/Profile_text.dart';
import 'package:project_2cp/features/profile/presentation/edit.dart';
import 'package:project_2cp/features/profile/presentation/contact_info.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          height: MediaQuery.of(context).size.height*1,
          width: MediaQuery.of(context).size.width*1,
          padding: EdgeInsets.fromLTRB(26, 50, 26, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ProfileText(),
              ProfilePic(),
              PersonalInfo_text(),
              SizedBox(height: 14,),
              PersonalInfo(),
              SizedBox(height: 14,),
              ContactInfo_text(),
              SizedBox(height: 14,),
              ContactInfo(),
              SizedBox(height:MediaQuery.of(context).size.height*0.02,),
              edit(),
            ],
          ),
        ),
    );
  }
}
