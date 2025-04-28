import 'package:flutter/material.dart';

class ProfileText extends StatelessWidget{
  const ProfileText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text("  Profile",
         style: TextStyle(
         color:Colors.black,
         fontSize: 25,
         fontWeight: FontWeight.w900
          ),
        ),
      ],
    );
  }
  
}