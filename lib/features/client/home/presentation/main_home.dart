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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
             Search(),
             TodaysMenuText(),
             TodaysMenuWidget(name:"pizza",price: 1500,restaurant:"Fancy Food Studious TM" ,image: "assets/pizza2.jpg",),
             SizedBox(height: 10,),
             FindWhatYouLikeText(), 
             FindWhatYouLikeWidget(),
             SizedBox(height: 10,),
            OurRestaurants(),
             ]),
          ),
      ),
    );
  }
}