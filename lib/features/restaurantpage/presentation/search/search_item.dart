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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with rating
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  "img/${widget.pic}.jpg",
                  height: screenWidth * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "${widget.rate}",
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      const Icon(Icons.star, size: 14, color: Colors.white),
                    ],
                  ),
                ),
              )
            ],
          ),
          // Texts and button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.itemName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.restName,
                        style: TextStyle(color: Colors.grey[700], fontSize: 14)),
                    Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.arrow_back_ios, size: 14),
                          onPressed: () {
                            setState(() {
                              if (num1 > 0) num1--;
                            });
                          },
                        ),
                        Text('$num1'),
                        IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.arrow_forward_ios, size: 14),
                          onPressed: () {
                            setState(() {
                              num1++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${widget.price}",
                        style: const TextStyle(fontSize: 16)),
                    FloatingActionButton.small(
                      backgroundColor: Colors.orange[800],
                      onPressed: () {},
                      child: const Icon(Icons.add, size: 20, color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
