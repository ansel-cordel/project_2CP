
import 'package:flutter/material.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/OnGoing_text.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/Order_widget.dart';

class OrdersScreen extends StatelessWidget{
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              ongoingText(),
              Orders(CliLoc:"alg" ,CliName:"riad" ,CliNum:"0553740984" ,CliPic:"img/c1.jpg" ,ResLoc:"alger" ,ResName:"restaurant1" ,ResNum:"023" ,ResPic:"img/res1.jpg" ,),
              Orders(CliLoc:"medea" , CliName:"issam" ,CliNum:"0666666666" ,CliPic:"img/c2.jpg" ,ResLoc:"s7ra" ,ResName:"restaurant2" ,ResNum:"023" ,ResPic:"img/res2.jpg" ,),
              Orders(CliLoc:"sba" ,CliName:"ahmed" ,CliNum:"077777777" ,CliPic:"img/c3.jpg" ,ResLoc:"lybia" ,ResName:"restaurant3" ,ResNum:"026" ,ResPic:"img/res3.jpg" ,),
              Orders(CliLoc:"esi" ,CliName:"reda" ,CliNum:"0897653891" ,CliPic:"img/c4.jpg" ,ResLoc:"saturn" ,ResName:"restaurant4" ,ResNum:"037" ,ResPic:"img/res4.jpg" ,),
             ]),
          ),
      ),
    );
  }
}