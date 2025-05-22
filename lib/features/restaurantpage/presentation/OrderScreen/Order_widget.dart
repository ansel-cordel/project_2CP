import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  final String resPic;
  final String cliName;
  final String cliNum;

  const Order({
    super.key,
    required this.resPic,
    required this.cliName,
    required this.cliNum,
  });

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  bool isExpanded = false;
  int orderStatus = 0; // 0 = initial, 1 = taken, 2 = delivered

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void takeOrder() {
    setState(() {
      orderStatus = 1;
    });
  }

  void confirmPickup() {
    setState(() {
      orderStatus = 2;
    });
  }

  Widget _buildItemRow(String item, String price, double width) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: width * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
          Text(price,
              style: TextStyle(
                  fontSize: width * 0.04,
                  fontWeight: FontWeight.w500,
                  color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final orangeColor = Colors.orange[800];
    final greyColor = Colors.grey[300];

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Customer Info Section
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(55, 110, 110, 110),
                  radius: width * 0.1,
                  child: CircleAvatar(
                    radius: width * 0.09,
                    backgroundImage: AssetImage("assets/${widget.resPic}"),
                  ),
                ),
                SizedBox(width: width * 0.03),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, size: width * 0.06),
                        SizedBox(width: width * 0.02),
                        Text(widget.cliName,
                            style: TextStyle(
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.w800)),
                      ],
                    ),
                    SizedBox(height: width * 0.01),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, size: width * 0.05),
                        SizedBox(width: width * 0.02),
                        Text(widget.cliNum,
                            style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),

          // Divider
          Container(height: 2, color: Colors.grey[400]),

          // Expandable Order Details
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            child: isExpanded
                ? Container(
                    padding: EdgeInsets.all(width * 0.04),
                    color: greyColor,
                    child: Column(
                      children: [
                        Text("Order List:",
                            style: TextStyle(
                            fontSize: width * 0.05,
                                fontWeight: FontWeight.w600)),
                        _buildItemRow("Pizza", "100 Da x 5", width),
                        _buildItemRow("Fries", "50 Da x 7", width),
                        _buildItemRow("Soup", "150 Da x 3", width),
                        _buildItemRow("Bourak", "20 Da x 12", width),
                        _buildItemRow("Salad", "0 Da x 100", width),
                        SizedBox(height: width * 0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total:",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600)),
                            Text("1000 da",
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                      ],
                    ),
                  )
                : const SizedBox(),
          ),

          // Divider
          Container(height: 2, color: Colors.grey[400]),

          // Buttons Section with fixed white background
          SizedBox(
            width: double.infinity,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(width * 0.02),
              child: Column(
                children: [
                  if (orderStatus == 0)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: takeOrder,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: orangeColor,
                              padding: EdgeInsets.symmetric(
                                  vertical: width * 0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text("Take Order",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: width * 0.03),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey[600],
                              padding: EdgeInsets.symmetric(
                                  vertical: width * 0.03),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text("Cancel",
                                style: TextStyle(
                                    fontSize: width * 0.04,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  else if (orderStatus == 1)
                    ElevatedButton(
                      onPressed: confirmPickup,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: orangeColor,
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.03,
                          horizontal: width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Confirm Order Pickup",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    )
                  else
                    ElevatedButton(
                      onPressed: null,
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor: Colors.green,
                        padding: EdgeInsets.symmetric(
                          vertical: width * 0.03,
                          horizontal: width * 0.1,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Delivered",
                          style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  SizedBox(height: width * 0.02),
                  IconButton(
                    onPressed: toggleCard,
                    icon: Icon(
                      isExpanded ? Icons.expand_less : Icons.expand_more,
                      size: width * 0.08,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
