import 'package:flutter/material.dart';

import 'package:project_2cp/features/restaurant/bestmenus.dart';
import 'package:project_2cp/features/restaurant/profile_head.dart';
import 'package:project_2cp/features/restaurant/restau_info.dart';

class restaurant_page extends StatelessWidget{
  const restaurant_page ({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.width*0.06,),
          ProfileHead(),
          RestauInfo(),
          Container(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.width*0.01,
              left: MediaQuery.of(context).size.width*0.04,
              ),
            child: Column(
              children: [
                BestMenus_Text(),
                item_widget(rate: 5, itemName: "cest une salad", restName: "nirvana", price: 450, pic:"salamon")
              ],
            ),
          ),
        ],
      ),
    );
  }
  
}