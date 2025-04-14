import 'package:flutter/material.dart';
import 'package:project_2cp/features/home/presentation/find_what_you_like.dart';
import 'package:project_2cp/features/home/presentation/our_restaurents.dart';
import 'package:project_2cp/features/home/presentation/todays_menu.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';
import 'package:project_2cp/features/home/presentation/todays_menu_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
             search(),
             TodaysMenu_text(),
             TodaysMenuWidget(name:"PB & Pickle Sandwich",price: 1500,restaurant:"Fancy Food Studious TM" ,image: "assets/rich.jpg",),
             SizedBox(height: 10,),
             FindWhatYouLikeText(), 
             FindWhatYouLikeWidget(),
             SizedBox(height: 10,),
             ourrestaurants(),
             ]),
          ),
      ),
    );
  }
}