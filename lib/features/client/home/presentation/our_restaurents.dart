import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/home/data/restaurant_model.dart';
import 'package:project_2cp/features/client/home/presentation/our_restaurents_widget.dart';
import 'package:project_2cp/features/client/home/providers/fetchingprovider.dart';
import 'package:project_2cp/features/client/orderlist/data/ordermodel.dart';

class OurRestaurants extends ConsumerStatefulWidget {
  const OurRestaurants({super.key});

  @override
  ConsumerState<OurRestaurants> createState() => _OurRestaurantsState();
}

class _OurRestaurantsState extends ConsumerState<OurRestaurants> {
  @override
  Widget build(BuildContext context) {
    final restaurants = ref.watch(restaurantsProvider);
    /*List<Restaurant> restaurants = [
      Restaurant(
        Specialities: "Fast Food - Sandwich - Pizzeria",
        number: "O789221245",
        id: "4",
        WorkingHours: "5-00",
        name: "McHabibi",
        items: [
          Item(
            description: "",
            id: "2",
            image: ",",
            name: "pizza",
            price: 2,
            resto: "",
            resto_id: "",
          ),
        ],
      ),
      Restaurant(
        Specialities: "Fast Food - Sandwich - Pizzeria",
        number: "O789221245",
        id: "4",
        WorkingHours: "5-00",
        name: "McHabibi",
        items: [
          Item(
            description: "",
            id: "2",
            image: ",",
            name: "pizza",
            price: 2,
            resto: "",
            resto_id: "",
          ),
        ],
      ),
    */
    double width = MediaQuery.of(context).size.width;
    return restaurants.when(
        loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        error: (error, stack) => Center(
              child: Text('Error loading popular item: $error'),
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
                      location: "Unknown location",
                      specialities: restaurants2[index].Specialities,
                      rate: 0,
                      items: restaurants2[index].items,
                    );
                  },
                ),
              ),
            ],
          );
        });
  }
}
