import 'package:flutter/material.dart';
import 'package:project_2cp/features/client/home/presentation/our_restaurents_widget.dart';

class OurRestaurants extends StatefulWidget {
  const OurRestaurants({super.key});

  @override
  State<OurRestaurants> createState() => _OurRestaurantsState();
}

class _OurRestaurantsState extends State<OurRestaurants> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Our Restaurants:",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 22,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange[800],
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.orange[800],
                    size: 18,
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        OurRestaurentsWidget(
          name: "McHabibi",
          image: "assets/restaurant.jpg",
          location: "Dar Mok & Babak, Alger",
          specialities: "Fast Food - Sandwich - Pizzeria",
          rate: 8,
        ),
      ],
    );
  }
}
