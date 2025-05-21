import 'package:flutter/material.dart';
import 'package:project_2cp/features/restaurantpage/presentation/OrderScreen/Order_widget.dart';


class OrdersScreen extends StatelessWidget{
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: a*0.1  ,
            right: a*0.03,
            left: a*0.03,
          ),
          child: Column(
            children: [
              Text("On Going Orders",
              style: TextStyle(
                fontSize: a*0.06,
                fontWeight: FontWeight.w700
              ),
              ),
              Order(cliName: "riad",cliNum: "0053740984",resPic: "res2",),
              Order(cliName: "riad",cliNum: "0053740984",resPic: "res2",),
              Order(cliName: "riad",cliNum: "0053740984",resPic: "res2",),
            ]
          ),
        ),
      ),
    );
  }
  
}