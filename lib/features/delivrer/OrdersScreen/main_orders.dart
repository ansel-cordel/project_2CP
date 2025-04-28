
import 'package:flutter/material.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/OnGoing_text.dart';
import 'package:project_2cp/features/delivrer/OrdersScreen/Order_widget.dart';

class DelivererOrderScreen extends StatelessWidget{
  const DelivererOrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              ongoingText(),
              Orders(CliLoc:"alg" ,CliName:"riad" ,CliNum:"0553740984" ,CliPic:"img/c1.jpg" ,ResLoc:"alger" ,ResName:"restaurant1" ,ResNum:"023" ,ResPic:"img/res1.jpg" ,),
              Orders(CliLoc:"ain temouchent" , CliName:"issam" ,CliNum:"0782614671" ,CliPic:"img/c2.jpg" ,ResLoc:"s7ra" ,ResName:"restaurant2" ,ResNum:"023" ,ResPic:"img/res2.jpg" ,),
              Orders(CliLoc:"sba" ,CliName:"ahmed" ,CliNum:"077777777" ,CliPic:"img/c3.jpg" ,ResLoc:"lybia" ,ResName:"restaurant3" ,ResNum:"026" ,ResPic:"img/res3.jpg" ,),
              Orders(CliLoc:"esi" ,CliName:"abdnour" ,CliNum:"0897653891" ,CliPic:"img/c4.jpg" ,ResLoc:"saturn" ,ResName:"restaurant4" ,ResNum:"037" ,ResPic:"img/res4.jpg" ,),
             ]),
          ),
      ),
    );
  }
}