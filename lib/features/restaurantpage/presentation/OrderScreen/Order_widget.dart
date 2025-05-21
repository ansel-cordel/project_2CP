import 'package:flutter/material.dart';

class order extends StatefulWidget{
    final String ResPic;
    final String CliPic;
    final String ResName;
    final String CliName;
    final String ResLoc;
    final String CliLoc;
    final String ResNum;
    final String CliNum;

    const order({super.key,
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
  _orderState createState()=> _orderState();
}

class _orderState extends State<order>{
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    double a=MediaQuery.of(context).size.width;
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
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        Text(price,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black)),
      ],
    );
    } 
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        CircleAvatar(
                            backgroundColor:  const Color.fromARGB(55, 110, 110, 110),
                            radius: 42,
                            child: CircleAvatar(
                               radius: 35,
                               backgroundImage: AssetImage("img/${widget.ResPic}.jpg"),
                           ),
                        ),
                        SizedBox(width: a*0.02,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person,
                                size: a*0.065,
                                ),
                                Text(CliName,
                                style: TextStyle(
                                  fontSize: a*0.045,
                                  fontWeight: FontWeight.w800
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone_outlined,
                                size: a*0.06,
                                color: Colors.black,
                                ),
                                Text(CliNum,
                                style: TextStyle(
                                  fontSize: a*0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                    ],
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
              Text("Order List :",
              style: TextStyle(
                fontSize: a*0.06,
                fontWeight: FontWeight.w600
              ),
              ),
              buildItemRow("- pizza", "100 Da x 5"),
              buildItemRow("- Frit", "50 Da x 7"),
              buildItemRow("- soup", "150 Da x 3"),
              buildItemRow("- bourak", "20 Da x 12"),
              buildItemRow("- salade", "0 Da x 100"),
              Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Total :",
            style: TextStyle(
                fontSize: a*0.06,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
        Text("1000 da",
            style: TextStyle(
                fontSize: a*0.06,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ],
    )
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
                padding: EdgeInsets.symmetric(horizontal: a*0.02),
                  decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                    BorderRadius.vertical(
                        bottom:Radius.circular(16),
                    )
                ),
                child: Column(
                  children:[ 
                    Text("Picked By:",
              style: TextStyle(
                fontSize: a*0.05,
                fontWeight: FontWeight.w600
              ),
              ),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        CircleAvatar(
                            backgroundColor:  const Color.fromARGB(55, 110, 110, 110),
                            radius: a*0.08,
                            child: CircleAvatar(
                               radius: a*0.075,
                               backgroundImage: AssetImage("img/${widget.CliPic}.jpg"),
                           ),
                        ),
                        SizedBox(width: a*0.02,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.directions_car_filled_outlined,
                                size: a*0.045,
                                ),
                                Text(CliName,
                                style: TextStyle(
                                  fontSize: a*0.04,
                                  fontWeight: FontWeight.w800
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.phone_outlined,
                                size: a*0.045,
                                color: Colors.black,
                                ),
                                Text(CliNum,
                                style: TextStyle(
                                  fontSize: a*0.04,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ],
                        )
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: (){},
                          color: Colors.orange[800],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(a*0.5),
                          ),
                          height: MediaQuery.of(context).size.width*0.09,
                          child:Text("Confirm Order Pickup",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                          ),
                          ),
                          MaterialButton(
                          onPressed: (){},
                          color: Colors.grey[500],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(a*0.5),
                          ),
                          height: MediaQuery.of(context).size.width*0.09,
                          child:Text("Cancel",
                          style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width*0.04,
                              fontWeight: FontWeight.w600,
                              color: Colors.white
                          ),
                          ),
                          ),
                          ]
                    ),
              
                  Center(
                    child: MaterialButton(
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