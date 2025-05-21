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
          ),
          child: Column(
            children: [
              order(ResPic: "c1", CliPic: "c2", ResName: "a", CliName: "a", ResLoc: "b", CliLoc: "b", ResNum: "09", CliNum: "05"),
              order(ResPic: "c3", CliPic: "c4", ResName: "a", CliName: "a", ResLoc: "b", CliLoc: "b", ResNum: "09", CliNum: "05"),
              order(ResPic: "c5", CliPic: "c3", ResName: "a", CliName: "a", ResLoc: "b", CliLoc: "b", ResNum: "09", CliNum: "05"),
            ],
          ),
        ),
      ),
    );
  }
  
}