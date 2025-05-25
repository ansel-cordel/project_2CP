import 'package:flutter/material.dart';
import 'package:project_2cp/features/client/home/presentation/find_what_you_like.dart';
import 'package:project_2cp/features/client/home/presentation/our_restaurents.dart';
import 'package:project_2cp/features/client/home/presentation/todays_menu.dart';
import 'package:project_2cp/core/widgets/search_widget.dart';
import 'package:project_2cp/features/client/home/presentation/todays_menu_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> _refreshPage() async {
    
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    double a = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        onRefresh: _refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: a*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: a * 0.02),
                child: const Search(),
              ),
              Padding(
                padding: EdgeInsets.only(left: a * 0.04),
                child: const TodaysMenuText(),
              ),
              const TodaysMenuWidget(
                name: "pizza",
                price: 1500,
                restaurant: "Fancy Food Studious TM",
                image: "assets/pizza2.jpg",
              ),
              Padding(
                padding: EdgeInsets.only(left: a * 0.04),
                child: const FindWhatYouLikeText(),
              ),
              const FindWhatYouLikeWidget(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: a * 0.01),
                child: const OurRestaurants(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
