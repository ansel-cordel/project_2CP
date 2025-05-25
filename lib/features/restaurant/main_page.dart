import 'package:flutter/material.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';

import 'package:project_2cp/features/restaurant/bestmenus.dart';
import 'package:project_2cp/features/restaurant/profile_head.dart';
import 'package:project_2cp/features/restaurant/restau_info.dart';

class restaurant_page extends StatelessWidget {
  final String restaurantid;
  final String location;
  final String number;
  final String? image;
  final String name;
  final List<Item> items;
  const restaurant_page(
     {super.key,
      required this.restaurantid,
      required this.items,
      required this.location,
      required this.number,
      required this.image,
      required this.name});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * 0.06),
          ProfileHead(name: name, image: image),
          RestauInfo(location: location, number: number),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BestMenus_Text(),
                SizedBox(height: MediaQuery.of(context).size.width * 0.02),
              ],
            ),
          ),
          // ⬇️ Make this take remaining space and scroll if items are many
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
              ),
              child: GridView.builder(
                itemCount: items.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  mainAxisSpacing: MediaQuery.of(context).size.width * 0.02,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return item_widget(
                    restaurandid:restaurantid,
                    description: item.description,
                    id: item.id,
                    rate: 5,
                    itemName: item.name,
                    restName: name,
                    price: item.price,
                    pic: item.image ?? "",
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}