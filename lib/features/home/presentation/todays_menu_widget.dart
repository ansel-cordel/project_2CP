import 'package:flutter/material.dart';
import 'package:project_2cp/features/home/providers/amountprovider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/orderlist/data/ordermodel.dart';
import 'package:project_2cp/features/orderlist/providers/addorderidprovider.dart';
import 'package:project_2cp/features/orderlist/providers/listprovider.dart';

class TodaysMenuWidget extends ConsumerWidget {
  final String image;
  final String name;
  final String restaurant;
  final int price;

  TodaysMenuWidget({
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
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: Image.asset(
                        image,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 15,
                      left: 15,
                      child: Card(
                        elevation: 2,
                        shadowColor: Colors.black,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 1.7,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.orange[800],
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "4.8",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
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
                                fontSize: 20,
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
                                  ),
                                ),
                                Text(
                                  amount.toString(),
                                  style: TextStyle(
                                    fontSize: 23,
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
                            ),
                          ),
                          Text(
                            " * ",
                            style: TextStyle(
                              color: Colors.grey[850],
                            ),
                          ),
                          Text(
                            "Fast Food",
                            style: TextStyle(
                              color: Colors.grey[850],
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
                              fontSize: 27,
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
            bottom: 21,
            right: 18,
            child: FloatingActionButton(
              mini: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              onPressed: () {
                ref.read(orderListProvider.notifier).addorder(Order(id: currentId, image: image, name: name, price: price, resto: restaurant));
              },
              backgroundColor: Colors.orange[800],
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 34,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
