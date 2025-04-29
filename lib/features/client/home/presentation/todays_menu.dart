import 'package:flutter/material.dart';

class TodaysMenuText extends StatelessWidget {
  const TodaysMenuText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Today's Menu:",
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
