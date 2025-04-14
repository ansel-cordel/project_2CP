import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_2cp/core/widgets/details.dart';


class FindWhatYouLike_text extends StatelessWidget{
  const FindWhatYouLike_text({super.key});

  @override
  Widget build(BuildContext context) {
    return 
         Row(
            mainAxisAlignment: MainAxisAlignment.start,
             children: [ Text("Find What You Like:",style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 22,
          ),
        ),
      ]
    );
  }
}

class FindWhatYouLike_widget extends StatefulWidget{
  const FindWhatYouLike_widget({super.key});

  @override
  _FindWhatYouLike_widgetState createState() => _FindWhatYouLike_widgetState();
}

class _FindWhatYouLike_widgetState extends State<FindWhatYouLike_widget>{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          finds(name:"Turksish BBQ",image:"assets/BBQ.jpg"),
          finds(name:"Pasta Salad",image:"assets/pasta_salad.jpg"),
          finds(name:"Salad",image:"assets/salamon.jpg"),
          finds(name:"cheese Pizza",image:"assets/pizza2.jpg"),
          finds(name:"Salamon",image:"assets/salamon.jpg"),
        ],
      ),
    );
  }
}

class finds extends StatefulWidget{
  final String image;
  final String name;
  const finds({super.key
  ,required this.name,
  required this.image
  });

    @override
  _findsState createState() => _findsState();
}

class _findsState extends State<finds>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.width * 0.5,
      child: MaterialButton(
        onPressed: (){
          Get.to(OrderDetail());
        },
        child:SizedBox(
          width: MediaQuery.of(context).size.width * 0.36,
      height: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            fit: StackFit.expand,
          children: [
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Image.asset(widget.name,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 15,
            child:
            Text(widget.name,
              style: TextStyle(
              color: Colors.white,
          ),),
          )
                  ],
                ),
        ),   
   ),
  );
 }
}