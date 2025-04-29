import 'package:flutter/material.dart';

class Orders extends StatefulWidget{
    final String ResPic;
    final String CliPic;
    final String ResName;
    final String CliName;
    final String ResLoc;
    final String CliLoc;
    final String ResNum;
    final String CliNum;

    const Orders({super.key,
    required this.ResPic,
    required this.CliPic,
    required this.ResName,
    required this.CliName,
    required this.ResLoc,
    required this.CliLoc,
    required this.ResNum,
    required this.CliNum,
    });


  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders>{
    bool isExpanded = false;
    String ResPic="img/blood.jpg";
    String CliPic="img/crip.jpg";
    String ResName="Blood";
    String CliName="Crip";
    String ResLoc="Idk where the bloods are tbh";
    String CliLoc="Idk where the crips are too";
    String ResNum=" 0553740984";
    String CliNum="0671895813 ";

  void toggleCard() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  Widget buildItemRow(String item, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(item,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
        Text(price,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[800])),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
      child: Column(
          children: [



              Container(
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius:   
                    BorderRadius.vertical(
                        top:Radius.circular(16),
                    )
                ),
                padding: EdgeInsets.only(top: 7,right: 10,left: 10,bottom: 3),
                child: Column(
                  children:[ 
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text("From:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                          ),
                          ),
                          Text("To:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                          ),
                          ),
                      ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        CircleAvatar(
                            backgroundColor:  const Color.fromARGB(55, 110, 110, 110),
                            radius: 42,
                            child: CircleAvatar(
                               radius: 35,
                               backgroundImage: AssetImage(widget.ResPic),
                           ),
                        ),

                        Text("- - - - - - -",
                        style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 35
                        ),
                        ),

                        CircleAvatar(
                            backgroundColor:  const Color.fromARGB(55, 110, 110, 110),
                            radius: 42,
                            child: CircleAvatar(
                               radius: 35,
                               backgroundImage: AssetImage(widget.CliPic),
                           ),
                        ),
                    ],
                  ),

                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Text(widget.ResName,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                          ),
                          ),
                          Text(widget.CliName,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                          ),
                          ),
                      ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                            width: MediaQuery.of(context).size.width*0.4,
                          child: Row(
                              children: [
                                  Icon(Icons.location_on_outlined,
                                  size: 18,
                                  weight: 17,
                                  color: Colors.grey[800],
                                  ),
                          
                                  Expanded(
                                    child: Text(widget.ResLoc,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600]
                                    ),
                                    ),
                                  )
                              ],
                          ),
                        ),

                        Container(
                            width: MediaQuery.of(context).size.width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Expanded(
                                    child: Text(widget.CliLoc,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey[600]
                                    ),
                                    ),
                                  ),

                                  Icon(Icons.location_on_outlined,
                                    size: 18,
                                    weight: 17,
                                    color: Colors.grey[800],
                                  ),
                              ],
                          ),
                        ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Container(
                            width: MediaQuery.of(context).size.width*0.4,
                          child: Row(
                              children: [
                                 Icon(Icons.local_phone_outlined,
                                    size: 18,
                                    weight: 17,
                                    color: Colors.grey[800],
                                  ),

                                  Text(widget.ResNum,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600]
                                  ),
                                  ),
                              ],
                          ),
                        ),

                        Container(
                            width: MediaQuery.of(context).size.width*0.4,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                  Text(widget.CliNum,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[600]
                                  ),
                                  ),

                                  Icon(Icons.local_phone_outlined,
                                    size: 18,
                                    weight: 17,
                                    color: Colors.grey[800],
                                  ),
                              ],
                          ),
                        ),
                    ],
                  ),

                  Center(
                    child: Text("Total: 1200 Da",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 20
                    ),
                    ),
                  ),  
                  ]
                ),
              ),




              Container(
                  height: 3,
                  color: Colors.grey[500],
              ),



// here is the middle part the expand and hide
           // here is the middle part the expand and hide
AnimatedSize(
  duration: Duration(milliseconds: 300),
  curve: Curves.easeInOut, // optional: add curve for smoothness
  child: isExpanded
      ? Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[300],
          child: Column(
            children: [
              buildItemRow("- pizza", "100 Da x 5"),
              buildItemRow("- Frit", "50 Da x 7"),
              buildItemRow("- soup", "150 Da x 3"),
              buildItemRow("- bourak", "20 Da x 12"),
              buildItemRow("- salade", "0 Da x 100"),
            ],
          ),
        )
      : SizedBox.shrink(), // << inside the child, not outside!
),

              


               Container(
                  height: 3,
                  color: Colors.grey[500],
              ),


// here is the lower part that has the buttons
              Container(
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.vertical(
                        bottom:Radius.circular(16),
                    )
                ),
                child: Column(
                  children:[ 
                    Center(
                    child: MaterialButton(
                        onPressed: (){},
                        color: Colors.orange[800],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(13),
                        ),
                        height: MediaQuery.of(context).size.width*0.09,
                        child:Text("Take the order",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width*0.04,
                            fontWeight: FontWeight.w600,
                            color: Colors.white
                        ),
                        ),
                        ),
                  ),
              
                  MaterialButton(
                    onPressed: toggleCard,
                    color: Colors.orange[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(isExpanded
                       ? Icons.keyboard_arrow_up
                       :Icons.keyboard_arrow_down,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.width*0.08,
                    ),
                    )
                  ]
                ),
              ),




          ],
      ),
    );
  }
    
}