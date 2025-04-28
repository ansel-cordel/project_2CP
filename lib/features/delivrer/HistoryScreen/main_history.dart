
import 'package:flutter/material.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Ongoing_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/OrderHistory_text.dart';
import 'package:project_2cp/features/delivrer/HistoryScreen/Orders.dart';

class HistoryScreen extends StatelessWidget{
  const HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20,top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              OrderhistoryText(),
              SizedBox(height: MediaQuery.of(context).size.width*0.04,),
              Ongoing_Text(),
              history_orders(ResPic: "img/res1.jpg", CliPic: "img/c1.jpg", ResName: "lantica", CliName: "riad", ResLoc: "lwiaam", CliLoc: "cite 6", ResNum: "0576439812", CliNum: "0553740984",isExpanded: true,),
              history_orders(ResPic: "img/res2.jpg", CliPic: "img/c2.jpg", ResName: "magic house", CliName: "issam", ResLoc: "lwiaam", CliLoc: "cite 6", ResNum: "0576439812", CliNum: "0553740984",isExpanded: false,),
             ]),
          ),
      ),
    );
  }
}