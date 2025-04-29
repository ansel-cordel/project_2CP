import 'package:flutter/material.dart';

class BestMenus_Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text("Best Menus:",
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.width*0.06,
        fontWeight: FontWeight.w900,
      ),
      ),
    );
  }
}

class item_widget extends StatefulWidget{
  final double rate;
  final String itemName;
  final String restName;
  final int price;
  final String pic;

  const item_widget({super.key,
    required this.rate,
    required this.itemName,
    required this.restName,
    required this.price,
    required this.pic
  });

  @override
  _item_widgetState createState() => _item_widgetState();
}

class _item_widgetState extends State<item_widget>{
  double rate=0.0;
  int num1=0;
  String ItemNAme="kaka";
    String RestName="ljijli";
    int price=0;
    @override
    Widget build(BuildContext context) {
      return SizedBox(
        height: MediaQuery.of(context).size.width*0.45,
        width: MediaQuery.of(context).size.width*0.5,
        child: Stack( 
        children: [
        Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(
              MediaQuery.of(context).size.width*0.05
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(
                        MediaQuery.of(context).size.width*0.05
                      )
                    ),
                    child: Image.asset(
                      "assets/${widget.pic}.jpg",
                      height:MediaQuery.of(context).size.width*0.22,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.width*0.02,
                    left: MediaQuery.of(context).size.width*0.02,
                    child: Card(
                      elevation: 2,
                      shadowColor: Colors.black,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical:MediaQuery.of(context).size.width*0.007,
                          horizontal:MediaQuery.of(context).size.width*0.015 
                        ),
                        decoration: BoxDecoration(
                          color: Colors.orange[800],
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.013),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "${widget.rate}",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: MediaQuery.of(context).size.width*0.027,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.01),
                            Icon(Icons.star, color: Colors.white, size: MediaQuery.of(context).size.width*0.034),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.width*0.16,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width*0.008,
                    left: MediaQuery.of(context).size.width*0.017,
                    bottom: MediaQuery.of(context).size.width*0.04,
                  ),
                  child:Row(
                    children: [
                         SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                           child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(widget.itemName,
                                  style: TextStyle(
                                    fontSize:MediaQuery.of(context).size.width*0.036, 
                                    fontWeight: FontWeight.w600
                                  ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("${widget.price} da" ,
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.width*0.042,
                                    fontWeight: FontWeight.w400
                                  ),
                                  ),
                                )
                              ],
                            ),
                         ),
                    ],
                  ), 
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.width*0.029,
          right: MediaQuery.of(context).size.width*0.029,
          child: SizedBox(
            height: MediaQuery.of(context).size.width*0.065,
            width: MediaQuery.of(context).size.width*0.065,
            child: FloatingActionButton(
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*0.1)) ,
              onPressed: () {},
              backgroundColor: Colors.orange[800],
              child: Icon(Icons.add, color: Colors.white,size: MediaQuery.of(context).size.width*0.05,),
            ),
          ),
        ),
              ],
              ),
      );
  }
}