import 'package:flutter/material.dart';

class OrderTracking extends StatelessWidget {
  final int currentStep;
  OrderTracking({super.key,this.currentStep = 0});

  
  final List<String> current = ["Order Placed", "Picked Up", "Delivered", "Received"];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Expanded(child: buildStep(index, context, index < 3, current)),
      ),
    );
  }

  Widget buildStep(int index, BuildContext context, bool showLine, List<String> current) {
    bool isCompleted = index < currentStep;
    bool isGradientLine = index == currentStep - 1;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            // Step Circle with Shadow
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Soft shadow
                    blurRadius: 6,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 20,
                backgroundColor: isCompleted ? Color(0xFFFF7700) : Color(0xFFD9D9D9),
                child: isCompleted
                    ? Icon(Icons.check, color: Colors.black, size: 22) // Bolder checkmark
                    : null,
              ),
            ),

            // Connecting Line with Rounded Edges
            if (showLine)
              Expanded(
                child: Container(
                  height: 7,
                   // Better spacing
                  decoration: BoxDecoration(
                    
                    gradient: isGradientLine
                        ? LinearGradient(
                            colors: [Color(0xFFFF7700), Color(0xFFD9D9D9)],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          )
                        : null,
                    color: isGradientLine ? null : Color(0xFFFF7700),
                  ),
                ),
              ),
          ],
        ),
        
        // Status Text Below Circle
        SizedBox(height: 6), // Spacing
        Text(
          current[index],
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.grey,shadows: [Shadow( blurRadius: 3.0, // Softness of the shadow
        color: Colors.black.withOpacity(0.2), // Shadow color
        offset: Offset(2, 2), )])
        ),
      ],
    );
  }
}
