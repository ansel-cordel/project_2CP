import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/OnGoing_text.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/Order_widget.dart';
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/addprovider.dart';

class DelivererOrderScreen extends ConsumerWidget {
  const DelivererOrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Sample list of orders
    List<order> orders = [
      order(
        total: 1200,
        clientloc: "alg",
        client: "riad",
        clientnumber: 0553740984,
        clientimg: "assets/person1.jpg",
        restoloc: "alger",
        resto: "restaurant1",
        restonumber: 23,
        restoimg: "assets/res1.png",
      ),
      order(
        total: 1200,
        clientloc: "alg",
        client: "riad",
        clientnumber: 0553740984,
        clientimg: "assets/person1.jpg",
        restoloc: "alger",
        resto: "restaurant1",
        restonumber: 23,
        restoimg: "assets/res1.png",
      ),
      // You can add more orders if needed
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          ongoingText(),
          Expanded(
            child: ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final currentOrder = orders[index];
                return GestureDetector(
                  onTap: () {
                    ref.read(orderListDelProvider.notifier).addorder(currentOrder);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                    child: Orders(
                      resPic: currentOrder.restoimg,
                      cliPic: currentOrder.clientimg,
                      resName: currentOrder.resto,
                      cliName: currentOrder.client,
                      resLoc: currentOrder.restoloc,
                      cliLoc: currentOrder.clientloc,
                      resNum: currentOrder.restonumber,
                      cliNum: currentOrder.clientnumber,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
