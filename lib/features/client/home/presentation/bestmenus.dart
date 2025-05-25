

import 'package:flutter/material.dart';
import 'package:project_2cp/features/client/home/providers/amountprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/client/orderlist/data/Item_mdeol.dart';
import 'package:project_2cp/features/client/orderlist/providers/addorderidprovider.dart';
import 'package:project_2cp/features/client/orderlist/providers/listprovider.dart';

class Bestmenus extends ConsumerWidget {
  final String image;
  final String name;
  final String restaurant;
  final double price;

  const Bestmenus({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amount = ref.watch(amountHandler);
    final currentId = ref.read(idcountprovider).toString();

    return IntrinsicHeight(
      child: Stack(
        children: [
          Card(
            elevation: 3,
            shadowColor: Colors.black,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Smaller corner radius
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(12), // Smaller corner radius
                      ),
                      child: Image.asset(
                        image,
                        height: 20, // Reduced height
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10, // Adjusted position
                      left: 10, // Adjusted position
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5, // Reduced padding
                            vertical: 1.5, // Reduced padding
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[800],
                            borderRadius: BorderRadius.circular(5), // Smaller radius
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "4.8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12, // Reduced font size
                                ),
                              ),
                              SizedBox(width: 3), // Reduced space
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 2, // Reduced icon size
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8), // Reduced padding
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              name,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16, // Reduced font size
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(amountHandler.notifier)
                                        .decrement();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: 18, // Reduced icon size
                                  ),
                                ),
                                Text(
                                  amount.toString(),
                                  style: TextStyle(
                                    fontSize: 12, // Reduced font size
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    ref
                                        .read(amountHandler.notifier)
                                        .increment();
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.black,
                                    size: 12, // Reduced icon size
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            restaurant,
                            style: TextStyle(
                              color: Colors.grey[850],
                              fontSize: 6, // Reduced font size
                            ),
                          ),
                          Text(
                            " * ",
                            style: TextStyle(
                              color: Colors.grey[850],
                              fontSize: 6, // Reduced font size
                            ),
                          ),
                          Text(
                            "Fast Food",
                            style: TextStyle(
                              color: Colors.grey[850],
                              fontSize: 12, // Reduced font size
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12, // Reduced font size
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 15, // Adjusted position
            right: 10, // Adjusted position
            child: FloatingActionButton(
              mini: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // Smaller radius
              ),
              onPressed: () {
                //ref.read(orderListProvider.notifier).addorder(Item(isAvailable: true,id: currentId, image: image, name: name, price: price, resto: restaurant,description: ""));
              },
              backgroundColor: Colors.orange[800],
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 28, // Reduced icon size
              ),
            ),
          ),
        ],
      ),
    );
  }
}
