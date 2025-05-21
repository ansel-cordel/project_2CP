import 'package:flutter/material.dart';
import 'package:project_2cp/features/restaurantpage/presentation/ProfileScreen/food_types.dart/type.dart';
import 'package:project_2cp/features/restaurantpage/presentation/search/search_bar.dart';


class types extends StatelessWidget{
  const types({super.key});
  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: a*0.1  ,
          ),
          child: Column(
            children: [
              search(),
              SizedBox(
                height: a*0.01,
              ),
              Text("Select Your Restaurant Type",
              style: TextStyle(
                fontSize: a*0.06,
                fontWeight: FontWeight.w900
              ),
              ),
              SizedBox(
                height: a*0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  type(img: "f1",name:"pizza",),
                  type(img: "f2",name:"burger",),
                  type(img: "f1",name:"pizaa",),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}