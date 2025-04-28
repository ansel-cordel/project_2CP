import 'package:flutter/material.dart';

class ongoingText extends StatelessWidget{
  const ongoingText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text("  On Going Orders:",
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