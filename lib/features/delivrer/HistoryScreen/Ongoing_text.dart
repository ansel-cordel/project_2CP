import 'package:flutter/material.dart';

class Ongoing_Text extends StatelessWidget{
  const Ongoing_Text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text("  OnGoing order:",
         style: TextStyle(
         color:Colors.black,
         fontSize: 17,
         fontWeight: FontWeight.w500
          ),
        ),
      ],
    );
  }
  
}