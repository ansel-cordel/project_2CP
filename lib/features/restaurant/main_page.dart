import 'package:flutter/material.dart';
import 'package:gpt/homepage/restaurantPage/best_menus.dart';
import 'package:gpt/homepage/restaurantPage/profile_head.dart';
import 'package:gpt/homepage/restaurantPage/restau_info.dart';

class restaurant_page extends StatelessWidget{
  const restaurant_page ({super.key});
  @override
  Widget build(BuildContext context){
    return Column(
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
              item_widget(rate: 5, itemName: "the narator hhhhhhhhhhhhhhhh", restName: "nirvana", price: 450, pic:"namir")
            ],
          ),
        ),
      ],
    );
  }
  
}