import 'package:flutter/material.dart';
import '../presentation/orderhistorywidget.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({super.key});

  @override
  State<OrderHistoryPage> createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage> {
  final List<Map<String, dynamic>> orderData = [
    {"date": "2025-03-26", "time": "14:30", "state": 2},
    {"date": "2025-03-26", "time": "14:30", "state": 1},
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          
          child: Column(
            
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: search(),
              ),
              SizedBox(height: 8,),
              Align(alignment:Alignment.centerLeft, child:  Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Order History:",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
              )),

              ListView.builder(
                shrinkWrap: true, // Prevents infinite height expansion
                physics:
                    NeverScrollableScrollPhysics(), // Disables ListView's scrolling
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.02,
                ),
                itemCount: orderData.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      OrderCard.addOrder(
                        context: context,
                        date: orderData[index]["date"],
                        time: orderData[index]["time"],
                        state: orderData[index]["state"],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
