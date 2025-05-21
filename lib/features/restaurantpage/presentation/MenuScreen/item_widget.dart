import 'package:flutter/material.dart';

class Item extends StatefulWidget {
  final String ItemPicture;
  final int TotalOrders;
  final double Price;
  final double Rate;
  final String ItemName;
  final String ItemDescription;

  const Item({super.key,
    required this.ItemPicture,
    required this.TotalOrders,
    required this.Price,
    required this.Rate,
    required this.ItemDescription,
    required this.ItemName,
  });

  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  String ItemPicture="tnakt";
  String ItemName="I might just end it instead of doing this shit";
  String ItemDescription="tnakt";
  int TotalOrders=700;
  double Price=2400;
  double Rate=4.8;
  bool Switched=true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:MediaQuery.of(context).size.width * 0.03),
      height: MediaQuery.of(context).size.width * 0.451,
      child: Stack(
        children:[ Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [ 
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.02),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.width * 0.25,
                        child: Image.asset(
                          "img/${widget.ItemPicture}.jpg",//the item pic
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                SizedBox(
                  width:MediaQuery.of(context).size.width * 0.55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.ItemName,//the item name
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.0458,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
    
                      Text(
                        widget.ItemDescription,//the item descr
                      style: TextStyle(
                        fontSize:MediaQuery.of(context).size.width * 0.032,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[800],
                      ),
                      )
                    ],
                  ),
                ),
              ],
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children:[
                      Icon(Icons.shopping_bag_outlined,
                      size: MediaQuery.of(context).size.width * 0.05,
                      color: Colors.black,
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width *0.013,
                        left: MediaQuery.of(context).size.width * 0.013,
                        child: Icon(Icons.check,
                        size: MediaQuery.of(context).size.width * 0.028,
                        color: Colors.black,
                        ),
                      )
                      ]
                    ),
    
                    Text("+${widget.TotalOrders} Total Order",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w700,
                    ),
                    )
                  ],
                ),
    
                Text("${widget.Price} Da",
                style: TextStyle(
                  fontSize:MediaQuery.of(context).size.width * 0.038,
                  fontWeight: FontWeight.w700,
                ),
                )
              ],
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      size: MediaQuery.of(context).size.width * 0.055,
                    ),
                    Text("${widget.Rate} Current Rating",
                    style: TextStyle(
                      fontSize:MediaQuery.of(context).size.width * 0.038, 
                      fontWeight: FontWeight.w700,
                    ),
                    ),
                  ],
                ),
    
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Can order:",
                    style: TextStyle(
                      fontSize:MediaQuery.of(context).size.width * 0.038,
                      fontWeight: FontWeight.w500, 
                    ),
                    ),
                    Transform.scale(
                      scale: MediaQuery.of(context).size.width * 0.0019,
                      child: Switch(
                        value: Switched, onChanged:(value){
                        setState(() {
                          Switched = value;
                        });
                      },
                      activeColor: Colors.white,
                      activeTrackColor: Colors.orange[800],
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
    
        Positioned(
          top:MediaQuery.of(context).size.width*-0.02,
          right:MediaQuery.of(context).size.width*-0.02,
          child: IconButton(
            onPressed: (){},
            icon: Icon(
              Icons.edit_outlined,
              size: MediaQuery.of(context).size.width * 0.06,
              color: Colors.black,
            ),
          ),
        ),
        ]
      ),
    );
  }
}
