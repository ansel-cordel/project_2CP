import 'package:flutter/material.dart';

class type extends StatefulWidget{
  final String img;
  final String name;

  const type ({super.key, 
    required this.img,
    required this.name,
  });
  @override
  _typeState createState()=> _typeState();
}

class _typeState extends State<type>{
  bool check=false;
  String img="yetler";
  String name="yetler";
  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(bottom: a*0.006),
      height: a*0.4,
      width: a*0.33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(a*0.016)
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(a*0.016),
            child: Image.asset("img/${widget.img}.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            ),
          ),
          Container(
            height: a*0.4,
            width: a*0.33,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.black.withAlpha((1 * 250).round()),
                  Colors.transparent
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
                ),
            ),
          ),
          Positioned(
            left: a*0.01,
            bottom: a*0.01,
            child: SizedBox(
              width: a*0.23,
              child: Text(widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:TextStyle(
                fontSize: a*0.04,
                fontWeight: FontWeight.w500,
                color: Colors.white
              ),
              ),
            ),
          ),
          Positioned(
            bottom: a*-0.01,
            right: a*-0.01,
            child:Checkbox(
              value:check,
              onChanged:(bool? value){
                setState(() {
                  check=value!;
                });
              },
              activeColor: Colors.orange[800],

            ),
          )
        ],
      ),
    );
  }
  
}