import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/home/presentation/our_restaurents_widget.dart';
import 'package:project_2cp/features/client/home/providers/fetchingprovider.dart';

class OurRestaurants extends ConsumerStatefulWidget {
  const OurRestaurants({super.key});

  @override
  ConsumerState<OurRestaurants> createState() => _OurRestaurantsState();
}

class _OurRestaurantsState extends ConsumerState<OurRestaurants> {
  @override
  Widget build(BuildContext context) {
    final restaurants = ref.watch(restaurantsProvider);
    
    double width = MediaQuery.of(context).size.width;
    return restaurants.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stack) => Center(
              child: Text('Error loading restaurants: $error'),
            ),
        data: (restaurants2) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our Restaurants:",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: restaurants2.length,
                  itemBuilder: (context, index) {
                    return OurRestaurantsWidget(
                      name: restaurants2[index].name,
                      image: "assets/restaurant.jpg",
                      location: restaurants2[index].address,  // Changed: Use actual address
                      specialities: "Restaurant", // Changed: Simple fallback since API doesn't provide this
                      rate: 0,
                      items: restaurants2[index].items,
                    );
                  },
                ),
              ),
            ],
          );
        }
        );
  }
}