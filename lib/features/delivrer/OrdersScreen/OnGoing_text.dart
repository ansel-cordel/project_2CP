import 'package:flutter/material.dart';

class ongoingText extends StatelessWidget{
  const ongoingText({super.key});

  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         Align(
          alignment: Alignment.center,
           child: Text("On Going Orders",
           style: TextStyle(
           color:Colors.black,
           fontSize:a*0.07,
           fontWeight: FontWeight.w800
            ),
                   ),
         ),
      ],
    );
  }
  
}