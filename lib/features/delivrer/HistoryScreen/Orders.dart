import 'package:flutter/material.dart';

class history_orders extends StatefulWidget {
  final String ResPic;
  final String CliPic;
  final String ResName;
  final String CliName;
  final String ResLoc;
  final String CliLoc;
  final String ResNum;
  final String CliNum;
  final bool isExpanded;
  final double total;

  const history_orders({
    super.key,
    required this.total,
    required this.ResPic,
    required this.CliPic,
    required this.ResName,
    required this.CliName,
    required this.ResLoc,
    required this.CliLoc,
    required this.ResNum,
    required this.CliNum,
    required this.isExpanded,
  });

  @override
  _history_ordersState createState() => _history_ordersState();
}

class _history_ordersState extends State<history_orders> {
  bool isExpanded = false;
  bool isDelivered = false;

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  void confirmOrderArrival() {
    setState(() {
      isDelivered = true;
    });
  }

  Widget buildItemRow(String item, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
        Text(price,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(3),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("From:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text("To:",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: width * 0.116,
                      child: CircleAvatar(
                        radius: width * 0.1,
                        backgroundImage: AssetImage(widget.ResPic),
                      ),
                    ),
                    Text("- - - - - - -",
                        style:
                            TextStyle(fontSize: 32, color: Colors.grey[600])),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: width * 0.116,
                      child: CircleAvatar(
                        radius: width * 0.1,
                        backgroundImage: AssetImage(widget.CliPic),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width*0.4,
                        child: Text(widget.ResName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        width: width*0.4,
                        child: Text(widget.CliName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.42,
                      child: Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: width * 0.05),
                          Expanded(
                            child: Text(widget.ResLoc,
                                style: TextStyle(
                                    fontSize: width * 0.038,
                                    color: Colors.black)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.42,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(widget.CliLoc,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: width * .038,
                                    color: Colors.black)),
                          ),
                          Icon(Icons.location_on_outlined, size: width * 0.05),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.local_phone_outlined, size: width * 0.05),
                        SizedBox(width: width * 0.006),
                        Text(widget.ResNum.toString(),
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.CliNum,
                            style: const TextStyle(color: Colors.black)),
                        SizedBox(width: width * 0.006),
                        Icon(Icons.local_phone_outlined, size: width * 0.05),
                      ],
                    ),
                  ],
                ),
                Divider(thickness: width * 0.005),
                Text("Total: ${widget.total}",
                    style: TextStyle(
                        fontSize: width * 0.053,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          Container(
            height: 3,
            color: Colors.grey[500],
          ),

          /// Expanded Section
          AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.grey[300],
                    child: Column(
                      children: [
                        buildItemRow("- Chakchouki", "100 Da x 5"),
                        buildItemRow("- Fritoz", "50 Da x 7"),
                        buildItemRow("- Rawz bl augh", "150 Da x 3"),
                        buildItemRow("- Boukhz", "20 Da x 12"),
                        buildItemRow("- Feet", "0 Da x 100"),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),

          Container(
            height: 3,
            color: Colors.grey[500],
          ),

          /// Buttons Section
          Container(
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(16)),
            ),
            child: Column(
              children: [
                Center(
                  child: MaterialButton(
                    onPressed: () {
                      if (!isDelivered) confirmOrderArrival();
                    },
                    color: isDelivered ? Colors.green : Colors.orange[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                    height: width * 0.09,
                    child: Text(
                      isDelivered
                          ? "Delivered"
                          : "Confirm order arrival",
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: toggleCard,
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                    size: width * 0.07,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
