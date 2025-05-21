import 'package:flutter/material.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/contact_info.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/edit_button.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/profile.pic.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/profile_text.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/reatau.info.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,
        padding: EdgeInsets.fromLTRB(26, 50, 26, 20),
        child: Column(
          children: [
            ProfileText(),
            SizedBox(height:MediaQuery.of(context).size.width*0.05),
            Profile_pic(),
            SizedBox(height:MediaQuery.of(context).size.width*0.05),
            RestauInfo_text(),
            SizedBox(height:MediaQuery.of(context).size.width*0.01),
            RestauInfo(),
            SizedBox(height:MediaQuery.of(context).size.width*0.01),
            ContactInfo_text(),
            SizedBox(height:MediaQuery.of(context).size.width*0.01),
            ContactInfo(),
            SizedBox(height:MediaQuery.of(context).size.width*0.01),
            edit()
          ],
        ),
      )
    );
  }  
}