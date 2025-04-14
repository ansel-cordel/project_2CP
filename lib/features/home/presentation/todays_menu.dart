import 'package:flutter/material.dart';


class TodaysMenu_text extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        "Today's Menu:",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    ]);
  }
}

