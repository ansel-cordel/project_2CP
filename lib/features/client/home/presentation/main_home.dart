import 'package:flutter/material.dart';
import 'package:project_2cp/features/client/home/presentation/find_what_you_like.dart';
import 'package:project_2cp/features/client/home/presentation/our_restaurents.dart';
import 'package:project_2cp/features/client/home/presentation/todays_menu.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';
import 'package:project_2cp/features/client/home/presentation/todays_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
           Padding(
             padding:EdgeInsets.symmetric(horizontal: a*0.02),
             child: Search(),
           ),
           Padding(
             padding:EdgeInsets.only(left: a*0.04),
             child: TodaysMenuText(),
           ),
           TodaysMenuWidget(name:"pizza",price: 1500,restaurant:"Fancy Food Studious TM" ,image: "assets/pizza2.jpg",),
           Padding(
             padding:EdgeInsets.only(left: a*0.04),
             child: FindWhatYouLikeText(),
           ), 
           FindWhatYouLikeWidget(),
           Padding(
             padding: EdgeInsets.symmetric(horizontal: a*0.01),
             child: OurRestaurants(),
           ),
           ]),
      ),
    );
  }
}