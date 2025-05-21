import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget{
  const ProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("Profile",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width*0.055,
            fontWeight: FontWeight.w900
          ),
          )
        ],
      ),
    );
  }
  
}