import 'package:flutter/material.dart';
import 'package:project_2cp/features/orders/presentation/track.dart';

class OrderCard {
  static Widget addOrder(
      {required String date,
      required String time,
      required int state,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              // Order Info Row
              Row(
                children: [
                  Image.asset(
                    "assets/icon.png",
                    width: MediaQuery.of(context).size.width * 0.08,
                    height: MediaQuery.of(context).size.width * 0.08,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order: $date",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Time: $time",
                        style: TextStyle(
                          color: const Color(0xFF484848),
                          fontSize: MediaQuery.of(context).size.width * 0.035,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),

              Text(
                "Status:",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              // Order Tracking Bar
              OrderTracking(currentStep: state),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),

              // Price & Details Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price: 1500DA",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Details >",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
