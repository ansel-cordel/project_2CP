import 'package:flutter/material.dart';

class items extends StatefulWidget {
  final double rate;
  final String itemName;
  final String restName;
  final int price;
  final String pic;

  const items({
    super.key,
    required this.rate,
    required this.itemName,
    required this.restName,
    required this.price,
    required this.pic,
  });

  @override
  _itemsState createState() => _itemsState();
}

class _itemsState extends State<items> {
  int num1 = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(screenWidth * 0.02),
      child: Card(
        elevation: screenWidth * 0.01,
        shadowColor: Colors.black,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image + Rating
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(screenWidth * 0.04),
                  ),
                  child: Image.asset(
                    "img/${widget.pic}.jpg",
                    height: screenHeight * 0.18,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: screenWidth * 0.02,
                  left: screenWidth * 0.02,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: screenWidth * 0.005,
                      horizontal: screenWidth * 0.01,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange[800],
                      borderRadius: BorderRadius.circular(screenWidth * 0.01),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${widget.rate}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(Icons.star, color: Colors.white, size: 14),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Item content
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.itemName,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.restName,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.arrow_back_ios, size: 16),
                            onPressed: () {
                              setState(() {
                                if (num1 > 0) num1--;
                              });
                            },
                          ),
                          Text(
                            "$num1",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_forward_ios, size: 16),
                            onPressed: () {
                              setState(() {
                                num1++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: screenWidth * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.price} \$",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      FloatingActionButton(
                        mini: true,
                        onPressed: () {},
                        backgroundColor: Colors.orange[800],
                        child: Icon(Icons.add, color: Colors.white, size: 28),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
