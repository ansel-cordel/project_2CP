
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
          padding: EdgeInsets.only(left: 20,right: 20,top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              ongoingText(),
              Orders(CliLoc:"alg" ,CliName:"riad" ,CliNum:"0553740984" ,CliPic:"assets/person1.jpg" ,ResLoc:"alger" ,ResName:"restaurant1" ,ResNum:"023" ,ResPic:"assets/res1.png" ,),
              Orders(CliLoc:"ain temouchent" , CliName:"issam" ,CliNum:"0782614671" ,CliPic:"- assets/person6.jpg" ,ResLoc:"s7ra" ,ResName:"restaurant2" ,ResNum:"023" ,ResPic:"assets/res2.png" ,),
              Orders(CliLoc:"sba" ,CliName:"ahmed" ,CliNum:"077777777" ,CliPic:"- assets/person3.jpg" ,ResLoc:"lybia" ,ResName:"restaurant3" ,ResNum:"026" ,ResPic:"assets/res3.png" ,),
              Orders(CliLoc:"esi" ,CliName:"abdnour" ,CliNum:"0897653891" ,CliPic:"- assets/person4.jpg" ,ResLoc:"saturn" ,ResName:"restaurant4" ,ResNum:"037" ,ResPic:"assets/res4.png" ,),
             ]),
          ),
      ),
    );
  }
}