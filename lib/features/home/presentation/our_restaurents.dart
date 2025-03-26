import 'package:flutter/material.dart';
import 'package:project_2cp/features/profile/presentation/main_profile.dart';
import 'package:get/get.dart';

class ourrestaurants extends StatefulWidget {
  const ourrestaurants({super.key});

  @override
  _ourrestaurantsState createState() => _ourrestaurantsState();
}

class _ourrestaurantsState extends State<ourrestaurants> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Our Restaurants:",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22,
            )),
        MaterialButton(
            child: Row(children: [
              Text(
                "See All",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.orange[800],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.orange[800],
                size: 22,
              )
            ]),
            onPressed: () {
              Get.to(() => ProfileScreen());
            })
      ],
    );
  }
}
