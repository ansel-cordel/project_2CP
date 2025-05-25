import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/addprovider.dart';

class Orders extends ConsumerStatefulWidget {
  final String resPic;
  final String cliPic;
  final String resName;
  final String cliName;
  final String resLoc;
  final String cliLoc;
  final int resNum;
  final int cliNum;

  const Orders({
    super.key,
    required this.resPic,
    required this.cliPic,
    required this.resName,
    required this.cliName,
    required this.resLoc,
    required this.cliLoc,
    required this.resNum,
    required this.cliNum,
  });

  @override
  ConsumerState<Orders> createState() => _OrdersState();
}

class _OrdersState extends ConsumerState<Orders> with TickerProviderStateMixin {
  bool isExpanded = false;

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Widget buildItemRow(String item, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87)),
          Text(price,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Header: Images, names, locations, numbers
          Padding(
            padding: EdgeInsets.all(2),
            child: Column(
              children: [
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: width*0.01),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: width*0.116,
                      child: CircleAvatar(
                        radius: width*0.1,
                        backgroundImage: AssetImage(widget.resPic),
                      ),
                    ),
                    Text("- - - - - - -",
                        style:
                            TextStyle(fontSize: 32, color: Colors.grey[600])),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: width*0.116,
                      child: CircleAvatar(
                        radius: width*0.1,
                        backgroundImage: AssetImage(widget.cliPic),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width*0.4,
                        child: Text(widget.resName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                      ),
                      SizedBox(
                        width: width*0.4,
                        child: Text(widget.cliName,
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
                          Icon(Icons.location_on_outlined, size: width*0.05),
                          Expanded(
                            child: Text(widget.resLoc,
                                style:TextStyle(
                                    fontSize: width*0.038, color: Colors.black)),
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
                            child: Text(widget.cliLoc,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: width*.038, color: Colors.black)),
                          ),
                          Icon(Icons.location_on_outlined, size: width*0.05),
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
                        Icon(Icons.local_phone_outlined, size: width*0.05),
                        SizedBox(width: width*0.006),
                        Text(widget.resNum.toString(),
                            style: const TextStyle(color: Colors.black)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.cliNum.toString(),
                            style: const TextStyle(color: Colors.black)),
                        SizedBox(width: width*0.006),
                        Icon(Icons.local_phone_outlined, size: width*0.05),
                      ],
                    ),
                  ],
                ),
                /*Divider(thickness: width*0.005),
                Text("Total: 1200 DA",
                    style:TextStyle(fontSize: width*0.053, fontWeight: FontWeight.bold)
                ),*/
              ],
            ),
          ),

          // Expandable Section
          /*AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 10),
                    child: Column(
                      children: [
                        buildItemRow("- Pizza", "100 DA x 5"),
                        buildItemRow("- Frites", "50 DA x 7"),
                        buildItemRow("- Soup", "150 DA x 3"),
                        buildItemRow("- Bourak", "20 DA x 12"),
                        buildItemRow("- Salade", "0 DA x 100"),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),*/

          Divider(thickness: width*0.005),

          // Buttons
          /*Padding(
            padding: EdgeInsets.symmetric(horizontal: width*0.02),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[800],
                          padding: EdgeInsets.symmetric(vertical: width*0.03,horizontal: width*0.03),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width*0.04),
                          ),
                        ),
                        onPressed: () {
                          ref.read(orderListDelProvider.notifier).addorder(order(
                                clientimg: widget.cliPic,
                                restoimg: widget.resPic,
                                resto: widget.resName,
                                client: widget.cliName,
                                clientloc: widget.cliLoc,
                                clientnumber: widget.cliNum,
                                restoloc: widget.resLoc,
                                restonumber: widget.resNum,
                                total: 1200,
                              ));
                        },
                        child: SizedBox(
                          width: width*0.39,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Take the Order",
                            style: TextStyle(
                              fontSize: width*0.039,
                              fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[400],
                          padding: EdgeInsets.symmetric(vertical: width*0.03,horizontal: width*0.03),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(width*0.04),
                          ),
                        ),
                        onPressed: () {
                          ref.read(orderListDelProvider.notifier).addorder(order(
                                clientimg: widget.cliPic,
                                restoimg: widget.resPic,
                                resto: widget.resName,
                                client: widget.cliName,
                                clientloc: widget.cliLoc,
                                clientnumber: widget.cliNum,
                                restoloc: widget.resLoc,
                                restonumber: widget.resNum,
                                total: 1200,
                              ));
                        },
                        child: SizedBox(
                          width: width*0.2,
                          child: Text(
                            textAlign: TextAlign.center,
                            "Refuse",
                            style: TextStyle(
                              fontSize: width*0.03,
                              fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: toggleCard,
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: width*0.07,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),*/
        ],
      ),
    );
  }
}
