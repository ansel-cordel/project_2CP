import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget {
  final int currentStep;
   OrderTracking({super.key, this.currentStep = 0});

  final List<String> current = ["Ordered", "Picked Up", "Delivered", "Received"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double stepCircleSize = screenWidth * 0.08; // Responsive step size
    double lineHeight = screenWidth * 0.015; // Responsive line height
    double textSize = screenWidth * 0.025; // Responsive text size

    return Padding(
      padding: EdgeInsets.only(left: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          4,
          (index) => Flexible(
            child: buildStep(index, context, index < 3, stepCircleSize, lineHeight, textSize),
          ),
        ),
      ),
    );
  }

  Widget buildStep(int index, BuildContext context, bool showLine, double stepSize, double lineHeight, double textSize) {
  bool isCompleted = index < currentStep;
  bool isGradientLine = index == currentStep - 1;

  return SizedBox(
    height: 55, // Adjusted height to prevent overflow
    child: Stack(
      clipBehavior: Clip.none, // Ensures elements are not clipped
      children: [
        Column(
          children: [
            Row(
              children: [
                // Step Circle
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(2, 3),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: stepSize / 2,
                    backgroundColor: isCompleted ? const Color(0xFFFF7700) : const Color(0xFFD9D9D9),
                    child: isCompleted
                        ? Icon(Icons.check, color: Colors.black, size: stepSize * 0.6)
                        : null,
                  ),
                ),

                // Connecting Line
                if (showLine)
                  Expanded(
                   child: Container(
  height: lineHeight,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: isGradientLine
          ? [Color(0xFFFF7700), Color(0xFFD9D9D9)] // Transition from orange to gray
          : isCompleted
              ? [Color(0xFFFF7700), Color(0xFFFF7700)] // Solid orange for completed steps
              : [Color(0xFFD9D9D9), Color(0xFFD9D9D9)], // Solid gray for incomplete steps
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    ),
  ),
),

                  ),
              ],
            ),

            SizedBox(height: stepSize * 0.2), // Space for text
          ],
        ),

        // Status Text positioned below the step
         Positioned(
          left: -10,
            right:stepSize * 0.5, // Adjust positioning
            top: stepSize +5, // Position below the step
            child: Text(
              current[index],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: textSize,
                color: Colors.grey,
                shadows: [
                  Shadow(
                    blurRadius: 3.0,
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
            ),
          ),
        
      ],
    ),
  );
}
}