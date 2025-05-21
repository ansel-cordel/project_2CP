import 'package:flutter/material.dart';
import 'package:project_2cp/features/restaurantpage/presentation/search/if.dart';


class search extends StatefulWidget{
  const search({super.key});

  @override
  _searchState createState() => _searchState();
}

class _searchState extends State<search>{
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.5),
          color:const Color.fromARGB(255, 215, 215, 215)
        ),
        width: MediaQuery.of(context).size.height*1,
        height: MediaQuery.of(context).size.height*0.06,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height*0.006,
        ),
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*0.06)),
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [ 
            Text("Search for pizza....",
            style: TextStyle(
              color: const Color.fromARGB(211, 122, 122, 122),
              fontWeight: FontWeight.w400,
              fontSize: 18,
              ),
              ),
            Stack(
              children: [ 
                Icon(Icons.search,
                color:const Color.fromARGB(211, 122, 122, 122),
                ),
                Positioned(
                  top: -16,
                  right: 3,
                  left: -1,
                  child:
                  Image.asset('img/chef.jpg',
                    height: 40,
                    width: 10,
                    )),
                ]
            ),],
        ),
          onPressed:(){
            showSearch(context: context, delegate: Search());
        }),
   );
  }
}

class Search extends SearchDelegate {
  final List<Widget> searchResults = [
    items(rate: 4.5,itemName: "pizza",restName: "riad",price: 500,pic:"f2",),
    items(rate: 4.5,itemName: "pizza",restName: "riad",price: 500,pic:"f2",),
    items(rate: 4.5,itemName: "pizza",restName: "riad",price: 500,pic:"f2",),
    items(rate: 4.5,itemName: "pizza",restName: "riad",price: 500,pic:"f2",),
    items(rate: 4.5,itemName: "pizza",restName: "riad",price: 500,pic:"f2",),
    ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text("Results for: $query"),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   List<Widget> suggestions = searchResults.where((item) {
  if (item is items) {
    return item.itemName.toLowerCase().contains(query.toLowerCase());
  }
  return false;
}).toList();
    return GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: MediaQuery.of(context).size.height*0.01,
    crossAxisSpacing: MediaQuery.of(context).size.height*0.01,
    childAspectRatio: 2 / 2.8, // Tweak this for tile height
  ),
  itemCount: suggestions.length,
  itemBuilder: (context, index) {
    return GestureDetector(
      onTap: () {
        showResults(context);
      },
      child: suggestions[index],
    );
  },
);
  }
}