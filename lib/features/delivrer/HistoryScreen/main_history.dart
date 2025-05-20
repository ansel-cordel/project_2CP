import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Ongoing_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/OrderHistory_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Orders.dart';
import 'package:project_2cp/features/delivrer/data/ordermodel.dart';
import 'package:project_2cp/features/delivrer/ProfileScreen/addprovider.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<order> ordershis = ref.watch(orderListDelProvider);

    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            OrderhistoryText(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            Ongoing_Text(),
            Expanded(child: ListView.builder(

              itemCount: ordershis.length,
              itemBuilder: (context, index) {
                final currentOrder = ordershis[index];
              return history_orders( ResPic: currentOrder.restoimg,
                      CliPic: currentOrder.clientimg,
                      ResName: currentOrder.resto,
                      CliName: currentOrder.client,
                      ResLoc: currentOrder.restoloc,
                      CliLoc: currentOrder.clientloc,
                      ResNum: currentOrder.restonumber,
                      CliNum: currentOrder.clientnumber,
                      isExpanded: true,);
            })),
          
          ]),
        ),
      
    );
  }
}
