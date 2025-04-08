import 'package:flutter/material.dart';
import 'package:project_2cp/features/orderhisyory/presentation/orderhistory.dart';
import 'package:project_2cp/features/orderlist/presentation/orderlistpage.dart';

import 'package:get/get.dart';

class TodaysMenu_text extends StatelessWidget {
  const TodaysMenu_text({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text(
        "Today's Menu:",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w900,
          fontSize: 22,
        ),
      ),
    ]);
  }
}

class TodaysMenu_widget extends StatefulWidget {
  const TodaysMenu_widget({super.key});

  @override
  _TodaysMenu_widgetState createState() => _TodaysMenu_widgetState();
}

class _TodaysMenu_widgetState extends State<TodaysMenu_widget> {
  int num1 = 2;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Stack(
        children: [
          Card(
            elevation: 5,
            shadowColor: Colors.black,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                      child: Image.asset(
                        "assets/rich.jpg",
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
                              horizontal: 6, vertical: 1.7),
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
                              Icon(Icons.star, color: Colors.white, size: 16),
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
                              "PB & Pickle Sandwich",
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
                                    Get.to(OrderHistoryPage());
                                  },
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: Colors.black),
                                ),
                                Text(
                                  "$num1",
                                  style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    num1 = num1 + 1;
                                  },
                                  icon: Icon(Icons.arrow_forward_ios,
                                      color: Colors.black),
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
                            "Fancy Food Studious TM",
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
                            "20 DA",
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
                  borderRadius: BorderRadius.circular(40)),
              onPressed: () {
                Get.to(() => OrderListPage());
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
