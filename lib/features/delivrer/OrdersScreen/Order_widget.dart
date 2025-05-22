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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          // Header: Images, names, locations, numbers
          Padding(
            padding: const EdgeInsets.all(3),
            child: Column(
              children: [
                const Row(
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
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 42,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(widget.resPic),
                      ),
                    ),
                    Text("- - - - - - -",
                        style:
                            TextStyle(fontSize: 32, color: Colors.grey[600])),
                    CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      radius: 42,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(widget.cliPic),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.resName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.cliName,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.42,
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 18),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(widget.resLoc,
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey)),
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
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.grey)),
                          ),
                          const SizedBox(width: 4),
                          const Icon(Icons.location_on_outlined, size: 18),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.local_phone_outlined, size: 18),
                        const SizedBox(width: 4),
                        Text(widget.resNum.toString(),
                            style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(widget.cliNum.toString(),
                            style: const TextStyle(color: Colors.grey)),
                        const SizedBox(width: 4),
                        const Icon(Icons.local_phone_outlined, size: 18),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                const Divider(thickness: 2),
                const SizedBox(height: 4),
                const Text("Total: 1200 DA",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          // Expandable Section
          AnimatedSize(
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
          ),

          const Divider(thickness: 2),

          // Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[800],
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
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
                    child: const Text(
                      "Take the Order",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                IconButton(
                  onPressed: toggleCard,
                  icon: Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.orange[800],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
