import 'package:flutter/material.dart';

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
          finds(),
          finds(),
          finds(),
          finds(),
          finds(),
        ],
      ),
    );
  }
}

class finds extends StatefulWidget{
  const finds({super.key});

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
        onPressed: (){},
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
                child: Image.asset("assets/rich.jpg",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 18,
              left: 15,
            child:
            Text("PORNO!!!!",
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