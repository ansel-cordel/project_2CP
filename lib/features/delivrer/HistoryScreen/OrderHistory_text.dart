import 'package:flutter/material.dart';

class OrderhistoryText extends StatelessWidget{
  
  const OrderhistoryText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Text("  Order History:",
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